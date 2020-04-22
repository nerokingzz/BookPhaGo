//현재 날짜 가져오기
var date=new Date();
var current=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':'  +  date.getSeconds();
//var current=date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();

document.getElementById('current_info').value=current;