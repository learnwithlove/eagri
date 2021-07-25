<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String id =(String)session.getAttribute("user_id");
String mid =request.getParameter("mid");
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eagri","root","Bhargavi@1276");
    PreparedStatement ps = conn.prepareStatement("insert into farmer_market (market_id,user_id) values(?,?);");
    ps.setString(1,mid);
    ps.setString(2,id);
    int x=ps.executeUpdate();
    if(x>0){
       
     %>   <html>
            <link rel="stylesheet" type="text/css" href="st.css">
            <style>
                body{
                margin: 0;
                padding: 0;
                background: url(market.jpg);
                background-size: cover;
                background-position: center;
                font-family: sans-serif;}
            </style>
            <pre>
            
            
            
            
            
                
            
            </pre>
                  <div class="trnsp"><table class="tabl"><tr><td><h1 style="font-size:40px">Applied succesfully</h1>
                        <pre>
            
                            </pre>
                        </td></tr>
                    <tr><td >   <a href="market.html" style="text-decoration: none;padding: 5px 20px;border: 3px solid #fff;color: rgb(255, 255, 255);"> Return to home Page
                       </a>
                       <pre>
            
                    </pre></td></tr>   
            </table></div> 
            </html> <%
       
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