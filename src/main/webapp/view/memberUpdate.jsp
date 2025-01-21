<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int custno = Integer.parseInt(request.getParameter("custno"));
	MemberDao dao = new MemberDao();
	MemberVO member = dao.getMember(custno);
%>
<jsp:include page="/master/header.jsp"></jsp:include>
<section>
	<h2>홈쇼핑 회원 수정</h2>
	<form action="memberUpdateProc.jsp" method="post" name="frm">
		<table width="60%">
			<tr>
				<td>회원번호(자동발생)</td>
				<td>
					<input type="number" value="<%=member.getCustno() %>" name="custno" id="custno" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td>
					<input type="text" value="<%=member.getCustname() %>" name="custname" id="custname">
				</td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td>
					<input type="text" value="<%=member.getPhone() %>" name="phone" id="phone">
				</td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td>
					<input type="text" value="<%=member.getAddress() %>" name="address" id="address">
				</td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td>
					<input type="date" value="<%=member.getJoindate() %>" name="joindate" id="joindate">
				</td>
			</tr>
			<tr>
				<td>고객등급</td>
				<td>
					<select name="grade" id="grade">
						<option value="0">등급선택</option>
						<option value="A" <%="A".equals(member.getGrade()) ? "selected":""%>>VIP</option>
						<option value="B" <%="B".equals(member.getGrade()) ? "selected":""%>>일반</option>
						<option value="C" <%="C".equals(member.getGrade()) ? "selected":""%>>직원</option>
					</select>
				</td>
			</tr>
				<tr>
				<td>도시코드</td>
				<td>
					<input type="text" value="<%=member.getCity() %>" name="city" id="city">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value=" 수 정 " onclick="return checkForm()">
					<input type="reset" value=" 다시조회 ">
			</tr>
		</table>
	</form>
</section>
<script>
	function checkForm(){
		if(document.querySelector("#custname").value=="") {
			alert("회원성명을 입력하세요.");
			document.querySelector(#custname).focus();
			return false;
		}
		if(document.querySelector("#phone").value=="") {
			alert("회원전화를 입력하세요.");
			document.querySelector(#phone).focus();
			return false;
		}
		if(document.querySelector("#address").value=="") {
			alert("회원주소를 입력하세요.");
			document.querySelector(#address).focus();
			return false;
		}
		if(document.querySelector("#joindate").value=="") {
			alert("가입일자를 입력하세요.");
			document.querySelector(#joindate).focus();
			return false;
		}
		if(document.querySelector("#grade").value=="") {
			alert("회원등급 입력하세요.");
			document.querySelector(#grade).focus();
			return false;
		}
	}
</script>
<jsp:include page="/master/footer.jsp"></jsp:include>