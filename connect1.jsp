<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%
String id =(String)session.getAttribute("user_id");
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
%>
<!DOCTYPE html>
<html>
<link href="st.css" rel="stylesheet" type="text/css" />
<style>
    body{
    margin: 0;
    padding: 0;
    background: url(info.jpg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;}
</style>
<body>
    <pre>










    </pre>
    <div class="trnsp">
<table border="1" class="tabl">
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
String sql ="select * from Farmer_Loan where user_id=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,id);
resultSet =ps.executeQuery();
while(resultSet.next()){
%>
<tr>
    <td>User ID:</td><td><%=resultSet.getString("user_id") %></td></tr>
    <tr><td>First Name:</td><td><%=resultSet.getString("fname") %></td></tr>
    <tr><td>Last Name:</td><td><%=resultSet.getString("lname") %></td></tr>
    <tr><td>Date of Birth:</td><td><%=resultSet.getString("dob") %></td></tr>
    <tr><td>Gender:</td><td><%=resultSet.getString("gender") %></td></tr>
    <tr><td>Phone Number:</td><td><%=resultSet.getString("phone") %></td></tr>
    <tr><td>Area of Cultivaton:</td><td><%=resultSet.getString("area_of_cultivation") %>acers</td>
    </tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>