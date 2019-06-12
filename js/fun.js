function clearinput(obj){
	if(obj.value=="请输入关键字"){
		obj.value="";
		obj.style.color="#000000";
	}
}
function setinput(obj){
	if(obj.value==''){
		obj.value='请输入关键字'
		obj.style.color="#999999";
	}
}
function showTime(){
	var Timer=new Date();
	var h=Timer.getHours();
	var m=Timer.getMinutes();
	var s=Timer.getSeconds();
	var d=Timer.getDate();
	var mm=Timer.getMonth()+1;
	var y=Timer.getFullYear();
	var strShow=""+y+"-"+mm+"-"+d+" "+" "+h+":"+m+":"+s;
	if(h<6)
		strShow+="熬夜对身体不好哦，早点休息吧。";
	else if(h<9)
		strShow+="早上好！";
	else if(h<12)
		strShow+="上午好！";
	else if(h<19)
		strShow+="下午好！";
	else if(h<24)
		strShow+="晚上好！";
	    myspan.innerText=strShow;
		setTimeout("showTime()",1000);
}