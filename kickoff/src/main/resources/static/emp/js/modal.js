  
    function eng() {
		document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
        
        var userId = button.getAttribute("data-id");
		var modalData = document.getElementById("modalData");
		modalData.innerHTML = userId;
         
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';        
    }
    
 
