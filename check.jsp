<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
String userid=request.getParameter("userID");
String pass =request.getParameter("password");
String u_id="~";
String passw="";
try{

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
    PreparedStatement ps = conn.prepareStatement("select user_id,password from farmer_loan where user_id=?;");
    ps.setString(1,userid);
    ResultSet bs=ps.executeQuery();
    while(bs.next())
    {
        u_id=bs.getString(1);
        passw=bs.getString(2);
    }
   
   
    if(u_id.equals(userid) && passw.equals(pass))
    {
          
        session.setAttribute("user_id", u_id);
        response.sendRedirect("home.html");
    }
    else
    {
        response.sendRedirect("index.html"); 
    }
}
catch(Exception e)
    {
        out.println(e);
    } 

%>
