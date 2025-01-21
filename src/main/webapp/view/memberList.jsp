<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	ArrayList<MemberVO> list = dao.memberList();
%>

<jsp:include page="/master/header.jsp"></jsp:include>
<section>
	<h2>회원목록조회/수정</h2>
	<table>
		<%
			if(list != null) {
				%>
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>회원전화</td>
					<td>회원주소</td>
					<td>가입일자</td>
					<td>고객등급</td>
					<td>거주지역</td>
					<td>삭제여부</td>
				</tr>
				<%
				for(MemberVO member : list) {
					%>
					<tr>
						<td><a href="/view/memberUpdate.jsp?custno=<%=member.getCustno() %>"><%=member.getCustno() %></a></td>
						<td><%=member.getCustname() %></td>
						<td><%=member.getPhone() %></td>
						<td><%=member.getAddress() %></td>
						<td><%=member.getJoindate() %></td>
						<td><%=member.getGrade() %></td>
						<td><%=member.getCity() %></td>
						<td><a href="/view/memberDelete.jsp?custno=<%=member.getCustno() %>">삭제</a></td>
					</tr>
				}
			<% } %>
	</table>
	<%
	}else{
		out.print("등록된 회원 정보가 없습니다.");
		}
		%>
</section>




<jsp:include page="/master/footer.jsp"></jsp:include>