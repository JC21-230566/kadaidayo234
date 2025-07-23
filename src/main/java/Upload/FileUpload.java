package Upload;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@WebServlet("/upload")
@MultipartConfig
public class FileUpload extends HttpServlet {
 private static final long serialVersionUID = 1L;
 final private String IMAGEPATH = "images/"; // 保存するパス
 public FileUpload() {
 super();
 }
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 // JSP へ遷移する
 request.getRequestDispatcher("./jsp/uploadfile.jsp").forward(request, response);
 }
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
 request.setCharacterEncoding("utf-8");
 response.setCharacterEncoding("utf-8");
 //--- アップロードされたファイルを保存する
 // 送信された情報を首位得する
 Part part = request.getPart("upfile");
 // 送信時に選択したファイルの名称を取得する
 String fileName = part.getSubmittedFileName();
 // OS で使うパスを使って、ファイルを保存する位置も含めたファイル名を設定する
 // ここでは、実行時のフォルダ内にある images フォルダに保存する
 String svPath = getServletContext().getRealPath(IMAGEPATH);
 // 保存するパスが存在するかを調べて、存在しなければ作成する。
 File f = new File(svPath);
 if (!f.exists()) {
 f.mkdir();
 }
 // 保存
 part.write(svPath + fileName);
 doGet(request, response);
 }
}
