/* team list */

function btnTeam() {
	if($('#boxDetail').css('display') == 'block') {
		$('#boxDetail').css('display', 'none');
		$('#boxDetail2').css('display', 'block');
	} else {
		$('#boxDetail').css('display', 'block');
		$('#boxDetail2').css('display', 'none');
	} 
}