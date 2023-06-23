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


