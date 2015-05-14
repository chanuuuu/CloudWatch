<%@ page import="vmAlarm.AlarmThread" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Welcome</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="jquery.min.js"></script>
    <!-- Bootstrap -->
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    
     <script type="text/javascript">
        function sendSession() {
            window.location.href = "listvms.jsp?userName=<%=session.getAttribute("userName")%>";
        }
    </script>
</head>
<!--div id="bar"><h4 style="float:left;color:white">Welcome <%=session.getAttribute("userName")%></h4><p style="color:white;font-family:Arial;margin:15px 0px 0px 580px;">CMPE-283 Project1</p></div-->
 <div id="bar" onclick=detunav() > <span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" onmouseover="emeron()" ><b> About ?</b></span>

   <span style="float:left;color:white;margin:8px 20px 0px 500px;font-family:sans-serif;opacity:1!important" > The Log

<span class="glyphicon glyphicon-duplicate" style="color:red;border:1px ridge blue" ></span>
  Manager

   </span>

   <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="float:right;color:white;margin:10px 20px 0px 0px;font-family:sans-serif;opacity:1!important" onclick="register()">
   <a href="welcome.jsp" class="formdesc" style="text-decoration:none;color:white">Go Back</a></span>


   </div>
   
    <div id="container-fluid">

    <div id="info" style="color:white">

    <span id="infocont" style="display:none">
   The application is a management tool
   </br>Helps manage the virtual machines and many more.. </span>

    <span id="close" onclick="emeroff()">Close</span>


   </div>
<!--a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;margin-left:1200px">Logout</a-->
<body>
    <div id="video">
        
                <video id="lvid" autoplay loop> 
                        <source src="1.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop> 
                        <source src="3.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop> 
                        <source src="2.mp4" type="video/mp4" />
                </video>
                    <video id="lvid" autoplay loop> 
                        <source src="4.mp4" type="video/mp4" />
                </video>
                
    </div>
<%
    if(session.getAttribute("userName") == null) {
        response.sendRedirect("error.jsp?error=No session.. You must login to see the page");
    }
%>
 
             
 <iframe src="http://ec2-52-8-102-203.us-west-1.compute.amazonaws.com:5601/#/visualize/edit/CPU-UtilizationLine-VM4?_g=(time:(from:now-15m,mode:quick,to:now))&_a=(filters:!(),linked:!f,query:(query_string:(analyze_wildcard:!t,query:'*')),vis:(aggs:!((id:'1',params:(json:'%7B%22VMNAME%22:%22Test4%22%7D'),schema:metric,type:count),(id:'2',params:(field:cpu.raw,size:50),schema:segment,type:significant_terms)),listeners:(),params:(addLegend:!t,addTooltip:!t,defaultYExtents:!f,shareYAxis:!t),type:line))" height="600" width="1100"></iframe>



<style type="text/css">

iframe{

margin-left:100px;
margin-top:50px;


}

body{


    background-color:black;
}

#bar{
                color: white;
                width: 100%;
                border: 2px ridge gray;
                background-color:rgba(0,0,0,0.1);
                margin:auto;
                height: 50px;
                position: absolute;
                background-image: url('pattern.png');
            }

     #row{   position: absolute;
                        color: white;
                        border: 4px groove gray;
                        width: 450px; 
                        padding: 40px 20px 20px 45px;
                        margin: auto;
                        margin-top: 180px;
                        margin-left: 430px;
                        background-color: rgba(0,0,0,0.2);
                        background-image: url('pattern.png');

            }

            #video{

                 
                height: 0%;
                z-index: -1000;
                position: absolute;
                margin-left:4%;

            }

            video{

                border: 2px solid white;
                opacity: 0.5;
            }
#main{

    
    border: 3px ridge rgba(255,153,0,0.9);
    background-color: rgba(0,0,0,0.5);
    width: 400px !important;
    padding: 50px 0px 0px 80px;
    border-radius:100px;
    height:390px;
    margin: 180px 0px 0px 400px;
}


.col-md-4{
	 margin-top: 10px;
	 padding: 5px 5px 5px 5px;
	 width:150px;
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

label{
	color:white;
}

.sgup{
    
    text-decoration:none;
    color:black;
    font-weight:100px !important;
    margin-top:20px;
    float:right;
    margin-right:30px;

}


 
   #emer:hover{

        color: red !important;
        cursor: pointer;



      }


      #info{
        font-weight: 30px;
        color: red;
        border: 2px ridge black;
        width: 300px;
        height: 300px;
        position: absolute;
        margin: 50px 0px 0px 30px;
      background-image: url('pattern.png');
      background-color: rgba(255,255,255,0.3);
      padding: 100px 10px 10px 30px;
      border-radius: 300px;
      display: none;
      

      }

      #rush,#close{

        text-decoration: none;
        color: yellow;
       margin-left:40px;
       float: left;
       margin-top: 20px;
         
      }


     #rush,#close:hover{

       cursor: pointer;
         
      }
      
      #detail1{
      
      background:rgba(0,0,0,0.7);
      width:200px;
      height:200px;
      float:right;
      margin:100px 50px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
      #detail2{
      
       background:rgba(0,0,0,0.7);
      width:200px;
      height:200px;
      float:left;
      margin:400px 100px 0px 50px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
    
      
      #detail3{
      
      background:rgba(0,0,0,0.7);
      width:3	00px;
      height:600px;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
       #detail3d1{
      
      background:rgba(0,0,0,0.7);
      width:200px;
      height:200px;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
       #detail3d2{
      
      background:rgba(0,0,0,0.7);
      width:200px;
      height:200px;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
       
      
      #detail3e{
      
      background:rgba(0,0,0,0.7);
      width:500px;
      height:80%;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
      #detail3d1e{
      
      background:rgba(0,0,0,0.7);
      width:500px;
      height:80%;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
      
      #detail3d2e{
      
      background:rgba(0,0,0,0.7);
      width:500px;
      height:80%;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }
 
 
      #detail3ehost{
      
      background:rgba(0,0,0,0.7);
      width:500px;
      height:80%;
      float:right;
      margin:70px 150px 0px 0px;
      box-shadow: 5px 5px 50px red;
      display:none;
      
      }

