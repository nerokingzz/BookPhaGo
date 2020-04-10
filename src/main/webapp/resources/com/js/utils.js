//현재 날짜 가져오기
var date=new Date();
//var current=date.getFullYear() + '년' + (date.getMonth()+1) + '월' + date.getDate() + '일' + date.getHours() + '시' + date.getMinutes() + '분'  +  date.getSeconds() + '초';
var current=date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();

document.getElementById('current_info').value=current;