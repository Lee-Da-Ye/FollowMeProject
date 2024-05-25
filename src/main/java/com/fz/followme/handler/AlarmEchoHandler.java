package com.fz.followme.handler;



import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fz.followme.dao.NotificationDao;
import com.fz.followme.dto.MemberDto;
import com.fz.followme.dto.NotificationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AlarmEchoHandler extends TextWebSocketHandler {
	

	@Autowired
	private NotificationDao notiDao;
	public void setAlarmDao(NotificationDao notiDao) {
		this.notiDao = notiDao;
	}
	// sessionList : 현재 웹소켓과 연결된 클라이언트들을 저장해놓는 리스트
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
	/**
	 * 1) afterConnectionEstablished : 클라이언트와 연결되었을 때 처리할 내용을 정의
	 * 
	 * @param session - 현재 웹소켓과 연결된 클라이언트 정보를 가지고 있는 객체
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session);
		log.debug("연결 성공");

	}
	
	@Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
                    
    }
	
	/**
	 * 3) afterConnectionClosed : 클라이언트와 연결이 끊겼을 때 처리할 내용을 정의
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		log.debug("연결 끊김");
	}
	
	public List<WebSocketSession> getSessionList(){
		
		return sessionList;
	}
	
    public void send(String alarmMessage) throws IOException {
        TextMessage message = new TextMessage(alarmMessage);
        for (WebSocketSession session : sessionList) {
            session.sendMessage(message);
        }
    }
    
    public void broadcastMessageToUser(HttpSession httpSession, TextMessage message) throws Exception {
        MemberDto loginUser = (MemberDto) httpSession.getAttribute("loginUser");
        String memNo = loginUser.getMemNo();

        for (WebSocketSession session : sessionList) {
            String sessionMemNo = getUserIdFromSession(session);
            if (memNo.equals(sessionMemNo)) {
                List<NotificationDto> notiDto = new ArrayList<>();
                notiDto = notiDao.selectList(memNo);
                
                log.debug("{}", notiDto);
                
                for(NotificationDto alarm : notiDto) {
                    
                	String notiType = alarm.getNotiType();
                	String createDate = alarm.getCreateDate();
                    String notiMsg = alarm.getNotiMsg();
                    
                    
                        if(notiType.equals("Y") || notiType.equals("N")) {
                        	notiType = "전자문서";                        	
                        }else if(notiType.equals("1") || notiType.equals("2")) {
                        	notiType = "근태알림";
                        }else if(notiType.equals("M")) {
                        	notiType = "메일수신";
                        }else if(notiType.equals("G")) {
                        	notiType = "쪽지수신";
                        }
                    
                    
                    message = new TextMessage(notiType + "/" + createDate + "/" + notiMsg + "/");            	
	                session.sendMessage(message);
                }
            }
            
        }
    }

    private String getUserIdFromSession(WebSocketSession session) {
        MemberDto loginUser = (MemberDto) session.getAttributes().get("loginUser");
        return loginUser.getMemNo();
    }
    
	
	// 알람용 핸들러에서 websockerSessionLIst를 반환하는 get~~~ 메소드 작성해두기 => 그래야 어떠한 컨트롤러든 웹소켓에 연결된 사원들에 접근할 수 있음
		// 전자결재 등록시 (전자결재 controller) => get~~~ 메소드 호출해서 sessionLIst받아와서 각 기능안에서 성공시 for문돌려서 target에게 메세지 발송
		// 예약시 (예약관련 controller)
		// .... 
	// 알람용	클래스 컨트롤러 만들어놓기. 알람리스트 조회, 알람읽음처리용 메소드, 알람삭제용 메소드 
		   
	
	
}
