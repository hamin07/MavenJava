<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
       //파라미터 추출
	request.setCharacterEncoding("utf-8"); //서블릿으로 넘어오는 파라미터를 utf-8로 출력한다는 문장
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Date joindate = Date.valueOf(request.getParameter("joindate"));
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");	
	
        //VO 객체에 데이터 바인딩
	MemberVO member = new MemberVO();
	member.setCustno(custno);
	member.setCustname(custname);
	member.setPhone(phone);
	member.setAddress(address);
	member.setJoindate(joindate);
	member.setGrade(grade);
	member.setCity(city);	
	MemberDao dao = new MemberDao();
	int n = dao.memberUpdate(member);
	


        // 화면이동
	if(n>0){	response.sendRedirect("/view/memberList.jsp");}
	else{
%>
	<script>	history.back();</script>
<%	} %>