</style>
 <script type="text/javascript">
 
function det1av(){
	
	 $("#row").animate({
		 marginTop:"180px"
	 },500);
	  $("#info").hide("slow");
	  $("#infocont").hide("slow");
	$("#detail1").show("slow");
	$("#detail2").hide("slow");
	$("#detail3").hide("slow");
	$("#detail3d1").hide("slow");
	$("#detail3d2").hide("slow");
	$("#detail3e").hide("slow");
	$("#detail3ehost").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
	
}

function det2av(){
	
	 $("#row").animate({
		 marginTop:"180px"
	 },500);
	  $("#info").hide("slow");
	  $("#infocont").hide("slow");
	$("#detail1").hide("slow");
	$("#detail2").show("slow");
	$("#detail3").hide("slow");
	$("#detail3d1").hide("slow");
	$("#detail3d2").hide("slow");
	$("#detail3e").hide("slow");
	$("#detail3ehost").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
}

function det3av(){
	
	 $("#row").animate({
		 marginTop:"180px"
	 },500);
	  $("#info").hide("slow");
	  $("#infocont").hide("slow");
	$("#detail1").hide("slow");
	$("#detail2").hide("slow");
	$("#detail3").show("slow");
	$("#detail3d1").hide("slow");
	$("#detail3d2").hide("slow");
	$("#detail3e").hide("slow");
	$("#detail3ehost").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
}

function det4av(){
	
	 $("#row").animate({
		 marginTop:"180px"
	 },500);
	  $("#info").hide("slow");
	  $("#infocont").hide("slow");
	$("#detail1").hide("slow");
	$("#detail2").hide("slow");
	$("#detail3").hide("slow");
	$("#detail3d1").show("slow");
	$("#detail3d2").hide("slow");
	$("#detail3e").hide("slow");
	$("#detail3ehost").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
}

function det5av(){
	
	 $("#row").animate({
		 marginTop:"180px"
	 },500);
	  $("#info").hide("slow");
	  $("#infocont").hide("slow");
	$("#detail1").hide("slow");
	$("#detail2").hide("slow");
	$("#detail3").hide("slow");
	$("#detail3d1").hide("slow");
	$("#detail3d2").show("slow");
	$("#detail3e").hide("slow");
	$("#detail3ehost").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
}

function detunav(){
	
	 $("#row").animate({
		 marginTop:"180px"
	 },500);
	  $("#info").hide("slow");
	  $("#infocont").hide("slow");
	$("#detail1").hide("slow");
	$("#detail2").hide("slow");
	$("#detail3").hide("slow");
	$("#detail3e").hide("slow");
	$("#detail3ehost").hide("slow");
	$("#row").animate({
		 marginLeft:"430px"
	 },500);
}
 

 function emeron(){
	 
	 if(document.getElementById("detail3ehost").style.display!="none"||
			 document.getElementById("detail3e").style.display!="none"){ 
		 $("#row").animate({
			 marginTop:"400px"
		 },500);
	   $("#info").show("veryslow");
	   $("#infocont").show("slow");}
	 
	 else if(document.getElementById("detail3ehost").style.display=="none"||
			 document.getElementById("detail3e").style.display=="none"){ 
		 $("#row").animate({
			 marginTop:"180px"
		 },500);
	   $("#info").show("veryslow");
	   $("#infocont").show("slow");}
	 else{
		
  $("#sgup").animate({
    marginLeft:"500px"},1000);
   $("#info").show("veryslow");
   $("#infocont").show("slow");

	 }
 
 }
 function emeroff(){
	 
if(document.getElementById("detail3ehost").style.display!="none"||
		document.getElementById("detail3e").style.display!="none"){
		 
		 $("#row").animate({
			 marginTop:"180px"
		 },500);
		   $("#info").hide("veryslow");
		   $("#infocont").hide("slow");
	 }
	 
  $("#info").hide("slow");
  $("#sgup").animate({
    marginLeft:"30px"},1000);
  $("#info").hide("slow");
  $("#infocont").hide("slow");
 }

 function alarmset(){
	 $("#info").hide("slow");
	  $("#infocont").hide("slow");
	 
	 if(($("#alarmsel").val())=="vm")
		{ 
		 $("#detail3").hide("slow");
		 $("#detail3e").show("slow");
		 $("#detail3e").css({display:"inline"});
		 $("#row").animate({
			 marginLeft:"100px"
		 },500);
		}
		else
		{	 
			$("#detail3").hide("slow");
			 $("#detail3ehost").show("slow");
			 $("#detail3ehost").css({display:"inline"});
			 $("#row").animate({
				 marginLeft:"100px"
			 },500);

		}
	 
	 
 }
              
</script>
</html>
