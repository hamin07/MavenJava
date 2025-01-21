<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	int custno = dao.getMaxCustNo();
%>
<jsp:include page="/master/header.jsp"></jsp:include>
<section>
	<h2>홈쇼핑 회원 등록</h2>
	<form action="memberInputProc.jsp" menthod="post" name="frm">
	<table>
	<tr>
		<td>회원번호(자동발생)</td>
		<td style="text-align:left,padding-left:10px,">
		<input type="text" value="<%=custno%>" name="custno" id="custno" readonly="readonly">
	</tr>
	<tr>
		<td>회원성명</td>
		<td style="text-align:left,padding-left:10px,">
		<input type="text" name="custname" id="custname">
	</tr>
	<tr>
		<td>회원전화번호</td>
		<td style="text-align:left,padding-left:10px,">
		<input type="text" name="phone" id="phone">
	</tr> 
	<tr>
		<td>회원주소</td>
		<td style="text-align:left,padding-left:10px,">
		<input type="text" name="address" id="address">
	</tr>
	<tr>
		<td>가입일자</td>
		<td style="text-align:left,padding-left:10px,">
		<input type="text" name="joindate" id="joindate">
	</tr>
	<tr>
		<td>고객등급[A:VIP, B:이반, C:직원]</td>
		<td style="text-align:left,padding-left:10px">
		<select id="grade" name="grade">
			<option value="O">회원등급선택</option>
			<option value="A">VIP</option>
			<option value="B">일반</option>
			<option value="C">직원</option>
			
		</select>
		</td>
	</tr>
	<tr>
		<td>도시코드
		<td style="text-align:left,padding-left:10px,">
			<input type="text" name="city" id="city">
			</td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="submit" value="가입하기" onclick="return checkFron()">
	</td>
	</tr>
	</table>
	</form>
</section>
<script>
	function checkForm() {
		if(document.querySelector("#custname").value==""){
			alert("회원성명을 입력하세요.");
			document.querySelector("#custname").focus();
			return false;
		}
		if(document.querySelector("#phone").value==""){
			alert("회원전화를 입력하세요.");
			document.querySelector("#phone").focus();
			return false;
		}
		if(document.querySelector("#address").value==""){
			alert("회원주소를 입력하세요.");
			document.querySelector("#address").focus();
			return false;
		}
		if(document.querySelector("#joindate").value==""){
			alert("가입일자를 입력하세요.");
			document.querySelector("#joindate").focus();
			return false;
		}
		if(document.querySelector("#grade").value==""){
			alert("회원등급 입력하세요.");
			document.querySelector("#grade").focus();
			return false;
		}
		if(document.querySelector("#city").value==""){
			alert("도시코드를 입력하세요.");
			document.querySelector("#city").focus();
			return false;
		}
	}
</script>
<jsp:include page="/master/footer.jsp"></jsp:include>