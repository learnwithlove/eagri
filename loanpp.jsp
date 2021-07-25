<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String amount =request.getParameter("amo");
String ltype=request.getParameter("loan");
try{

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
    PreparedStatement ps = conn.prepareStatement("insert into loan (loan_amount,loan_type) values(?,?);");
    ps.setString(1,amount);
    ps.setString(2,ltype);
    int x=ps.executeUpdate();
    if(x>0){
       
       response.sendRedirect("lid.jsp");
       
    }
    else 
    {
    out.println("failed");
    }
}
catch(Exception e)
{
    out.println(e);
}
%>
