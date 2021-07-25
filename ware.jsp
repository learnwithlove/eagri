<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<%
String uid = (String)session.getAttribute("user_id");
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
    background: url(w.jpg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;}
</style>
<body>
    <pre>








    </pre>
    <div class="trnsp">
<table border="1" class="tabla">
<%
try{
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
String sql ="select Warehouse.warehouse_id,Warehouse.total_rooms,room_no,room_capacity from Farmer_Loan,Warehouse,Farmer_Storage_room where Warehouse.warehouse_id= Farmer_Storage_room.warehouse_id and  Farmer_Storage_room.user_id= Farmer_Loan. user_id and Farmer_Storage_room.user_id=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1,uid);
resultSet =ps.executeQuery();
while(resultSet.next()){
%>
<tr><td>Warehouse ID: </td><td><%=resultSet.getString(1) %></td></tr>
<tr><td>Total Rooms: </td><td><%=resultSet.getString(2) %></td></tr>
<tr><td>My Room number: </td><td><%=resultSet.getString(3) %></td></tr>
<tr><td>Room Capacity: </td><td><%=resultSet.getString(4) %></td></tr>
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