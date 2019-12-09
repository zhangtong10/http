<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	

    function init(){
    	//让用户名获取焦点
    	document.getElementById("uname").focus();
    }
    
    //当密码框获得焦点时，异步请求服务器，校验用户名是否重复
    function checkUname(){
    	//1. 声明一个异步对象
    	var xmlhttp;
        //创建异步对象 考虑浏览器的差异问题
        if(window.XMLHttpRequest){
        	//浏览器是ie7以上，chrome，firefox。。。。。
        	//创建
        	xmlhttp = new XMLHttpRequest();
        } else {
        	//浏览器版本是ie6以下
        	//创建
        	xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        
       //alert(xmlhttp)
       
       //2.建立与服务器的连接，将用户名文本框的内容发送到服务器端
       //使用open("请求方式","请求url",是否异步默认是true) 函数完成与服务器的连接设置
       var username = document.getElementById("uname").value;
       //xmlhttp.open("get","CheckUname?uname="+username,true);
       xmlhttp.open("post","CheckUname",true);
       
       
       //使用send方法发送请求
       // xmlhttp.send();
       
       //post请求，需要设置请求头类型
       xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
       //发送post请求
       xmlhttp.send("uname="+username);
       //3.事件跟踪，获取服务器端的返回结果
       xmlhttp.onreadystatechange = function(){
    	   //服务器接受请求并处理完，状态码值是200表示成功响应
    	   if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
    		   //获取服务器端响应的文本
    		  var txt = xmlhttp.responseText;
    		  document.getElementById("msg").innerText = txt;
    	   }
       }
       
    }
    
    
</script>
</head>
<body onload="init()">
	<form action="" method="post">
	
		用户<input type="text" name="uname" id="uname" onblur="checkUname()"><span id="msg" style="color:red;"></span><br>
		密码<input type="password" name="pwd" id="pwd" ><br>
	
	</form>
</body>
</html>