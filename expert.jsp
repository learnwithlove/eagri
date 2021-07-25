<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%
String gen =request.getParameter("gender");
String lan =request.getParameter("langauge");
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
    background: url(customer.jpg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;}
</style>
<body>
    <pre>







    </pre>
    <div class="trnsp">
<table border="1" class="tabla">
<tr style="font-size: 33px;">
<td>Expert Id</td>
<td>Expert name</td>
<td>Gender</td>
<td>Age</td>
<td>Pincode</td>
<td>city</td>
<td>Area</td>
<td>Phone no</td>
</tr>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
String sql ="select expert.expert_id,expert.expert_name, expert.gender, expert.age, expert.pincode, expert.city, expert.area,Expert_Phone.phone_no from Expert,Expert_Language,Expert_phone where Expert.expert_id=Expert_Language.expert_id and Expert.expert_id= Expert_Phone.expert_id and gender=? and languages_known=? order by Expert.expert_id";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,gen);
ps.setString(2,lan);
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
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
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