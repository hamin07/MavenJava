package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import common.DBUtils;
import vo.MemberMoneyVO;
import vo.MemberVO;

public class MemberDao {

       public ArrayList<MemberVO> memberList(){
		
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"select custno, custname, phone, address, joindate, \r\n"
					+ "	case when grade ='A' then 'VIP'\r\n"
					+ "		 when grade = 'B' then '일반'\r\n"
					+ "		 when grade = 'C' then '직원'\r\n"
					+ "	end grade, city\r\n"
					+ "from T1_MEMBER order by custno"
					);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
				list.add(vo);
			}
                       rs.close();
                       ps.close();
                       con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return list;
	}
	
       public ArrayList<MemberMoneyVO> memberMoneyList(){
		ArrayList<MemberMoneyVO> list = new ArrayList<MemberMoneyVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"select A.custno, A.custname, \r\n"
					+ "	case when A.grade='A' then 'VIP'\r\n"
					+ "		 when A.grade='B' then '일반'\r\n"
					+ "		 when A.grade='C' then '직원'\r\n"
					+ "	end grade, sum(B.price) price\r\n"
					+ "from T1_MEMBER A\r\n"
					+ "	join T1_MONEY B on A.custno = B.custno \r\n"
					+ "group by A.custno, A.custname, A.grade\r\n"
					+ "order by price desc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberMoneyVO vo = new MemberMoneyVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setGrade(rs.getString("grade"));
				vo.setPrice(rs.getInt("price"));
				list.add(vo);
			}
                       rs.close();
                       ps.close();
                       con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;	} // memberMoneyList()메소드 끝
      public int getMaxCustNo() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int custno=0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"select max(custno)+1 custno\r\n"
					+ "from T1_MEMBER");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				custno = rs.getInt("custno");
			}
                       rs.close();
                       ps.close();
                       con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return custno;
	} // getMaxCustNo()메소드 끝
	
	public int memberInput(MemberVO member){
		Connection con = null;
		PreparedStatement ps = null;
		int n =0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("insert into member_tbl_02 values(?,?,?,?,?,?,?)");
			
			ps.setInt(1, member.getCustno());
			ps.setString(2, member.getCustname());
			ps.setString(3, member.getPhone());
			ps.setString(4, member.getAddress());
			ps.setDate(5, member.getJoindate());
			ps.setString(6,member.getGrade());
			ps.setString(7, member.getCity());
			n = ps.executeUpdate();

			if(n>0) {
				con.commit();
			}
                        ps.close();
                        con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	} //memberInput()메소드 끝

	public MemberVO getMember(int custno) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVO vo = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select * from T1_MEMBER where custno=?");
			ps.setInt(1, custno);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
			}
                       rs.close();
                       ps.close();
                       con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	} //getMember() 메소드 끝
	

	public int memberUpdate(MemberVO member) {
		Connection con = null;
		PreparedStatement ps = null;
		int n =0;
		
		try {
			con = DBUtils.getConnection();
                         ps = con.prepareStatement(
					"update member_tbl_02 " 
					+ " set custname=?, phone =?, address=?, joindate=?, "
					+ " grade=?, city=? "
					+ " where custno=? " );
			ps.setString(1, member.getCustname());
			ps.setString(2, member.getPhone());
			ps.setString(3, member.getAddress());
			ps.setDate(4, member.getJoindate());
			ps.setString(5, member.getGrade());
			ps.setString(6, member.getCity());
			ps.setInt(7, member.getCustno());
			
			n = ps.executeUpdate();
			
			if(n>0) {
				con.commit();
			}
                        ps.close();
                        con.close();
		}catch(Exception e) {
			e.printStackTrace();
	        }
		return n;
       }  //memgerUpdate() 메소드 끝

	
     public int memberDelete(int custno) {
		Connection con = null;
		PreparedStatement ps = null;
		int n=0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("delete from T1_MEMBER where custno = ?");
			ps.setInt(1, custno);
			n = ps.executeUpdate();
			if(n>0) {
				con.commit();
			}
                        ps.close();
                        con.close();
                        
		}catch(Exception e) {
			e.printStackTrace();
		}
		return n;
	} //memberDelete() 메소드 끝
}