package com.fz.followme.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fz.followme.dto.AssetDto;
import com.fz.followme.dto.AssetReservationDto;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.PageInfoDto;
import com.fz.followme.handler.AlarmEchoHandler;
import com.fz.followme.service.AssetService;
import com.fz.followme.service.ReservationService;
import com.fz.followme.util.PagingUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/asset")
@Controller
public class AssetController {

	private final AssetService assetService;
	private final ReservationService reservationService;
	private final PagingUtil pagingUtil;
	
	private final AlarmEchoHandler handler;

	// * 관리자 차량관리 -------------------------------------------------------
	@RequestMapping("/carsReservationManager.page")
	public ModelAndView carsReservationManager(@RequestParam(value="page", defaultValue="1") int currentPage
			                             , HttpSession session
			                             , ModelAndView mv) {
		
		// 차량이용내역 조회, 페이징
		int listCount = assetService.selectCarReservationListCount();
		PageInfoDto pi = pagingUtil.getPageInfoDto(listCount, currentPage, 5, 10);
		List<AssetReservationDto> rList = assetService.selectCarReservationList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("rList", rList)
		  .setViewName("assetManagement/carsReservationManager");
		
		// 법인차량 목록 불러오기
		List<AssetDto> carlist = assetService.selectcarList();
		session.setAttribute("carlist", carlist);
		
		for(AssetDto ad:carlist) {
			if(ad.getStatus().equals("Y")) {
				ad.setStatus("이용가능");
			}else if(ad.getStatus().equals("N")) {
				ad.setStatus("이용불가");
			}
		}
		
		session.setAttribute("carlist", carlist);
		
		return mv;
	}
	
	
	
	// 차량등록
	@PostMapping("/insertcar.do")
	public String insertCar(AssetDto ad,
			                RedirectAttributes redirectAttributes) {
		
		log.debug("조건 수행 전 ad : {}", ad);
		
		int result = assetService.insertCar(ad);
		
		if(result > 0) {
			redirectAttributes.addFlashAttribute("alertMsg", "차량 등록에 성공하였습니다.");
		}else {
			redirectAttributes.addFlashAttribute("alertMsg", "차량 등록에 실패하였습니다. 다시 확인해 주십시오.");
		}
		
		log.debug("조건 수행 후 ad : {}", ad);
		log.debug("result : {}", result);
		
		return "redirect:/asset/carsReservationManager.page";
	}
	
	
	// 차량 상세조회
	@ResponseBody
	@PostMapping(value="/detailCar.do", produces="application/json; charset=utf-8")
	public AssetDto ajaxSelectCar(int no) {
		return assetService.selectCar(no);
	}
	
	
	// 차량 등록정보 수정
	@ResponseBody
	@PostMapping(value="/modifycar.do", produces="application/json; charset=utf-8")
	public int ajaxmodifyCar(AssetDto ad,
							 HttpSession session) {
		log.debug("ad : {}", ad);
		
		int result = assetService.updatecar(ad);
		
		if(result > 0) {
			// 수정하고 업데이트 세션에 갱신
			session.setAttribute("selectCar", assetService.selectCar(ad.getAssetNo()));
		}
		
		
		return result;
	}
	
	
	// 선택 차량 삭제
	@ResponseBody
	@GetMapping(value="/deletecar.do")
	public int deleteCar(int no) {
		int result = assetService.deleteCar(no);
		return result;
	}
	
	// 엑셀 다운로드
	@PostMapping("/excelDownload")
	 public ResponseEntity<byte[]> excelDownload(@RequestBody List<List<String>> data) throws IOException {
		// 엑셀 워크북 생성
		 Workbook workbook = new XSSFWorkbook();
	     Sheet sheet = workbook.createSheet("Data");
		
		// 데이터를 엑셀에 기록하는 작업
        for (int i = 0; i < data.size(); i++) {
            List<String> rowData = data.get(i);
            Row row = sheet.createRow(i);
            for (int j = 0; j < rowData.size(); j++) {
                Cell cell = row.createCell(j);
                cell.setCellValue(rowData.get(j));
            }
        }
		
		// 엑셀파일을 byte 배열로 변환하여 HTTP 응답으로 반환
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        workbook.write(out);
        byte[] bytes = out.toByteArray();
        workbook.close();
		
        return ResponseEntity
                .ok()
                .contentLength(bytes.length)
                .header("Content-Disposition", "attachment; filename=data.xlsx")
                .body(bytes);
	
	}
	
	
	 
	 // 차량이용내역 선택 삭제
	 @ResponseBody
	 @PostMapping(value="/deletersvn.do", produces ="application/json; charset=utf-8")
	 public int deleteRsvnList(@RequestParam("checkedRsvnStr") int[] checkedRsvn) {
		 
		 log.debug("checkedRsvn:{}", checkedRsvn);
		 return assetService.deleteRsvnList(checkedRsvn);
	 }
	 
	 
	 
	 
	
	
	// --------------------------------------------------------------------
	
	
	// * 사용자 차량예약 --------------------------------
	@RequestMapping("/carsReservation.page")
	public String carsReservation(HttpServletRequest request, HttpSession session) {
		
		List<AssetDto> carlist = assetService.selectcarList();
		session.setAttribute("carlist", carlist);
		
		MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
		session.setAttribute("loginUser", loginUser);
		
		for(AssetDto ad:carlist) {
			if(ad.getStatus().equals("Y")) {
				ad.setStatus("이용가능");
			}else if(ad.getStatus().equals("N")) {
				ad.setStatus("이용불가");
			}
		}
		session.setAttribute("carlist", carlist);
		
		return "assetManagement/carsReservation";
	}
	
	
	// * 차량 예약하기
	@PostMapping(value = "/insertrsvncar.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public int insertRsvnCar(@RequestBody AssetReservationDto ard) {
		
		//log.debug("ard : {}", ard);
		
		return reservationService.addReservation(ard);
	}
	
	
	
