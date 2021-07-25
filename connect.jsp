<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String fname=request.getParameter("fname");
String lname =request.getParameter("lname");
String dob=request.getParameter("dob");
String phone=request.getParameter("phone");
String gender=request.getParameter("gender");
String area_of_cultivation=request.getParameter("area_of_cultivation");
String password=request.getParameter("pass");
String uid="~";
try{

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
    PreparedStatement ps = conn.prepareStatement("insert into Farmer_Loan (password,fname,lname,dob,gender,phone,area_of_cultivation) values(?,?,?,?,?,?,?);");
    ps.setString(1,password);
    ps.setString(2,fname);
    ps.setString(3,lname);
    ps.setString(4,dob);
    ps.setString(5,gender);
    ps.setString(6,phone);
    ps.setString(7,area_of_cultivation);
    int x=ps.executeUpdate();
    if(x>0){
       %>
        <html>
<link rel="stylesheet" type="text/css" href="style1.css">
            <div class="login-box"><h1 style="font-size:40px">Registerd succesfully</h1>
<pre>



</pre><%
PreparedStatement p = conn.prepareStatement("select max(user_id) from farmer_loan");
ResultSet r=p.executeQuery();
while (r.next()){
    uid=r.getString(1);
}%>
<table class="usid"><tr><td style="color:white;font-size:25px;">User ID:<%out.println(uid);%></td></tr></table><br>
           <a href="index.html" style="text-decoration: none;padding: 5px 20px;border: 3px solid rgb(50, 142, 247);background-color:rgb(50, 142, 247);">
                    Return to Log-in Page
           </a>    
        </html></div> 
            <%
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
