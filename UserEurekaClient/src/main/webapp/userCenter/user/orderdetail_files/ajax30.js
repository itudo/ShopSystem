var gQueryType=4;//查询类型，12为智慧记
var type;
var postid;
var valicode;
var isvalide;
var gCheckStr;
var gCheckInfo;
var comobj;
var havereturn=false; 
var timeout=30000;
var statuscode=0;
var req;
var ischoose=false;
var gIsCheck;
var returnjson;
var returnjson_up =  [];
var returnjson_down = [];
var gSortStatus = 0;
var queryurl = '';
var isavailable = 1;

function $(id){	return document.getElementById(id);}

 /*--------处理字符串cookie、显示数据cookie------// start  ------------*/
var percent_string=getCookie("beyond");  //这是用来收集所有公司名+快递单号的字符串    20120929  wgd added
var mooning_array= new Array(); //定义一数组，用来存储字符串数组的


var moon = (!!getCookie('beatles'))? parseInt(getCookie('beatles')) : 0;	// 检测数值是否存在，若不存在(null)，则填充0
 
   $("matureNum").innerHTML=moon;  //将数据填充在span中
 /*--------处理字符串cookie、显示数据cookie------// end  ------------*/

function ontimeout(){
  if(havereturn){
	if($("waitdiv").style.display=="block"){
	  havereturn=true;
	  $("errordiv").style.display="block";
	  $("errorMessage").innerHTML="查询时间过长，请您稍后查询。";
	  $("waitdiv").style.display="none";
	  $("notfind").style.display="none";
	  req.abort();
	}
  }
}

function queryForUrl(){	
	var form = document.createElement("form");
	form.action = queryurl + postid;
	form.method = 'post';
	form.target = '_blank';
	form.style.display = 'none';
	document.body.appendChild(form);
	form.submit();
}

function getResult(){
  havereturn=false;
  if($("helpinfo") != null)  $("helpinfo").style.display="none";
  if($("waitdiv").style.display=="block") return;
  //$("returnback").style.display="block";
  $("choosecompany").style.display="none";
  $("example").style.display="none";
  $("errordiv").style.display="none";
  $("notfind").style.display="none";
  var table=$("showtablecontext");
	  while (table.rows.length>1){
	  table.deleteRow(1);
  }
  $("fenye").innerHTML="";
  $("showcontext").style.display="none";
  $("fenye").style.display="none";
  $("postid").value=$("postid").value.Trim();
  postid=$("postid").value;
  $("notfind").style.display="none";
  valicode=$("valicode").value.Trim();
  if(isvalide){
	$("errordiv").className="kd-result-new"; 
	$("notfind").className="kd-result-new"; 
	$("waitdiv").className="wait1"; 
	$("showcontext").className="kd-result-new"; 
  }else{
	$("errordiv").className="kd-result-new"; 
	$("notfind").className="kd-result-new"; 
	$("waitdiv").className="wait"; 
	$("showcontext").className="kd-result-new"; 
  }
  if (type==""||type=="请选择快递公司"||typeof(type)=="undefined"){
	$("errordiv").style.display="block"; 
	$("errorMessage").innerHTML="请选择快递公司。";
	return
  }
  if (postid==""||postid=="请输入快递单号"){
	$("errordiv").style.display="block";
	$("errorMessage").innerHTML="请输入您要查询的单号。";
	$("postid").focus();
	return
  }
  if( !isNumberLetterFuhao(postid)){
	$("errordiv").style.display="block";
	$("errorMessage").innerHTML="单号仅能由数字、字母和特殊符号组合，请您查证。";
	$("postid").focus();
	return
  }
  if(postid.length < 5){
	$("errordiv").style.display="block";
	$("errorMessage").innerHTML="单号不能小于5个字符，请您查证。";
	$("postid").focus();
	return  
  }
  if(gCheckStr != '' && gCheckStr != null){
	  if(!checkRegOfcompany(postid,gCheckStr)){
		$("errordiv").style.display="block";
		$("errorMessage").innerHTML=gCheckInfo;
		$("postid").focus();
		return false;
	  }
  }
  if(isvalide && valicode==""){
	$("errordiv").style.display="block";
	$("hasvalide").style.display="block";
	traninput(type);
	$("errorMessage").innerHTML="请您填写验证码。";
	$("valicode").focus();
	return
  }
  if(isvalide&&!isNumberLetterFuhao(valicode)){
	$("errordiv").style.display="block";
	$("errorMessage").innerHTML="验证码仅能由数字、字母和特殊符号组合，请您查证。";
	$("valicode").focus();
	return
  }
  
  setCookie("inputpostid",postid);
  

  if(queryurl != "" && isavailable == 1){
	  queryForUrl();
	  return false;
	}
  
  var gSession=getCookie("JSESSIONID");
  var url="/query?type="+type+"&postid="+postid+"&id="+gQueryType+"&valicode="+valicode+"&temp="+Math.random()+"&nooralce=1"+"&sessionid="+gSession;
  if(isvalide){
		 url = "/queryvalid?type="+type+"&postid="+postid+"&id="+gQueryType+"&valicode="+valicode+"&temp="+Math.random()+"&nooralce=1"+"&sessionid="+gSession;
	}
  //alert(url);
  setCookie("comcode",type);
  if(window.XMLHttpRequest){
	req=new XMLHttpRequest()
  }else if(window.ActiveXObject){
	req=new ActiveXObject("Microsoft.XMLHTTP")
  }
  if(req){
	req.open("GET", url, true);
	if(isvalide){
	  try{
		req.setRequestHeader("JSESSIONID", gSession);
	  }catch(e){
	  
	  }
	}
	$("waitdiv").style.display="block";
	$("waitinfo").innerHTML= "正在查询......";
	req.onreadystatechange=complete;
	setTimeout("ontimeout()",timeout);//30秒后执行ontimeout
	$("fenye").innerHTML	="";
	req.send(null);
  }
}

