//현재 날짜 가져오기
var date=new Date();
var current=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':'  +  date.getSeconds();
var estaCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate();
var memCurrent=date.getFullYear() + '/' + (date.getMonth()+1) + '/' + date.getDate();

document.getElementById('esta_current_info').value=estaCurrent;
document.getElementById('mem_current_info').value=memCurrent;
document.getElementById('current-infoo').value=current;