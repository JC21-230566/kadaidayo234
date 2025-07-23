package Upload;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/delete")
public class FileDelete extends HttpServlet {
 private static final long serialVersionUID = 1L;
 
 final private String IMAGEPATH = "images/";
 
 public FileDelete() {
 super();
 }
 // GET 送信された場合は、uploadfile.jsp へ遷移する
 protected void doGet(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException {
 request.getRequestDispatcher("./jsp/uploadfile.jsp").forward(request, response);
 }
 // POST 送信された場合は削除処理を行う
 protected void doPost(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException {
 request.setCharacterEncoding("utf-8");
 response.setCharacterEncoding("utf-8");
 
 String[] files = request.getParameterValues("check");
 if (files != null) {
 for(String file: files) {
 String svPath = getServletContext().getRealPath(IMAGEPATH + file);
 Path p = Paths.get(svPath);
 Files.delete(p);
 }
 }
 // uploadfile.jsp へ遷移するために doGet へ移動する
 doGet(request, response);
 }
}
