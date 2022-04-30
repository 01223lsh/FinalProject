package funding.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import funding.dto.NoticeFile;

public class DownloadView extends AbstractView {

	@Autowired private ServletContext context;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//모델값 가져오기
		NoticeFile file = (NoticeFile) model.get("downFile");
		
		//업로드된 파일의 객체
		File src = new File(context.getRealPath("upload"), file.getFileStorage());
		
		//서버의 파일 입력 스트림
		FileInputStream in = new FileInputStream(src);
		
		
		//응답 헤더 설정
		response.setContentType("application/octet-stream");
		response.setContentLength((int) src.length());
		response.setCharacterEncoding("UTF-8");
		
		String outputName = URLEncoder.encode(file.getFileOrigin(), "UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		
		
		//서버의 응답 출력 스트림
		OutputStream out = response.getOutputStream();
		
		//클라이언트 쪽으로 파일 전송
		FileCopyUtils.copy(in, out);
		
	}
	
}



















