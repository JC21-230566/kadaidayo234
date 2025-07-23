<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>画像一覧</title>
<style>
* {
margin: 0;
padding: 0;
}
table {
border-collapse: collapse;
}
table, td, th {
border: solid 1px #000000;
}
td, th {
padding: 5px 10px;
}
img {
max-height: 100px;
}
header {
background-color: #336633;
}
h1 {
color: #ffffff;
padding-top: 20px;
padding-bottom: 10px;
text-align: center;
}
main {
width: 600px;
margin: 20px auto;
}
.buttonArea {
margin-top: 10px;
margin-bottom: 10px;
}
</style>
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
<h1>画像リスト</h1>
</header>
<main>
<form method="post" action="./delete" onSubmit="return submitCheck()">
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
// 画像用フォルダのパス
String imagePath = "images/";
// ファイル名の一覧を取得
File fileObject = new File(getServletContext().getRealPath(imagePath));
File[] files = fileObject.listFiles();
if (files != null) {
for (File file : files) {
String name = file.getName();
String path = imagePath + name;
%>
<tr>
<td><input type="checkbox" name="check" value="<%=name %>"></td>
<td><img src="<%=path %>" alt="画像ファイル"></td>
<td><%=name %></td>
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
 
 

