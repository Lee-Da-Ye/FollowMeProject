package com.fz.followme.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {
	
	public Map<String, String> fileUpload(MultipartFile uploadFile, String folderName){
		
		// 전달된 파일 업로드 처리 
		// 1) 업로드시킬 폴더 (외부경로 : /upload/profile|board/yyyy/MM/dd)
		String filePath = "/upload/" + folderName + new SimpleDateFormat("/yyyy/MM/dd").format(new Date());
		
		File filePathDir = new File(filePath);
		if(!filePathDir.exists()) {
			filePathDir.mkdirs();
		}
		
		// 2) 파일명 수정 작업 (랜덤값.기존확장자)
		String originalName = uploadFile.getOriginalFilename();
		String ext = originalName.endsWith(".tar.gz") ? ".tar.gz" 
													  : originalName.substring(originalName.lastIndexOf("."));
		String filesystemName = UUID.randomUUID().toString().replace("-", "") + ext;
		
		// 3) 전달된 첨부파일을 1번과정의 폴더에 2번과정의 파일명으로 변환처리해서 업로드 
		try {
			uploadFile.transferTo(new File(filePathDir, filesystemName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		// 4) db에 기록시 필요한 데이터 다시 반환해주기 (Map 담아서)
		Map<String, String> map = new HashMap<>();
		map.put("filePath", filePath);
		map.put("originalName", originalName);
		map.put("filesystemName", filesystemName);
		
		return map;
	}
	
	// IntpueStream을 사용한 파일 업로드 처리
	public Map<String, String> fileUpload(InputStream inputStream, String originalName, String folderName){
		String filePath = "/upload/" + folderName + new SimpleDateFormat("/yyyy/MM/dd").format(new Date());
		
		File filePathDir = new File(filePath);
		if(!filePathDir.exists()) {
			filePathDir.mkdir();
		}
		
		String ext = originalName.endsWith(".tar.gz") ? ".tar.gz"
													  : originalName.substring(originalName.lastIndexOf("."));
		String filesystemName = UUID.randomUUID().toString().replace("-", "") + ext;
		
		File outputFile = new File(filePathDir, filesystemName);
		try (FileOutputStream outputStream = new FileOutputStream(outputFile)) {
			byte[] buffer = new byte[1024];
			int bytesRead;
			
			while((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		
		Map<String, String> map = new HashMap<>();
		map.put("filePath", filePath);
		map.put("originalName", originalName);
		map.put("filesystemName", filesystemName);
		
		return map;
	}
	
	
	
	// 파일 삭제 처리
    public void deleteFile(String filePath) {
        File file = new File(filePath);
        if(file.exists()) {
            file.delete();
        }
    }

}
