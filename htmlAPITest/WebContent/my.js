window.onload=function(){
	setInterval(tmStart,1000);
}
function tmStart(){
	mydiv.innerText=new Date();
}