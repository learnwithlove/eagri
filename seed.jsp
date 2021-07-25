<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%
String cn = request.getParameter("cname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "eagri";
String userid = "root";
String password = "Bhargavi@1276";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
session.setAttribute("crop", cn);
%>
<!DOCTYPE html>
<html>
<link href="st.css" rel="stylesheet" type="text/css" />
<style>
    body{
    margin: 0;
    padding: 0;
    background: url(seed.jpg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;}
</style>
<body>
<pre>










</pre>
<div class="trnsp">
<table border="1" padding="10px" class="tabla">
<tr>
<td>Company Id</td>
<td>Company name</td>
<td>Pincode</td>
<td>Area</td>
<td>Company Rating</td>
<td>Quality</td>
</tr>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
String sql ="select company.company_id,company_name,pincode,area,company_rating,quality from company,crop_company where company.company_id=crop_company.company_id and crop_name=? order by company_id;";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,cn);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>