<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function loadProvince(){
	   //1. 创建异步对象
	   var xmlhttp;
	   if(window.XMLHttpRequest){
       	//浏览器是ie7以上，chrome，firefox。。。。。
       	//创建
       	xmlhttp = new XMLHttpRequest();
       } else {
       	//浏览器版本是ie6以下
       	//创建
       	xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
       }
	   
	   //2.设置请求
	   xmlhttp.open("post","findProv.do",true);
	   //发送请求
	   xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
	   xmlhttp.send();
	   
       //3. 监听事件
       xmlhttp.onreadystatechange = function(){
    	   if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
    		   //接受服务器端的数据
    		  
              var c1 = xmlhttp.responseText;//string类型的json字符串
            alert(c1)
    		  var c = JSON.parse(c1)
             // var c = eval("("+c1+")");
    		  for(var i = 0;i<c.length ;i++){
    			 /*  var tr = document.createElement("select")
    			  var td01 = document.createElement("option");
    			  td01.innerText = c[i].aid;
    			  var td02 = document.createElement("option");
    			  td02.innerText = c[i].aname;
    			  tr.appendChild(td01);
    			  tr.appendChild(td02);
    			  document.getElementById("tab").appendChild(tr) */
    			  var option = document.createElement("option")
    			  option.text = c[i].aname
    			  document.getElementById("tab").appendChild(option);
    		  }
    	   }
       }
   } 
  function fcity(){
	  //清除城市原有的内容
	  document.getElementById("tab1").options.length = 1;
	  //获取当前选中的省份id
	  var pid = document.getElementById("tab").value
	  
	  //异步请求服务器端findcity,根据省份id的值进行查询
	  
	  var xmlhttp;
	  if(window.XMLHttpRequest){
	       	//浏览器是ie7以上，chrome，firefox。。。。。
	       	//创建异步对象
	       	xmlhttp = new XMLHttpRequest();
	       } else {
	       	//浏览器版本是ie6以下
	       	//创建异步对象
	       	xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	     }
	  //2.设置请求连接的地址，发送请求
	  xmlhttp.open("post","findCity.do",true)
	  xmlhttp.send("pid="+pid);
      //3.监听事件
      xmlhttp.onreadystatechange=function(){
    	  if(xmlhttp.redystate == 4 &&xmlhttp.status == 200){
    		  //获取服务器返回的数据
    		  var citystr = xmlhttp.responseText;
    		  alert(citystr)
    	  }
      }
  
  }          
</script>
</head>
<body onload="loadProvince()">
<div>
省份<select id="tab" onchange="fcity()">
<option>---请选择---</option>
</select>
城市<select id="tab1">
 <option>---请选择---</option>
</select>

</div>

</body>
</html>