function complete(){  
	 $("experiment").style.display="block";     //  wgd added  20121011
  returnjson=null;
  if (req.readyState==4){
	if (req.status==200){
	  if(!havereturn){
		var resultcontext=req.responseText;
		var json=eval("("+resultcontext+")");
		statuscode=json.status;
		gIsCheck = 0;
		if(json.status==200){     //如果查询成功  20121011
		  gIsCheck = json.ischeck;
		  returnjson=json;
		  var line = jsoncom.error_size;
		  if(line >= 0){
			  returnjson.data.splice(line,1);
		  }
		  returnjson_up = [];
		  returnjson_down = [];
		  for(var i in json.data){
			  returnjson_up[i] = returnjson.data[i];
			  returnjson_down[i] = returnjson.data[i];
		  }
		  
		  for(var i = 0;i < returnjson_down.length/2;i++){
			  var tmp = returnjson_down[i];
			  returnjson_down[i] = returnjson_down[returnjson_down.length - i - 1];
			  returnjson_down[returnjson_down.length - i - 1] = tmp;
		  }
		  
		  $("showcontext").style.display="block";

		  /*-------------------用cookie解决，记录查成的单数开始----------------------------------------------------------------------------------*/		        
	 
				var impulse_companyName=$("companyname").value;     //查询成功，取得该公司名称
                  impulse_companyName=encodeURI(impulse_companyName);         //将名称编码
				  //alert(impulse_companyName);

			   var impluse_deliveryNum=$("postid").value;  //查询成功后，取得该快递单号
			      // alert(impluse_deliveryNum);

				  var percent_string=getCookie("beyond");  //这是用来收集所有公司名+快递单号的字符串    20120929  wgd added
               
				   var buddy=percent_string.indexOf(impulse_companyName+","+impluse_deliveryNum+",");//  在字符串中找寻公司名的位置                                                                                                       //结果可能为-1(没找到)
				     //alert(buddy);                                                                       //0(排在首位)，正整数
				  
					if (buddy==-1) {               
					 percent_string=percent_string+impulse_companyName+","+impluse_deliveryNum+",";  //得到一个公司名加单号的字符串
			       }	                                                                           //且两者都找不到时；才追加	
				 

				setCookie('beyond', percent_string);     //将这字符串设为cookie	


                /*下面处理这个长字符串*/
				mooning_array=percent_string.split(","); //字符分割，分割成字符串数组      

				var moon=(mooning_array.length-1)/2;   
				/*由于字符串最后是逗号，分割得到的数组最后一个元素是空格；所以减去1*/    

                 setCookie('beatles', moon);     //将这个数设为cookie	


				 $("matureNum").innerHTML=getCookie("beatles");  //将数据填充在span中	   		
		   
		   
	 /*---------------------------用cookie解决，记录查成的单数结束------------------------------------------------------------------*/




		  var data=json.data;
		  totalcount=data.length;
		  currentpage=1;
		  fenye(currentpage);
		  $("notfind").style.display="none";
		  //$("helpinfo").style.display="block";
		  $("round_gray1").style.display="none"
		}else if(json.status==408){
		  $("errordiv").style.display="block";
		  
		  if(type == 'ems'){
			  $("errorMessage").innerHTML = "您输入的验证码错误，请重新输入！或到<a href='http://www.ems.com.cn' target='_blank'>官网查询试试&gt;&gt;</a>";
		  }else if(type == 'shentong'){
			  $("errorMessage").innerHTML = "您输入的验证码错误，请重新输入！或到<a href='http://www.sto.cn' target='_blank'>官网查询试试&gt;&gt;</a>";
		  }else if(type == 'shunfeng'){
			  $("errorMessage").innerHTML = "您输入的验证码错误，请重新输入！或到<a href='http://www.sf-express.com' target='_blank'>官网查询试试&gt;&gt;</a>";
		  }
		  else{
			  $("errorMessage").innerHTML = "您输入的验证码错误，请重新输入！";
		  }
		  
		  if($("hasvalide").style.display=="block"){
			$("valicode").focus();
		  }
		  var table=$("showtablecontext");
		  while (table.rows.length>1){
			table.deleteRow(1);
		  }
		}else if(json.status == 700){
			queryForUrl();
		}else{
		  var istaobao=false;
		  var reg='^LP[a-zA-Z0-9]'
		  istaobao =checkRegOfcompany(postid,reg);
		  if(istaobao){
			$("errordiv").style.display="block";
			$("errorMessage").innerHTML="[LP]开头的是淘宝内部单号，用运单号码才可查询。";
			var table=$("showtablecontext");
			while (table.rows.length>1){
			  table.deleteRow(1);
			}
		  }else{ 
			//$("experiment").style.display="none";
			$("notfind").style.display="block";
			$("round_gray1").style.display="block";
			$("showcontext").style.display="none";
			$("fenye").style.display="none";
			
			//$("helpinfo").style.display="none"
 
			var table=$("showtablecontext");
			while (table.rows.length>1){
			  table.deleteRow(1);
			}
			
			var json =jsoncom;
			json=json.company;
			for(var j=0;j<json.length;j++){
				if(json[j].code == type){
					$("comurl").href = json[j].comurl;
					break;
				}
			}
		  }
		}
		refreshcode();
		$("waitdiv").style.display="none";
	  }
	}
  }
}

