/* status color */
var statusDivs = document.getElementsByClassName("team-status");
for (var i = 0; i < statusDivs.length; i++) {
    var statusDiv = statusDivs[i];
    
    if (statusDiv.innerText === "모집 완료") {
        statusDiv.style.color = "#9c9c9c";
    }
}

/* team delete */
function deleteTeam(teamSeqNo) {
    if (confirm("모집글을 삭제하시겠습니까?")) {
        location.href = "/teamDeleteAction?teamSeqNo=" + teamSeqNo;
    }
}

/* team update */
function updateTeam(teamSeqNo) {
    if (confirm("모집글을 수정하시겠습니까?")) {
        location.href = "/teamUpdate?teamSeqNo=" + teamSeqNo;
    }
}

/* team apply disabled */
var divStatus = document.getElementsByClassName("team-status");
var buttons = document.getElementsByClassName("btn_apply");

for (var i = 0; i < divStatus.length; i++) {
    var divStatusElement = divStatus[i];

    if (divStatusElement.innerText === "모집 완료") {
        buttons[i].disabled = true;
        alert("마감된 모집글입니다.");
    }
}