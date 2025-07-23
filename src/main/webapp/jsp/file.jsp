<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ファイル一覧</title>
<link href="./css/style.css" rel="stylesheet">
<script>
// 送信するかの確認メッセージを出し、OK なら true、NG なら false を返す
function submitCheck(){
 if(window.confirm("削除してよろしいですか？")){ // 確認ダイアログを表示
 return true; // 「OK」時は送信を実行
 } else{ // 「キャンセル」時の処理
 return false; // 送信を中止
 }
}
</script>
</head>
<body>
 <header>
 <h1>画像リスト 2</h1>
 </header>
 <main>
 <form method="post" action="delete" onSubmit="return submitCheck()">
 <div class="buttonArea">
 <button type="submit">削除</button>
 <a href="./html/uploadform.html"><button type="button">新規登録</button></a>
 </div>
 <table>
 <tr>
 <th>削除</th>
 <th>画像</th>
 <th>ファイル名</th>
 <tr>
 <%
 // 画像用フォルダのパスを取得するが、null ならアップロード用のサーブレットに戻す
 String path = (String) request.getAttribute("PATH");
 if (path == null) {
 request.getRequestDispatcher("upload").forward(request, response);
 return;
 }
 // ファイル一覧の取得（サーブレットから setAttribute で送られたものとする ）
 List<String> files = (List<String>) request.getAttribute("FILES");
 if (files != null) {
 for (String file : files) {
 String pathName = path + file;
 %>
 <tr>
 <td><input type="checkbox" name="check" value="<%=file %>"></td>
<td><img src="<%=pathName %>" alt="画像ファイル"></td>
<td><%=file %></td>
 </tr>
 <%
 }
 }
 %>
 </table>
 </form>
 </main>
</body>
</html>