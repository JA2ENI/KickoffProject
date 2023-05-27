 window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
        document.querySelector('.selectBox > .helperTeamLevel').style.display ='none';
        document.querySelector('#matchBox > .helperMatch').style.display ='none';
        document.querySelector('#positionBox > .helperPosition').style.display ='none';
        document.querySelector('nav').style.display = 'none';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        document.querySelector('.selectBox > .helperTeamLevel').style.display ='flex';
        document.querySelector('#matchBox > .helperMatch').style.display ='flex';
        document.querySelector('#positionBox > .helperPosition').style.display ='flex';
        document.querySelector('nav').style.display = 'block';
    }
 
    document.getElementById('reservation').addEventListener('click', onClick);
    document.querySelector('.reservationClose').addEventListener('click', offClick);
 
};