 
<%@ page import="hostAlarm.HostAlarmThread" %>
<%@ page import="com.mysql.jdbc.StringUtils" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Set alarm</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    </head>
    
<!--div id="bar"><h4 style="float:left;color:white">Welcome <%=session.getAttribute("userName")%></h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p></div>
 <a href="welcome.jsp" class="formdesc" style="text-decoration:none;color:black;float:left;margin-left:-130px">Home</a>
 <a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;float:right;margin-right:-130px;">Logout</a-->
 <div id="bar" > <span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" onmouseover="emeron()" ><b> About ?</b></span>

   <span style="float:left;color:white;margin:8px 20px 0px 500px;font-family:sans-serif;opacity:1!important" > The Log

<span class="glyphicon glyphicon-duplicate" style="color:red;border:1px ridge blue" ></span>
  Manager

   </span>

   <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="float:right;color:white;margin:10px 20px 0px 0px;font-family:sans-serif;opacity:1!important">
   <a href="index.jsp" style="color:white;margin:10px 20px 0px 0px;font-family:sans-serif">Logout!</a> </span>


   </div> 
   
    <div id="info" style="color:white">

    <span id="infocont" style="display:none">
   The application is a management tool
   </br>Helps manage the virtual machines and many more.. </span>

    <span id="close" onclick="emeroff()">Close</span>


   </div>
 
    
<body> 

<div id="video">
        
                <video id="lvid" autoplay loop > 
                        <source src="1.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop > 
                        <source src="3.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop > 
                        <source src="2.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop > 
                        <source src="4.mp4" type="video/mp4" />
                </video>
                
    </div>
 

<%
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("error.jsp?error=No session.. You must login to see the page");
    }
%> 
                <div>
                    <form >
                        <div id="row">
                        
                        <a href="welcome.jsp" class="btn btn-primary">GO BACK!</a>
                 
                        <p style="color:white"> An Alarm has been set for your virtual machine:
                            <%
                                String uName = (String) session.getAttribute("userName");
                                String vhName = request.getParameter("vhname");//"Test1";
                                String metric = request.getParameter("metric");//"cpu";
                                String threshold = request.getParameter("threshold");//70
                                	
                                HostAlarmThread.generateAlarm(vhName, metric, threshold, uName);

                                
                                 out.println(vhName);
                                 %>
                                 </br><h4><b><u>Total List of alarms:</u></b></h4>
                                 <%
                                 
                                 Object[] alpha= HostAlarmThread.listAlarms();
                                 if(alpha.length != 0)
                                 {
                                 for(int i=0;i<alpha.length;i++)
                                 {
                              	   out.println( "\n"+alpha[i].toString());
                              	   
                                 }
                                 }
                                 else
                                 {
                              	   out.println("No alarms have been set yet.");
                                 }
                            %>
                            
                             </p>
                        </div>
                        	
                        
                    </form>
                </div>
            

<style type="text/css">

body{


    background-color:black;
}


#bar{
                color: white;
                width: 100%;
                border: 2px ridge gray;
                background-color:black; 
                height: 50px;
                position: absolute;
                background-image: url('pattern.png');
            }

#row{   				position: absolute;
                        color: white;
                        border: 4px groove gray;
                        width: 300px; 
                        padding: 40px 20px 20px 45px;
                        margin: auto;
                        margin-top: 15%;
                        margin-left: 38%;
                        background-color: rgba(0,0,0,0.4);
                        background-image: url('pattern.png');

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
      
 

</style>
</body>
</html>
