<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>	
<%@page import="java.sql.Date"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터 추출
	request.setCharacterEncoding("UTF-8");	//코드에 한글 지원
	int custno = Integer.parseInt(request.getParameter("custno")); //setter에 저장할 데이터를 호출하여 변수에 저장합ㄴ디ㅏ.
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Date joindate = Date.valueOf(request.getParameter("joindate"));
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	//VO 객체에 바인딩(연결)
	MemberVO member = new MemberVO();	//객체를 생성합니다.
	member.setCustno(custno);			//setter 메소드를 이용하여 메모리에 저장
	member.setCustname(custname);
	member.setPhone(phone);
	member.setAddress(address);
	member.setJoindate(joindate);
	member.setGrade(grade);
	member.setCity(city);
	
	//DB에 반영
	MemberDao dao = new MemberDao();
	int n = dao.memberInput(member);
	
	//화면 이동
	if(n>0){
		response.sendRedirect("/view/memberList.jsp");	//조건이 참이면 memberList.jsp 파일로 이동합니다.
	}
	else{
%>
	<script>history.back();</script>	//이메소드는 브라우저가 세션 기록의 바로 뒤
										//페이지로 이동하도록 지시 합니다
<%
	}
%>