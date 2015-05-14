<%@ page import="com.mysql.jdbc.StringUtils" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>

  
<!--div id="bar"><h4 style="float:left;color:white">Welcome <%=session.getAttribute("userName")%></h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p></div>
 <a href="welcome.jsp" class="formdesc" style="text-decoration:none;color:black;float:left;margin-left:-130px">Home</a>
 <a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;float:right;margin-right:-130px;">Logout</a--->
 
 
 <div id="bar" > <span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" 
 onmouseover="emeron()"></span>

 
    
<a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;float:right;margin-left:240px;">Go Back!</a>

   </div> 
    
   
<body>


 
<div id="video">
        
                <video id="lvid" autoplay loop > 
                        <source src="error.mp4" type="video/mp4" />
                </video> 
</div>
<%! String userName;
    String passWord;
%>
<%
    URL location = this.getClass().getProtectionDomain().getCodeSource().getLocation();
    System.out.println(location.getFile());
    Connection con= null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int noOfInserts;
    boolean userNamePresent = false;

    String driverName = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/test";
    String user = "";
    String dbpsw = "";


    String usernm = request.getParameter("userName");
    String passwd = request.getParameter("passWord");
    String myemail = request.getParameter("email");
    String fullname = request.getParameter("myName");

    if(StringUtils.isNullOrEmpty(fullname) && StringUtils.isNullOrEmpty(myemail)) {
        if(!(StringUtils.isNullOrEmpty(usernm)) && !(StringUtils.isNullOrEmpty(passwd)))
        {
            String sql1 = "select * from users where userName=? and passWord=?";
            try {
                Class.forName(driverName);
                con = DriverManager.getConnection(url, user, dbpsw);
                ps = con.prepareStatement(sql1);
                ps.setString(1, usernm);
                ps.setString(2, passwd);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    userName = rs.getString("userName");
                    passWord = rs.getString("passWord");
                    if(usernm.equals(userName) && passwd.equals(passWord))
                    {
                        session.setAttribute("userName",userName);
                        userNamePresent = true;
                        response.sendRedirect("welcome.jsp");
                    }
                }
                if(!userNamePresent) {
                    response.sendRedirect("error.jsp?error=Error during login");
                }
                rs.close();
                ps.close();
            }
            catch(Exception sqe)
            {
            	out.println(sqe);
            }
        }
        else
        {
%>
            <p style="color:red">Error In Login</p>
<%
            response.sendRedirect("index.jsp");
        }
    }
    else {
                String sql3 = "select * from users where userName=?";
                String sql2 = "insert into users values(?,?,?,?)";
                if(!(StringUtils.isNullOrEmpty(usernm)) && !(StringUtils.isNullOrEmpty(passwd)) &&
                        !(StringUtils.isNullOrEmpty(myemail)) && !(StringUtils.isNullOrEmpty(fullname))) {
                    try {
                        Class.forName(driverName);
                        con = DriverManager.getConnection(url, user, dbpsw);
                        ps = con.prepareStatement(sql3);
                        ps.setString(1, usernm);
                        rs = ps.executeQuery();
                        while(rs.next()) {
                            userName = rs.getString("userName");
                            if(usernm.equals(userName)) {
                                userNamePresent = true;
                                response.sendRedirect("error.jsp?error=Duplicate registration found");
                            }
                        }
                        rs.close();
                        ps.close();
                        if(!(userNamePresent)) {
                            ps = con.prepareStatement(sql2);
                            ps.setString(1, fullname);
                            ps.setString(2, usernm);
                            ps.setString(3, myemail);
                            ps.setString(4, passwd);
                            noOfInserts = ps.executeUpdate();
                            if(noOfInserts==1)
                            {
                                session.setAttribute("userName",usernm);
                                response.sendRedirect("welcome.jsp");
                            }
                            else
                                response.sendRedirect("error.jsp?error=Error during registration");
                            ps.close();
                        }
                    }
                    catch(Exception sqe)
                    {
                        out.println(sqe);
                    }
                }
                else {
%>
            <p style="color:red">Error In Registration</p>
<%
                }
    }
%>
</body>


<style type="text/css">

body{


    background-color:black;
    color:white;
    padding:-20px -20px -20px -20px;
}

 
#bar{
                color: white;
                width: 200px;
                border: 2px ridge gray;
                background-color:black;
                opacity:0.5; 
                height: 50px;
                position: absolute;
                margin:350px 0px 0px 550px;
                background-image: url('pattern.png');
                border-radius:100px;
                padding-left:100px;	
                	
            }

h4{

    color: white; 
    margin-left:10px;
}

#main{

    
    border: 3px ridge rgba(255,153,0,0.9);
    background-color: rgba(0,0,0,0.5);
    width: 400px !important;
    padding: 50px 0px 0px 80px;
    border-radius:100px;
    height:300px;
    margin: 0px 0px 0px 400px;
}

#bar:hover{
	
	border: 2px groove red;
	-moz-box-shadow: 30px 30px 5px black;
	-webkit-box-shadow: 30px 30px 5px black;
	box-shadow: 30px 30px 5px black;
	background-color:rgba(255,255,255,1);
	color:black !important;
}

  #video{

                 
                height: 50%;
             z-index: -1000;
                position: fixed;
                margin-left:4%;

            }

            video{

                border: 2px solid white;
                opacity: 0.5;
            }
      
.formdesc{

    font:Arial;
    color:white;
    font-size: 20px;
    margin-top: 10px;
    width:200px;
}


.forminp{

    font:Arial; 
    font-size: 15px;
    background: rgba(0,0,0,0.1);
    text-decoration:none;
    color:black;
    height:10x;
    width:200px;
    margin-left:50px;
    
}
.col-md-8{
	 margin-top: 10px;
	 padding: 5px 5px 5px 5px;
	 width:220px;
}


.form-group{
	margin-top: 20px;
}

.lgin{

    width: 80px;
    height: 30px;
    color:black;
    margin:20px 0px 0px 70px;
 
}

.sgup{
    
    text-decoration:none;
    color:black;
    font-weight:100px !important;
    margin-top:20px;
    float:right;
    margin-right:30px;

} 

.formgroup{
	width:200px;
}
 
 

</style>
</html>
