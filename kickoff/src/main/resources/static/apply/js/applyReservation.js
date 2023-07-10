/* applyReservation.js */

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
		$('#checkbox'+num).hide();
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

/* side-bar Ajax */
function ajaxSidebar(num) {
    var aUserId = $('#aUserId'+num).val();
    var empId = $('#empId').val();
    var rNum = $('#rNum'+num).val();
    var obj = { "aUserId" : aUserId,
    		  	"empId" : empId,
    		  	"rNum" : rNum };

    $.ajax({
        url: "/aUserInfo",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(obj),
        success: function(data) {
			$("#sideBar #userId").html(data.USER_ID);
			$("#sideBar #gender").html(data.USER_GENDER);
			if(data.USER_SUB_POSITION != null) {
        		var position = data.USER_MAIN_POSITION + "/" + data.USER_SUB_POSITION;
        	} else {
        		var position = data.USER_MAIN_POSITION + "/" + "-";
        	}
			$("#sideBar #position").html(position);
			if(data.TEAM_NAME != null) {
				$("#sideBar #teamName").html(data.TEAM_NAME);
				$("#sideBar #teamLocal").html(data.TEAM_LOCAL);
			} else {
				$("#sideBar #teamName").html("-");
				$("#sideBar #teamLocal").html("-");
			}
			$("#sideBar #rCount").html(data.rCount);
			$('input[name=sUserId]').attr('value', data.USER_ID);
			$('input[name=sNum]').attr('value', data.rNum);
        }
    });
}

/* Accept & Refuse */
function select(check) {
	$(".sStatus").hide();
    var aUserId = $('#sUserId').val();
    var empId = $('#empId').val();
    var sNum = $('#sNum').val();
    var obj = { "aUserId" : aUserId,
    		  	"empId" : empId,
    		  	"rNum" : sNum,
    		  	"check" : check };

    $.ajax({
        url: "/applyStatus",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(obj),
        success: function(data) {
        	if(data.CHECK == "accept") {
        		$(".accept1").show();
        		//$(".mark").hide();
				$(".side-body .accept1").html(data.RESERVATION_STATUS);
				applyMark();
        	} else {
        		$(".refuse1").show();
				$(".side-body .refuse1").html(data.RESERVATION_STATUS);
        	}
        }
    });
}

/* status mark */

$('document').ready(function () {
	$('.mark').hide();
	$('.mark2').hide();
	applyMark();
});

function applyMark() {
	var empId = $('#empId').val();
	
	alert('applyMark_empId = ' + empId);
	
	var obj = { "empId" : empId };
	
    $.ajax({
        url: "/applyMarkList",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(obj),
        success: function(data) {
		//	if(data == 1) {
		//		alert('확인');
		//	} else {
		//		alert('실패');
		//	}
		///	alert('확인');
		//	alert(DATA + ' ' + data[0].RESERVATION_ORIGIN_NO);
		//	$('#ttest').html('222ajax 확인');
		//	$('#ttest2').html('333ajax 확인');
		//	$('#sideBar #ttest3').html('444ajax 확인');
			alert("하이");
			$(".mark").show();
        }
    });
};