function feedback(){
	window.open("//www.kuaidi100.com/help/feedback.shtml?mscomcode="+$("posttype").value+"&mscomnu="+$("postid").value);
}

function clear(){
  $("choosecompany").style.display="block";
  $("companyname").value="请选择快递公司";
  $("valicode").value="";
  $("postid").blur();
  $("postid").value="请输入快递单号";
  $("postid").style.fontSize="12px";
  $("fenye").innerHTML	="";
  
  if($("adlink")){
	var adJson = frameAd.adList;
	var length = adJson.length;
	var rand = parseInt(Math.random()*length);
	var appname = $("appname").value;
	$("adlink").innerHTML = '<a href="' + adJson[rand].url + appname + '" onfocus="this.blur();" target="_blank">' + adJson[rand].ad + '</a>';  
  }
}

function GetQueryString(name){
  var reg=new RegExp("(^|&)"+name+"=([^&]*)(&|$)","i");
  var r=window.location.search.substr(1).match(reg);
  if(r!=null) return unescape(r[2]);return null;
}

function refreshcode(){
  var code=type;
  $("valicode").value="";
  if(isvalide){
	isvalide=true;
	$("hasvalide").style.display="block";
	$("valiimages").src="//cdn.kuaidi100.com/images/frame/app/clear.gif";
	$("valiimages").height="1px";
	$("valiimages").weight="1px";
	var imageUrl="/images?type="+code+"&id="+gQueryType+"&temp="+Math.random();
	$("valiimages").src=imageUrl;
	$("valiimages").height="31px";
	$("valiimages").weight="60px";
  }
  $("waitdiv").style.display="none";
}

