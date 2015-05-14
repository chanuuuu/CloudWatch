<%@ page import="com.mysql.jdbc.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<script type="text/javascript" src="jquery.min.js"></script>
    <!-- Bootstrap -->
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Login</title>
    </head>
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
 
 <div id="bar" > <span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" onmouseover="emeron()" ><b> About ?</b></span>

   <span style="float:left;color:white;margin:8px 20px 0px 500px;font-family:sans-serif;opacity:1!important" > The Log

<span class="glyphicon glyphicon-duplicate" style="color:red;border:1px ridge blue" ></span>
  Manager

   </span>

   <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="float:right;color:white;margin:10px 20px 0px 0px;font-family:sans-serif;opacity:1!important">
   <a href="signup.jsp" style="color:white;margin:10px 20px 0px 0px;font-family:sans-serif">Sign Up?</a> </span>


   </div> 
   
    <div id="info" style="color:white">

    <span id="infocont" style="display:none">
   The application is a management tool
   </br>Helps manage the virtual machines and many more.. </span>

    <span id="close" onclick="emeroff()">Close</span>


   </div>
   
                 
                <div id="row" >
                    <form class="form-horizontal" role="form" action="home.jsp">
                    
                    <p><label> USERNAME </label> 
                    <input type="text" class="form-control" style="color:black" id="username" name="userName" placeholder="UserName" value="" name=""/></p>
                        <!--div class="form-group">
                            <label for="username" class="col-lg-2 control-label">Username</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="username" name="userName" placeholder="" required>
                            </div>
                        </div-->
                        <p><label> PASSWORD </label>
                        <input type="password" class="form-control" id="inputPassword" name="passWord" style="color:black" placeholder="Password" value="" name=""/></p>
                        <!--div class="form-group">
                            <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                            <div class="col-md-4">
                                <input type="password" class="form-control" id="inputPassword" name="passWord" placeholder="" required>
                            </div>
                        </div-->
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-3">
                                <button type="submit" class="btn btn-primary">Log In</button>
                            </div>
                        </div>
                    </form>
                 
</div> </body>

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

h4{

    color: white; 
    margin-left:10px;
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
            
            
  p{

                margin-top: 10px;
            }
 #button{


                margin-left: 40px;
            }
            
 #btn{

                margin-left: 100px;
                margin-top: 40px;
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
 
</style>

<script type="text/javascript">
 

 function alfa(){
        

                $("#bar").animate({
                    height:'40px',
                     
                 
                },1500);



                $("#row").delay(1000).animate({ 
                    height: '320px',
                    opacity:'1'  
                },1500); 

                $("#video").delay(500).animate({ 
                    // width:"",
                    // height:"700px",
                    opacity:'0.8'  
                },1000); 
             
 } 

 // function incfun(){
 //     alert('executing');
 //             for(int i=1;i<=100;i++)
 //             {
 //             i+=i;
 //             delay(1); 
 //             $("#pbar").style.width=i+"%";
 //             }
 //             $("#bar").style.backgroundColor="red";
            
 // }

 function register(){
  $("#info").hide("slow");
    $("#row").hide("slow");
    $("#sgup").show("slow");
  $("#sgup").animate({
    marginLeft:"60px"},1000);
  
  
 }

 function log(){
$("#sgup").hide("veryfast");
    $("#row").show("slow");
  $("#info").hide("slow");
 

 }

 function emeron(){

  $("#sgup").animate({
    marginLeft:"500px"},1000);
   $("#info").show("veryslow");
   $("#infocont").show("slow");

  
 
 }
 function emeroff(){
  $("#info").hide("slow");
  $("#sgup").animate({
    marginLeft:"30px"},1000);
  $("#info").hide("slow");
  $("#infocont").hide("slow");
 }

              </script>

 
</html>
