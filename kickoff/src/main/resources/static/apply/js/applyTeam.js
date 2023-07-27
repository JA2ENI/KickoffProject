/* apply team */

/* apply status */
var statusDivs = document.getElementsByClassName("status");
for (var i = 0; i < statusDivs.length; i++) {
    var statusDiv = statusDivs[i];
    
    if (statusDiv.innerText === "모집 완료") {
        statusDiv.style.borderColor = "#00A168";
        statusDiv.style.backgroundColor = "#00A168";
    } else if (statusDiv.innerText === "모집 중") {
		statusDiv.style.borderColor = "#1970FF";
        statusDiv.style.backgroundColor = "#1970FF";
	}
}

/* checkbox */
function drop(num) {
 	var dropCheck = $('#dropCheck'+num).val();
	if(dropCheck == "true") {
		var drop = document.getElementById('drop'+num);
		var detail = document.getElementById('detail'+num);
	
		if (drop.checked == true) {
			detail.style.display = "block";
		} else {
			detail.style.display = "none";
		}
		
	} else {
		$('#checkbox'+num);
		alert('해당 풋살장 예약글에 신청자가 없습니다.');
	}
}
    
/* side-bar open */
function sideon() {
	$(".side-container").addClass("menuon");
	$(".sStatus").hide();
}

/* side-bar close */
function btnSide() {
	$(".side-container").toggleClass("menuon");
	$(".sStatus").hide();
}

/* side-bar info */
function ajaxSidebar(userId, num) {
	var userId = $('#userId'+num).val();
	
    $.ajax({
        url: "/apply-ajax",
        type: "GET",
        dataType: "json",
        data: { userId: userId },
        success: function(data) {
            $("#sideBar #applyUserId").html(data.userId + "/" + data.userName);
            console.log(data.userId, data.userName);
			$("#sideBar #userGender").html(data.userGender);
			$("#sideBar #userAge").html(data.userAge);
			if(data.userSubPosition != null) {
        		var position = data.userMainPosition + "/" + data.userSubPosition;
        	} else {
        		var position = data.userMainPosition + "/" + "-";
        	}
			$("#sideBar #userPosition").html(position);
			$("#sideBar #userLocal").html(data.userAddress);
        },
        error: function(error) {
            alert('Ajax 요청이 실패했습니다. 오류: ' + error);
        }
    });
}