function setCookie(name,value){
  var today=new Date()
  var expires=new Date()
  expires.setTime(today.getTime()+1000*60*60*24*365)
  document.cookie=name+"="+escape(value)+"; expires="+expires.toGMTString()
}

function getCookie(cookieName){
	var cookieValue="";
	if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = cookies[i].replace(/(^\s*)|(\s*$)/g, "");
            if (cookie.substring(0, cookieName.length + 1) == (cookieName + '=')) {
                cookieValue = unescape(cookie.substring(cookieName.length + 1));
                break;
            }
        }
    }
	return cookieValue;
}

function showdiv(){ 
  if($("choosecompany").style.display=="block"){
	$("choosecompany").style.display="none";
	$("errordiv").style.display="none";
	$("notfind").style.display="none";
	//$("returnback").style.display="block";
	if($("showtablecontext").rows.length>1){
	  $("showcontext").style.display="block";
	  $("fenye").style.display="block";
	}else{
	  $("showcontext").style.display="none";
	  $("fenye").style.display="none";
	}
	if(isvalide){
	  $("hasvalide").style.display="block";
	  $("searchborder").className="searchborder-new-code";
	  $("divsearch").className="divsearch-new-code";
	}else{
	  $("hasvalide").style.display="none";
	  $("searchborder").className="searchborder-new";
	  $("divsearch").className="divsearch-new";
	}
	traninput(type);
  }else{
	$("choosecompany").style.display="block";
    $("example").style.display="none";
	if($("helpinfo") != null)  $("helpinfo").style.display="none";
	$("errordiv").style.display="none";
	$("notfind").style.display="none";
	$("fenye").style.display="none";
	$("experiment").style.display="none";
	//$("returnback").style.display="none";
	if(req!=null){
	  req.abort();
	}
	$("waitdiv").style.display="none";
	$("errordiv").style.display="none";
	$("showcontext").style.display="none";
	
	$("fenye").style.display="none";
	$("notfind").style.display="none";
	$("teldiv").style.display="none";
	$("hasvalide").style.display="none";
	$("searchborder").className="searchborder-new";
	$("divsearch").className="divsearch-new";
  }
}

function inputExample(){
	var number = $("exampleNumber").innerHTML;
	$("postid").value = number;
	$("postid").focus();
}

