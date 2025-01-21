package vo;

import java.sql.Date;

public class MemberMoneyVO {
	private int custno;
	private int saleno;
	private int pcost;
	private int amount;
	private int price;
	private String pcode;
	private Date date;
	private String grade;
	private String custname;
	
	
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getStr1() {
		return str1;
	}

	public void setStr1(String str1) {
		this.str1 = str1;
	}

	public String getStr2() {
		return str2;
	}

	public void setStr2(String str2) {
		this.str2 = str2;
	}

	public int getStr3() {
		return str3;
	}

	public void setStr3(int str3) {
		this.str3 = str3;
	}

	private String str1;
	private String str2;
	private int str3;

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public int getSaleno() {
		return saleno;
	}

	public void setSaleno(int saleno) {
		this.saleno = saleno;
	}

	public int getPcost() {
		return pcost;
	}

	public void setPcost(int pcost) {
		this.pcost = pcost;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}
