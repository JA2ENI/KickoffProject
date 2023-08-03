/* applyReservation.js */

$('document').ready(function () {
	validationDate();
	$('.status').hide();
	$('.apply-wrap').hide();
	$('.cover-hide').hide();
	applyMark();
});

/* apply cancel */
function applyCancel(num) {
	var status = $('#status'+num).val();
	if(status == "예약 취소") {
		alert('이미 취소된 예약 풋살장입니다.');
		HttpRequest.abort();
	}	
	
	var validation = confirm('풋살장 예약을 취소하시겠습니까?');
	if(validation){
	    var userId = $('#userId'+num).val();
	    var rNum = $('#rNum'+num).val();
	    var obj = { "aUserId" : userId,
	    		  	"rNum" : rNum,
	    		  	"check" : 'cancel' };
	    		  	
	    $.ajax({
	        url: "/updateApplyStatus",
	        type: "post",
	        contentType: "application/json; charset=UTF-8",
	        dataType: "json",
	        data: JSON.stringify(obj),
	        success: function(data) {
	        	$('.cover-hide').show();
	        	$(".cover"+num).addClass("cover-cancel");
	        	$(".cover"+num).addClass("cover-text");
	        	$(".cover"+num).html("예약 취소");
	        }
	    });
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
		$('#checkbox'+num).hide();
		alert('해당 풋살장 예약 모집글에 신청자가 없습니다.');
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
    var rStatus = $('#rStatus'+rNum).val();
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
			$('input[name=sNum]').attr('value', data.rNum);
			$('input[name=sUserId]').attr('value', data.USER_ID);
			$('input[name=empStatus]').attr('value', rStatus);
        }
    });
}

/* Accept & Refuse */
function select(check) {
	$(".sStatus").hide();
    var aUserId = $('#sUserId').val();
    var empId = $('#empId').val();
    var sNum = $('#sNum').val();
    var empStatus = $('#empStatus').val();
    var obj = { "aUserId" : aUserId,
    		  	"empId" : empId,
    		  	"rNum" : sNum,
    		  	"check" : check };
    		  
	if(empStatus == "예약 완료") {
		alert('예약 완료된 모집글입니다.')
		HttpRequest.abort();
	} else if(empStatus == "예약 취소") {
		alert('예약 취소된 모집글입니다.')
		HttpRequest.abort();
	}
		  
   	if(check == "accept") {
    	var validation = confirm('수락 시, 예약 확정됩니다.\n수락하시겠습니까?');
    } else {
		var validation = true;
	}
    
    if(validation) {	  	
	    $.ajax({
	        url: "/updateApplyStatus",
	        type: "post",
	        contentType: "application/json; charset=UTF-8",
	        dataType: "json",
	        data: JSON.stringify(obj),
	        success: function(data) {
	        	if(check == "accept") {
	        		$(".accept1").show();
					$(".side-body .accept1").html("예약 완료");
	        	} else {
	        		$(".refuse1").show();
					$(".side-body .refuse1").html("예약 취소");
	        	}
	        	applyMark(sNum);
	        }
	    });
	}
}

/* status mark */
function applyMark(rNum) {
	var empId = $('#empId').val();
	var curPage = $('#curPage').val();
	var obj = { "empId" : empId,
				"curPage" : curPage };
	
    $.ajax({
        url: "/applyMarkList",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(obj),
        success: function(data) {
			for(var i=0; i<5; i++) {
				if(data[i].RESERVATION_NO == rNum) {
					$('input[name=rStatus'+data[i].RESERVATION_NO+']').attr('value', data[i].RESERVATION_STATUS);
					$('input[name=empStatus]').attr('value', data[i].RESERVATION_STATUS);
				}
				if(data[i].RESERVATION_NO != null) {
					$(".statusAjax"+i).show();
					if(data[i].RESERVATION_STATUS == "예약 완료") {
						$(".statusAjax"+i).addClass("end");
						$(".statusAjax"+i).removeClass("cancel");
						$(".statusAjax"+i).removeClass("ing");
						$(".statusAjax"+i).html('예약 완료');
					} else if (data[i].RESERVATION_STATUS == "예약 취소"){
						$(".statusAjax"+i).addClass("cancel");
						$(".statusAjax"+i).removeClass("end");
						$(".statusAjax"+i).removeClass("ing");
						$(".statusAjax"+i).html('예약 취소');
					} else if (data[i].RESERVATION_STATUS == "예약 중") {
						$(".statusAjax"+i).addClass("ing");
						$(".statusAjax"+i).removeClass("end");
						$(".statusAjax"+i).removeClass("cancel");
						$(".statusAjax"+i).html('예약 중');
					}
					var n = 0;
					n += i;
				} 
			}
			var num = n+1;
			for(var i=0; i<data.length; i++) {
				if(data[num].RESERVATION_NO == null) {
					if(data[num].RESERVATION_STATUS == "예약 완료") {
						$(".acceptMark"+i).show();
						$(".refuseMark"+i).hide();
					} else if (data[num].RESERVATION_STATUS == "예약 취소"){
						$(".acceptMark"+i).hide();
						$(".refuseMark"+i).show();
					}
				} 
				num += 1;
			}
        }
    });
};

/* reservationValidationDate */
function validationDate() {
	var empId = $('#empId').val();
	var obj = { "empId" : empId };
    		  	
    $.ajax({
        url: "/reservationValidationDate",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(obj),
        success: function() {
        }
    });
}


