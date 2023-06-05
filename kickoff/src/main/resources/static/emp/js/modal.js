 window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';     
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';        
    }
 
    document.getElementById('au-btn au-btn-icon au-btn--green au-btn--small').addEventListener('click', onClick);
    document.querySelector('.reservationClose').addEventListener('click', offClick);
 
};