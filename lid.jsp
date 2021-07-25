<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String lid="~";
String id =(String)session.getAttribute("user_id");
int x=0;
try{

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
    PreparedStatement ps = conn.prepareStatement("select max(loan_id) from loan;");
    ResultSet bs=ps.executeQuery();
    while(bs.next()){
    lid=bs.getString(1);}
    PreparedStatement ps1 = conn.prepareStatement("update farmer_loan set loan_id=? where user_id=?");
    ps1.setString(1,lid);
    ps1.setString(2,id);
    x=ps1.executeUpdate();
%><html>
<link rel="stylesheet" type="text/css" href="st.css">
<style>
    body{
    margin: 0;
    padding: 0;
    background: url(loan.jpeg);
    background-size: cover;
    background-position: center;
    font-family: sans-serif;}
</style>
<pre>





    

</pre>
      <div class="trnsp"><table class="tabla"><tr><td><h1 style="font-size:40px">Applied succesfully</h1>
            <pre>

                </pre>
            </td></tr>
        <tr><td >   <a href="loan.html" style="text-decoration: none;padding: 5px 20px;border: 3px solid rgb(0, 0, 0);color: rgb(0, 0, 0);"> Return to home Page
           </a>
           <pre>

        </pre></td></tr>   
</table></div> 
</html> <%
}
catch(Exception e)
{
out.println(e);
}
%>