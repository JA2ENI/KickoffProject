/* team create */

$('#ment').keyup(function(e){
    var ment = $(this).val();
    $('#font-count').html("" + ment.length + "/20");

    if (ment.length > 20){
        $(this).val(ment.substring(0, 20));
        $('#font-count').html("20/20");
    }
});


$(document).ready(function(){
	$('#formation').change(function(){
		var select = $('#formation option:selected').val();
		
		if(select == '1-3-1') {
			$('.one').show();
		} else {
			$('.one').hide();
		}
		
		if(select == '2-2-1') {
			$('.two').show();
		} else {
			$('.two').hide();
		}
		
		if(select == '3-1-1') {
			$('.three').show();
		} else {
			$('.three').hide();
		}
	});
});

/* 팀 생성 유효성 검사  
$(document).ready(function(){
	$("#create").on("click", function(){
		if($("#teamName").val()==""){
			alert("풋살팀 이름을 입력해주세요.");
			$("#teamName").focus();
			return false;
		}
		if(!$("input[name='teamAge']:checked").val()){
			alert("주요 연령대를 선택해주세요.");
			return false;
		}
		if(!$("input[name='teamLevel']:checked").val()){
			alert("풋살팀 레벨을 선택해주세요.");
			return false;
		}
		if($("#teamLocal").prop('selectedIndex') === 0){
			alert("풋살팀 주 활동지역을 선택해주세요.");
			return false;
		}
		if($("#teamIntro").val().trim() == ""){
			alert("간략한 풋살팀 소개를 입력해주세요.");
			$("#teamIntro").focus();
			return false;
		}
		if($("#teamFormation").val()==""){
			alert("풋살팀 포메이션을 선택해주세요.");
			return false;
		}
		if(!$("input[name='teamGender']:checked").val()){
			alert("풋살팀 성별을 선택해주세요.");
			return false;
		}
		if($("#teamDay").val()==""){
			alert("풋살팀 주 이용요일을 선택해주세요.");
			return false;
		}
		if($("#teamTime").val()==""){
			alert("풋살팀 주 이용시간을 선택해주세요.");
			return false;
		}
		if(!$("input[name='teamColor']:checked").val()){
			alert("풋살팀 컬러를 선택해주세요.");
			return false;
		}
		var idChkVal = $("#nameCheck").val();
		if(idChkVal == "N"){
			alert("팀 이름 중복확인을 완료해주세요.");
		}else if(idChkVal == "Y"){
			$("#teamCreateForm").submit();
		}
	});
}) */

function createTeam() {
	alert('팀이 생성되었습니다!');
}
		
/* 팀 이름 중복확인 */
function teamNameCheck(){
	var teamName = $("#teamName").val();
  
	  if (teamName == "") {
	    alert("풋살팀 이름을 입력해주세요.");
	    return;
	  }
  
	$.ajax({
		url : "/teamNameCheck",
		type : "post",
		dataType : "json",
		data : {"teamName" : $("#teamName").val()},
		success : function(data){
			if(data >= 1){
				alert("중복된 이름입니다.");
			}else if(data == 0){
				$("#nameCheck").attr("value", "Y");
				alert("사용 가능한 이름입니다.");
			}
		},
		error : function(error){
			alert("Ajax 요청이 실패했습니다." + error);
		}
	});
}