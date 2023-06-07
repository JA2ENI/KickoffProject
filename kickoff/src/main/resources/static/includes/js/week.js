window.onload = function() {
    weekCalendar(0);
    restoreSelectedDate(); // 페이지 로드 시 선택한 날짜 복원
}

	var today = new Date();
	var nowDate = new Date();
	var days = ['일', '월', '화', '수', '목', '금', '토'];

	function weekCalendar(offset) {
		
		nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate() + offset);
		
	    for(var i = 0; i < 7; i++) {
	    	
	        var change = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate() + i);
	        var dayNum = change.getDay();

	        document.getElementById("day" + (i + 1)).innerHTML = change.getDate() + '<br>' + days[dayNum] 
	        + '<input type = "hidden" name = "helperTime" id = "helperTime" value =' 
	        + '"' + change.getFullYear() + '-' 
	        + ((change.getMonth()+1) < 9 ? '0' + (change.getMonth()+1) : (change.getMonth()+1)) + '-' 
	        + (change.getDate() < 9 ? '0' + change.getDate() : change.getDate()) + '">';

	        var buttons = document.getElementsByClassName("btn");
	        if(days[dayNum] == "일") {
	        	buttons[i].classList.add("sun");
	        }
	        else if(days[dayNum] == "토") {
	        	buttons[i].classList.add("sat");
	        }
	        else {
	        	buttons[i].classList.remove("sun");
	        	buttons[i].classList.remove("sat");
	        }
	        	
	    }

	    var buttons = document.getElementsByClassName("btn");
	    for(var j = 0; j < buttons.length; j++) {
	        if(buttons[j].firstChild.textContent.trim() == today.getDate() && days[(nowDate.getDay() + j) % 7] == days[today.getDay()]) {
	            selectButton(buttons[j]);
	        } else {
	            buttons[j].classList.remove("selected");
	        }
	    }
	}

	function selectButton(button) {
	    var buttons = document.getElementsByClassName("btn");
	    for(var i = 0; i < buttons.length; i++) {
	        if(buttons[i].id == button.id) {
	            buttons[i].classList.add("selected");
	        } else {
	            buttons[i].classList.remove("selected");
	        }
	    }
	 var helperTime = button.querySelector("#helperTime").value;

    $.ajax({
        url: "/helperList", // 컨트롤러 상 요청 받을 url
        type: "post", // 요청 방식
        data: { helperTime: helperTime }, // 가져올 데이터의 파라미터 값
        async: true,
        success: function (data) {
            var json = JSON.parse(data.trim());
            $("tbody").empty(); // 기존 데이터 제거
            for (var i = 0; i < json.length; i++) {
                var helperSeqNo = json[i].helperSeqNo;
                var helperTeamLevel = json[i].helperTeamLevel;
                var helperStatus = json[i].helperStatus;
                var helperGender = json[i].helperGender;
                var helperPlaceName = json[i].helperPlaceName;
                var helperMatch = json[i].helperMatch;
                var helperUserId = json[i].helperUserId;
                var helperPosition = json[i].helperPosition;
                var helperTime = json[i].helperTime;
                $("tbody").append("<tr>" +
                    "<td>" + helperMatch + "</td>" +
                    "<td>" + helperPosition + "</td>" +
                    "<td>" + helperTeamLevel + "</td>" +
                    "<td>" + helperGender + "</td>" +
                    "<td>" + helperPlaceName + "</td>" +
                    "<td>" + helperTime + "</td>" +
                    "<td>" + helperUserId + "</td>" +
                    "<td><button type='button' class='btn_detail' onclick=\"location.href='/helperDetail?helperSeqno=" + helperSeqNo + "';\">" + helperStatus + "</button></td>" +
                    "</tr>");
            }
        }
    });
	}
	


        
     
	
	function prevWeek() {
        weekCalendar(-7);    
    }

    function nextWeek() {
        weekCalendar(7);   
    }