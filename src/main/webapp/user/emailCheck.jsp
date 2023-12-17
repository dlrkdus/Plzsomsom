<%@page import="model.service.MailSendService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script>
function confirmEmail(emailconfirm, authNum){
   //입력한 값이 없거나, 인증코드가 일치하지 않을 경우
   if(!emailconfirm || emailconfirm != authNum){
      alert("인증번호가 잘못되었습니다.");
      emailconfirm = "";
      self.close();
   }else if(emailconfirm == authNum){ //인증코드가 일치하는 경우
      alert("인증되었습니다!");
      emailconfirm = "";
      opener.document.form.regist.disabled = false;
      self.close();
   }
}
</script>
<title>이메일 인증</title>
</head>
<body>
<%
   String email = request.getParameter("email");
   
   String[] address = email.split("@");
   String email1 = address[0];
   String email2 = address[1];
   String authNum = null;
   
   if(email2.equals("dongduk.ac.kr")){
      MailSendService emailConfirm = new MailSendService();
      authNum = emailConfirm.connectEmail(email);
   }else{
%>
<script>
   alert("동덕여자대학교 웹메일로만 가입이 가능합니다.");
   self.close();
</script>
<%
   }
%>
<form method="post" action="" name="emailCheck">
   <table>
      <tr>
         <th colspan="2">인증번호를 입력하세요.</th>
      </tr>
      <tr>
         <td>
            <input type="text" name="emailconfirm">
         </td>
         <td>
            <input type="button" value="확인" onClick="confirmEmail(emailCheck.emailconfirm.value, <%=authNum %>)">
         </td>
      </tr>
   </table>
</form>
</body>
</html>