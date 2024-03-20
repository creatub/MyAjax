<%@ page language="java" contentType="text/xml; charset=UTF-8"
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

%>
<user>
	<num><%=num %></num>
	<name><%=name %></name>
	<addr><%=addr %></addr>
	<phone type="cell"><%=phone %></phone>
</user>