	// * 예약 차량 목록 조회
	@GetMapping(value = "/reservationlist.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<AssetReservationDto> ajaxSelectListReservationCar(HttpSession session, HttpServletRequest request,
															  String rsvnDate ){
		
		List<AssetReservationDto> dList = assetService.selectDateList(rsvnDate);
		MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
		session.setAttribute("loginUser", loginUser);
		//log.debug("dList : {}", dList);
		
		return dList;
	}
	
	
	// * 예약 선택 삭제
	@GetMapping(value="/deletereservationcar.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public int deleteReservationCar(@RequestParam("checkedRsvnStr") int[] checkedRsvn) {
		log.debug("chedckedRsvn :{}", checkedRsvn);
		return assetService.deleteRsvnListMember(checkedRsvn);
	}
		
	
	// ------------------------------------------------------
	
	
	
	
	
	
	// * 관리자 자리 관리 -----------------------------------------------------
	@RequestMapping("/seatReservationManager.page")
	public String seatReservationManager() {
		return "assetManagement/seatReservationManager";
	}
	
	
	
	// * 사무실자리 예약 조회,상세 조회 (관리자)
	@ResponseBody
	@GetMapping(value="/searchlistseat.do", produces="application/json; charset=utf-8")
	public List<AssetReservationDto> ajaxSearchListSeat(String rsvnDate, HttpSession session) {
		List<AssetReservationDto> slist = assetService.selectSeatList(rsvnDate);
		
		return slist;
	}
	
	
	// * 사무실 자리 상태 변경 (관리자)
	@PostMapping("/modifyseat.bo")
	@ResponseBody
	public int ajaxUpdateStatusSeat(AssetDto ad) {
		//log.debug("ad : {}", ad);
		int result =  assetService.updateStatusSeat(ad);
		return result;
	}
	
	
	
	
	// -------------------------------------------------------------------
	
	
	
	
	// * 사용자 사무실자리예약 ---------------------------------------------------
	@RequestMapping("/seatReservation.page")
	public String seatReservation(HttpServletRequest request, HttpSession session) {
		MemberDto loginUser = (MemberDto)request.getSession().getAttribute("loginUser");
		session.setAttribute("loginUser", loginUser);
		return "assetManagement/seatReservation";
	}
	
	
	
	// * 예약내역 조회
	@GetMapping(value="/selectlistseat.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<AssetReservationDto> selectReservationList(String rsvnDate){
		
		List<AssetReservationDto> rlist = assetService.selectSeatList(rsvnDate);
		//int seatCount = assetService.selectSeatCount();
		return rlist;
	}
	
	// * 좌석예약
	@PostMapping(value="/insertrsvnseat.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String,String>> addReservation(@RequestBody AssetReservationDto ard, HttpSession session) {
		Map<String, String> response = new HashMap<>();
	    try {
	        // 사용자의 예약 여부 확인
	    	 System.out.println("Checking reservation for: " + ard);
	        int hasReservation = reservationService.hasReservation(ard);
	        System.out.println("Reservation check result: " + hasReservation);
	        
	        if (hasReservation > 0) { // 기존 예약이 있는 경우
	        	response.put("message", "이미 예약이 존재합니다."); // 예약이 이미 존재함을 클라이언트에게 알림
	            return new ResponseEntity<>(response, HttpStatus.CONFLICT); 
	        }
	        
	        // 없을경우 예약 처리
	        int result = reservationService.addReservation(ard);
	        System.out.println("Reservation add result: " + result);
	        response.put("message", "예약에 성공하였습니다.");
	        
			MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
	        String memNo = loginUser.getMemNo();
			
	        TextMessage message = new TextMessage("성공");
        	handler.broadcastMessageToUser(memNo, message);
	        
	        
	        return new ResponseEntity<>(response, HttpStatus.OK);
	        
	    } catch (DataAccessException e) {
	    	e.printStackTrace();
	    	response.put("message", "중복된 예약이 있습니다.");
	        return new ResponseEntity<>(response, HttpStatus.CONFLICT);
	        
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	response.put("message", "예약 처리 중 오류가 발생했습니다.");
	        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
		

	
	// * 좌석삭제
	@GetMapping("/deletereservationseat.do")
	public String deleteReservationSeat(int no, RedirectAttributes redirectattributes) {
		int result = assetService.deleteReservationSeat(no);
		
		if(result > 0) {
			redirectattributes.addFlashAttribute("alertMsg", "예약이 성공적으로 삭제되었습니다.");
		}else {
			redirectattributes.addFlashAttribute("alsertMsg", "예약삭제에 실패하였습니다.");
		}
		
		return "redirect:/asset/seatReservation.page";
	}
	
	
	// -------------------------------------------------------------------
	
	
	//----------------------------------------------
	
	
}