function traninput(obj){
  var objChange = false;
  if(type != obj) objChange = true;
  type = obj;
  $("valiimages").removeAttribute("height");
  $("valiimages").removeAttribute("weight");
  var comcode= obj;
  if(type!=null){
	if(!objChange && $("showtablecontext").rows.length>1){
	  if($("helpinfo")!=null)  $("helpinfo").style.display="none";
	  $("showcontext").style.display="block";
	  $("fenye").style.display="block";
	}else{
	  $("showcontext").style.display="none";
	  $("fenye").style.display="none";
	  if($("helpinfo")!=null){
		  $("helpinfo").style.display="block";
		  $("comhelp").style.display="block";
	  }
	}
  }else{
	$("showcontext").innerHtml="";
	$("fenye").innerHtml="";
	$("showcontext").style.display="none";
	$("fenye").style.display="none";
	var table=$("showtablecontext");
	while (table.rows.length>1){
	  table.deleteRow(1);
	}
  }
  $("posttype").value=type;
  var json =jsoncom;
  json=json.company;
  for(var j=0;j<json.length;j++){
	if(comcode==json[j].code){
	  
	  var name=json[j].companyname;
	  var shortname=json[j].shortname;
	  var tel=json[j].tel;
	  var tel2=json[j].telcomplaintnum;
	  var hasvali=json[j].hasvali;
	  var urladdress=json[j].url;
	  var promptinfo = json[j].promptinfo;
	  var comurl = json[j].comurl;
	  gCheckStr = json[j].freg;
	  gCheckInfo = json[j].freginfo;
	  queryurl = json[j].queryurl;
	  isavailable = json[j].isavailable;
	  var testnu = json[j].testnu;
	  
	  $("exampleNumber").innerHTML=testnu;
	  $("example").style.display = "block";
	  
	  if($("helpinfo")!=null){
		  $("helpinfoUrl").innerHTML=comurl;
		  $("helpinfoUrl").href=comurl;
		  $("helpinfoTel").innerHTML=tel;
		  if(tel2 != '' && tel2 != null){
			$("helpinfoTousu").innerHTML=tel2;
		  }else{
			$("helpinfoTousu").innerHTML=tel;
		  }
	  }
	  
	  if(shortname==""||shortname=="null"||shortname=="undefined"){
		shortname=name;
	  }
	  $("companyname").value=shortname;
	  
	  if(queryurl != "" && isavailable == 1){
		hasvali=0;
	  }
	  
	  if (hasvali=="1"){
		$("searchborder").className="searchborder-new-code";	
		$("divsearch").className="divsearch-new-code";	
		$("hasvalide").style.display="block";
		$("teldiv").style.display="none";
		isvalide=true;
		$("waitdiv").style.display="block";
		refreshcode();
	  }else{
		$("searchborder").className="searchborder-new";	
		$("hasvalide").style.display="none";
		$("teldiv").style.display="none";
		$("divsearch").className="divsearch-new";
		isvalide=false;
	  } 
	  /*
	  if(promptinfo != '' && queryurl == ""){
		  promptinfo = promptinfo.replace("官网试试","<a href='" + comurl + "' target='_blank'>官网试试</a>");
		  $("showcontext").style.display="none";
		  $("fenye").style.display="none";
		  $("errordiv").style.display = "block";
		  $("errorMessage").innerHTML = promptinfo;
	  }*/
	  break;
	}
  }
  $("choosecompany").style.display="none";
  //$("returnback").style.display="block";
  var postid=$("postid").value;
  if(postid=="请输入快递单号"||postid==""){
	$("postid").value=""; 
	$("postid").focus();
  }else{
	$("postid").focus();
  }
}


//排序
function sortToggle(){
	if(gSortStatus == 1){
		gSortStatus = 0;
		sortup();
	}else{
		gSortStatus = 1;
		sortdown();
	}
}

function sortup(){
	var table=$("showtablecontext");
	while (table.rows.length>1){
	  table.deleteRow(1);
	}
	returnjson.data = returnjson_up;
	$("b-down").className = "b-down";
	$("b-up").className = "b-up b-up-active";
	fenye(1);
}

function sortdown(){
	var table=$("showtablecontext");
	while (table.rows.length>1){
	  table.deleteRow(1);
	}
	returnjson.data = returnjson_down;
	$("b-down").className = "b-down b-down-active";
	$("b-up").className = "b-up";
	fenye(1);
}




