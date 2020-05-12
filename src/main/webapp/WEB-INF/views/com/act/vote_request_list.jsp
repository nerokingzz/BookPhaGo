<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표신청내역</title>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
		<link rel="stylesheet" href="${contextPath}/resources/css/style.css"> 
	<script src="${contextPath}/resources/ibsheet/ibsheetinfo.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibsheet.js"></script>
	<script src="${contextPath}/resources/ibsheet/ibleaders.js"></script>

</head>

<script language="javascript">
	
	//시트 높이 계산용
	var pageheightoffset = 200;
	
	/*Sheet 기본 설정 */
	function LoadPage() {
		mySheet.RemoveAll();
		//아이비시트 초기화
		var initSheet = {};
		initSheet.Cfg = {SearchMode:smClientPaging,ToolTip:1,Page:10,SizeMode:1};
		initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1,HeaderCheck:1};
		initSheet.Cols = [
			{Header:"번호", Type:"int", SaveName:"REQUEST_ID", MinWidth:20},
			{Header:"투표주제", Type:"Text", SaveName:"REQUEST_CONTENT", MinWidth:200},
			{Header:"닉네임", Type:"Text", SaveName:"REQUEST_WRITER", MinWidth:70}
			
		];   
		IBS_InitSheet( mySheet , initSheet);
		
		mySheet.SetEditableColorDiff(1); // 편집불가능할 셀 표시구분
        //mySheet.ShowSubSum([{StdCol:"Release",SumCols:"price",Sort:"asc"}]);
		//doAction('search');
		
		mySheet.SetEditable(true);
		doAction('search');

		mySheet.SetCountPosition(1);
		mySheet.SetPagingPosition(2);

	}

	
	/*Sheet 각종 처리*/
	function doAction(sAction) {
		
		switch(sAction) {
			case "search": //조회
				mySheet.DoSearch("vote_req_list.do?board_id=${boardInfo.get('BOARD_ID')}");
				break;
			case "reload": //초기화
				mySheet.RemoveAll();
				break;
			case "save": // 저장
				//var tempStr = mySheet.GetSaveString();
				//alert("서버로 전달되는 문자열 확인 :"+tempStr);
				break;			
			case "insert": //신규행 추가
				var row = mySheet.DataInsert();
				break;
		}
	}
	
	// 조회완료 후 처리할 작업
	function mySheet_OnSearchEnd() {
		
      
	}
	
	// 저장완료 후 처리할 작업
	// code: 0(저장성공), -1(저장실패)
	function mySheet_OnSaveEnd(code,msg){
		if(msg != ""){
			alert(msg);	
			//번호 다시 매기기
            //mySheet.ReNumberSeq();
		}	
	}	

</script>

<body onload="LoadPage()">
	<div class="posts-section" style="width: 100%; height:100%;">
		<div class="post-bar" style="width: 100%; height:100%;">
			<h2>투표신청내역</h2>
			<div class="main_content" style="width: 100%; height:100%;">
				<div class="ib_product"><script>createIBSheet("mySheet", "100%", "100%");</script></div>
			</div>
        </div><!--post-bar end-->
    </div><!--posts-section end-->
</body>
</html>