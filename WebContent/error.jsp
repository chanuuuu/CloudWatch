<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <title>Registration</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootswatch/3.2.0/paper/bootstrap.min.css">
    <script type="text/javascript" src="jquery.min.js"></script>
    <!-- Bootstrap -->
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>


<div id="video">
        
                <video id="lvid" autoplay loop > 
                        <source src="error.mp4" type="video/mp4" />
                </video> 
</div>

 <div id="bar" > <span id="emer" style="float:left;color:white;margin:8px 20px 0px 20px;font-family:sans-serif;opacity:1!important" onmouseover="emeron()" ><b> About ?</b></span>

   <span style="float:left;color:white;margin:8px 20px 0px 500px;font-family:sans-serif;opacity:1!important" > The Log

<span class="glyphicon glyphicon-duplicate" style="color:red;border:1px ridge blue" ></span>
  Manager

   </span>

    
<a href="logout.jsp" class="formdesc" style="text-decoration:none;color:white;float:right;margin:10px 10px 0px 0px;">Go Back!</a>

   </div> 
   
    <div id="info" style="color:white">

    <span id="infocont" style="display:none">
   The application is a management tool
   </br>Helps manage the virtual machines and many more.. </span>

    <span id="close" onclick="emeroff()">Close</span>


   </div>
   
   
 
                <div id="row">
                     
                     
                   <h1 style="margin-left:10px;color:white">Oops ! </h1></br>
                     <p><h4 style="margin-left:10px;color:white">Something went wrong. Please retry with the right username & password.</h4></p>
                     
                     
                </div>
                
       
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</body>

<style>
body{


    background-color:black;
}

#bar{
                color: white;
                width: 100%;
                border: 2px ridge gray;
                background-color:black;
                opacity:0.9; 
                height: 50px;
                position: absolute;
                background-image: url('pattern.png');
            }

h4{

    color: white; 
    margin-left:10px;
}

#row{   				 position: absolute;
                border:2px ridge gray;
                height: auto;
                width: 660px;
                height:300px;
                margin:auto;
                margin-top: 200px;
                background-image: url('pattern.png');
                background-color: rgba(0,0,0,0.5);
                padding: 10px 0px 0px 0px;
                margin-left: 350px;
                border-radius: 10px;
                background-image:url('pattern.png');

            }
            
             label{


                color: white;
            }
            
           #video{

  				width:100%;
  				height: 100%;
  				z-index: -1000;
  				position: absolute;

  			}

  			video{
  				position: relative !important;
			    width: 100% !important;
			    height: auto !important;
          
  				}
            
            
  p{

                margin-top: 10px;
            }
 #button{


                margin-left: 40px;
            }
            
 #btn{

                margin-left: 250px;
                margin-top: 50px;
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
      
      #close:hover{
      cursor:pointer;}

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

  $("#row").animate({
    marginLeft:"350px",
    marginTop:"200px"},1000);
   $("#info").show("veryslow");
   $("#infocont").show("slow");

  
 
 }
 function emeroff(){
  $("#info").hide("slow");
   
  $("#info").hide("slow");
  $("#infocont").hide("slow");
 }

              </script>
 
</html>