function fenye(currentpage){
  var json=returnjson;
  if(json==null){
	return;
  }
  var data=json.data;
  var obj=json;
  var pagecount=0;
  var pagesize=5;
  if(isvalide) pagesize=4;
  var totalcount=data.length;
  if((totalcount%pagesize)==0){
	pagecount= parseInt(totalcount/pagesize);
  }else {
	pagecount=parseInt(totalcount/pagesize) +1; 
  }
  var data=json.data;
  var height_table=72;
  var table=$("showtablecontext");
  while (table.rows.length>1){
	table.deleteRow(1);
  }
  for(var i=(currentpage-1)*pagesize;i<currentpage*pagesize;i++){
	if(i>(totalcount-1) ) break;
	if(isvalide) height_table=80;
	if((height_table+table.clientHeight)>280){
	  $("fenye").style.display="block";	
	  break;
	}
	var newTr=table.insertRow(-1);
	var newTd0=newTr.insertCell(-1);
	var newTd1=newTr.insertCell(-1);
	
	newTd0.innerHTML=data[i].time;
	newTd1.innerHTML=data[i].context;     
	
	var strlength=30; 
	//if(newTr.clientWidth>36){ 	 	   
	  if(data[i].context.length>strlength){
		strlength=strlength-1;	
		newTd1.innerHTML=data[i].context.substring(0,strlength) + "...";		
		newTd1.title=data[i].context;
	 //}	  		
	}
	
	
	
	if(gSortStatus == 0 && i == 0){
		newTd0.className="nobg c-g-a fontorange";
		newTd1.className="nobg c-g-b fontorange";
		newTd1.innerHTML += '<span class="lastTag"></span>';
	}else if(gSortStatus == 1 && i == totalcount-1){
		newTd0.className="nobg c-g-a fontorange";
		newTd1.className="nobg c-g-b fontorange";
		newTd1.innerHTML += '<span class="lastTag"></span>';
	}else{
		newTd0.className="nobg c-g-a";
		newTd1.className="nobg c-g-b";
	}
	if((height_table+table.clientHeight)>280){
	  table.deleteRow(1);	
	  break;
	}
  }
  var sbufferContext="";
  if(pagecount==1){
	$("fenye").innerHTML=sbufferContext;
	$("fenye").style.display="block";
	return;
  }else{
	$("fenye").style.display="block";
  }
  var list="";
  if(pagecount<=5){
	for(var i=1;i<=pagecount;i++){
	  if(i==currentpage){
		list+="<a href='javascript:void(0)' class='divpaging-a-number2' >"+i+"</a>";
	  }else{
		list+="<a href='javascript:void(0)' class='divpaging-a-number1' onclick='fenye("+i+")'>"+i+"</a>";
	  }
	}
  }else if(pagecount>5){
	if(currentpage<=3){
	  for(var i=1;i<=5;i++){
		if(i==currentpage){
		  list+="<a href='javascript:void(0)' class='divpaging-a-number2' >"+i+"</a>";
		}else{
		  list+="<a href='javascript:void(0)' class='divpaging-a-number1' onclick='fenye("+i+")'>"+i+"</a>";
		}
	  }
	  list+="<span class='divpaging-span2'>...</span>";
	  list+="<a href='javascript:void(0)' class='divpaging-a-number1' onclick='fenye("+pagecount+")' >"+pagecount+"</a>";
	}else if(currentpage<=pagecount-4){
	  list+="<a href='javascript:void(0)' class='divpaging-a-number1' onclick='fenye(1)' >1</a>";
	  list+="<span class='divpaging-span2'>...</span>";
	  for (var i=currentpage-2; i <= currentpage+2; i++){
		if(i ==currentpage){
		  list+="<a href='javascript:void(0)' class='divpaging-a-number2' >"+i+"</a>";
		}else{
		  list+="<a href='javascript:void(0)' class='divpaging-a-number1' onclick='fenye("+i+")'>"+i+"</a>";
		}
	  }
	  list+="<span class='divpaging-span2'>...</span>";
	  list+="<a href='javascript:void(0)' class='divpaging-a-number1' onclick='fenye("+pagecount+")' >"+pagecount+"</a>";
	}else if(currentpage>pagecount-4){
	  list+="<a href='javascript:void(0)' class='divpaging-a-number1' onclick='fenye(1)' >1</a>";
	  list+="<span class='divpaging-span2'>...</span>";
	  for(var i=pagecount-4;i<=pagecount;i++){
		if(i==currentpage){
		  list+="<a href='javascript:void(0)' class='divpaging-a-number2' >"+i+"</a>";
		}else{
		  list+="<a href='javascript:void(0)' class='divpaging-a-number1' onclick='fenye("+i+")'>"+i+"</a>";
		}
	  }
	}
  }
  $("fenye").innerHTML=list.toString();
}









