//현재 날짜 가져오기
var date=new Date();
var year=date.getFullYear();
var month=date.getMonth()+1;
var date1=date.getDate();

var year20 = "20";

//var yearsplit = year.substring(0,3);

if(date1 < 10){
	date1='0'+date1;
}

if(month < 10){
	month='0'+month;
}

var current=year + '-' + month + '-' + date1;
document.getElementById('today').value=current;