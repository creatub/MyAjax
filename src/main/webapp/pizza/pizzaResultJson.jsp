<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String phone=request.getParameter("phone");
	
	//Model 1 방식
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url ="jdbc:oracle:thin:@localhost:1521/XE";
	String user="multishop",pwd="tiger";
	
	Connection con=DriverManager.getConnection(url,user,pwd);
	String sql="select * from pizza_user where phone=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,phone);
	
	ResultSet rs=ps.executeQuery();
	
	String num="0", name="", addr="", tel="";
	while(rs.next()){
		num=rs.getString("num");
		name=rs.getString("name");
		addr=rs.getString("addr");
		tel=rs.getString("phone");
	}//while----
	rs.close();
	ps.close();
	con.close();
	//JSON (JavaScript Object Notation)
	//객체: {속성명:값, 속성명2:값2}
	//배열: [1,2,3,4], [{},{},{}]
	//contentType을 application/json으로 설정해야 함에 유의하자
%>
{
	"num":"<%=num%>",
	"name":"<%=name%>",
	"addr":"<%=addr%>",
	"phone":"<%=tel%>"

}