function clearfield1(obj){
  //$("errordiv").style.display="none";
  if (obj.value=="请输入快递单号"){
	obj.value="";
  }else{
	obj.style.fontSize="14px";
	obj.select();
  }
}

function clearfield2(obj){
  if (obj.value=="请输入快递单号"){
	obj.style.fontSize="12px";
  }else if(obj.value==""){
	obj.value="请输入快递单号";
	obj.style.fontSize="12px";
  }
}

function clearfield3(obj){
  //obj.value=obj.value.Trim();
  if( !isNumberLetterFuhao(obj.value)){
	obj.style.fontSize="12px";
  }else{
	obj.style.fontSize="14px";
  }
  if (obj.value.length>18){
	obj.value=obj.value.slice(0,18);
	return false;
  }
}


function keyDown(evt){
  evt=(evt) ? evt : ((window.event) ? window.event : "");
  var e=evt.keyCode?evt.keyCode:evt.which; 
  var obj =evt.srcElement ? evt.srcElement : evt.target;
  //	var e=window.event;	 
  if(evt.keyCode==13){
	if(obj.name=="postid"){
	  if($("hasvalide").style.display=="none"){
		getResult();
		return;
	  }else{
		$("valicode").focus();
		return;
	  }
	}else if(obj.name=="valicode"){
	  getResult();
	  return;
	}
  }else if(evt.keyCode==9){
	if(obj.id=="postid"){
	  if($("hasvalide").style.display=="none"){
		  
	  }else{
		$("valicode").focus();
		return false;
	  }
	}else if(obj.id=="valicode"){
	  $("lika").focus();
	  return false;
	}else if(obj.id=="lika"){
	  return false;
	}
  }
}

function getargs(){
  type="";
  postid="";
  var radios=document.getElementsByName("posttype");
  for(var i=0; i<radios.length;i++){
	if(radios[i].checked) {
	  type=radios[i].value;
	  break;
	}
  }
  postid=$("postid").value;
  valicode=$("valicode").value;
  postid=postid.Trim();
  valicode=valicode.Trim();
}

String.prototype.Trim=function(){
  return this.replace(/\s/g, "");
}

function isNumberOrLetter( s ){//判断是否是数字或字母
  var regu="^[0-9a-zA-Z]+$";
  var re=new RegExp(regu);
  if (re.test(s)){
	return true;
  }else{
	return false;
  }
}
function isNumberLetterFuhao( ss ){//判断是否是数字或字母
  var regu="^[0-9a-zA-Z\@\#\$\]+$";
  var re=new RegExp(regu);
  if (re.test(ss)){
	return true;
  }else{
	return false;
  }
}

function checkRegOfcompany(s,regu){
  var templp=s.toUpperCase();
  var re=new RegExp(regu);
  if(re.test(templp)){
	return true;
  }else{
	return false;
  }
}

/*保存单号*/
var countSource="360desktop";
var gSaveHref="//www.kuaidi100.com/user/login.shtml?app="+countSource;
function qcSaveNum(obj){
	obj.href=gSaveHref+"&com="+type+"&nu="+postid+"&ischeck="+gIsCheck;
}

/*去掉从后台中获取的数据中的空格 wgd*/
function delNbsp(resu01){     
	 var resu02=resu01.replace(/(\s*)|(\s*$)/g, "");//去掉前后空格
	 var resu03=resu02.replace(/\s/g, "");//去除文章中间空格
	 return resu03;
}

document.onkeydown = keyDown;