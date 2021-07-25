<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%
String mn = request.getParameter("mname");
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
    background: url(market.jpg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;}
</style>
<body>
<pre>










</pre>
<div class="trnsp">
<table border="1" padding="10px" class="tabl">
<tr>
<td>Market_id</td>
<td>Market name</td>
<td>Pincode</td>
<td>Area</td>
<td>Area</td>
</tr>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
String sql ="select * from Market where city=? order by market_id";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,mn);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getString("market_id") %></td>
<td><%=rs.getString("market_name") %></td>
<td><%=rs.getString("pincode") %></td>
<td><%=rs.getString("city") %></td>
<td><%=rs.getString("area") %></td>
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