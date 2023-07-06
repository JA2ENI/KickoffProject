/* team list */
function btnTeam(teamId) {
    var boxDetail = $("#boxDetail");
    var boxDetail2 = $("#boxDetail2");
    
    var isBoxDetailVisible = boxDetail.is(":visible");
    var isBoxDetail2Visible = boxDetail2.is(":visible");
    
    if (isBoxDetailVisible) {
        // boxDetail이 보이는 상태이면 클릭 후 boxDetail2를 보여주고 boxDetail은 숨김
        $.ajax({
            url: "/team-ajax",
            type: "GET",
            dataType: "json",
            data: { teamId: teamId },
            success: function(data) {
                var html = '';
                html += '<div class="title-wrap">';
                html += '<div class="subject team2">팀</div>';
                html += '<div class="subject date">모집일자</div>';
                html += '<div class="subject total">모집인원</div>';
                html += '<div class="subject gender">모집성별</div>';
                html += '<div class="subject status">모집상태</div>';
                html += '</div>';
                
                $.each(data, function(index, item) {
                    html += '<button type="button" class="detail" onclick="location.href=\'/teamDetail?teamSeqNo=' + item.teamSeqNo + '\';">';
                    html += '<div class="content-wrap">';
                    html += '<div class="content team2">' + item.teamName + '</div>';
                    html += '<div class="content date">~' + item.teamEndDate + '</div>';
                    html += '<div class="content total">' + item.teamNumber + '</div>';
                    html += '<div class="content gender">' + item.teamGender + '</div>';
                    html += '<div class="content status">' + item.teamStatus + '</div>';
                    html += '</div>';
                    html += '</button>';
                });
                $('#boxDetail2 .content-container').html(html);
                boxDetail.hide();
                boxDetail2.show();
                
                /* Status Color */
                var statusDivs = $('#boxDetail2 .content-container .content.status');
				statusDivs.each(function() {
				    if ($(this).text() === '모집 완료') {
				        $(this).css('color', '#9c9c9c');
				    }
				});
            },
            error: function(error) {
                alert('Ajax 요청이 실패했습니다. 오류: ' + error);
            }
        });
    } else if (isBoxDetail2Visible) {
        // boxDetail2가 보이는 상태이면 클릭 후 boxDetail을 보여주고 boxDetail2는 숨김
        boxDetail.show();
        boxDetail2.hide();
    }
}


/* status color */
var statusDivs = document.getElementsByClassName("content status");
for (var i = 0; i < statusDivs.length; i++) {
    var statusDiv = statusDivs[i];
    
    if (statusDiv.innerText === "모집 완료") {
        statusDiv.style.color = "#9c9c9c";
    }
}

/* team color */
var containers = document.getElementsByClassName("content-container1");

for (var i = 0; i < containers.length; i++) {
  var container = containers[i];
  var titleDivs = container.getElementsByClassName("content title");
  var chartDivs = container.getElementsByClassName("content chart");

  for (var j = 0; j < titleDivs.length; j++) {
    var titleDiv = titleDivs[j];
    var chartDiv = chartDivs[j];
    var teamColor = chartDiv.textContent.trim();

    if (teamColor === "red") {
      container.style.backgroundColor = "#eb5652";
    } else if (teamColor === "orange") {
      container.style.backgroundColor = "#f78f45";
    } else if (teamColor === "yellow") {
      container.style.backgroundColor = "#ffb300";
    } else if (teamColor === "green") {
      container.style.backgroundColor = "#69bd4a";
    } else if (teamColor === "blue") {
      container.style.backgroundColor = "#6099f0";
    } else if (teamColor === "skyblue") {
      container.style.backgroundColor = "#b0daff";
    } else if (teamColor === "navy") {
      container.style.backgroundColor = "#456fb0";
    } else if (teamColor === "purple") {
      container.style.backgroundColor = "#ac8ced";
    }
  }
}


/* member delete */
var manageDivs = document.getElementsByClassName("content manage");

for (var i = 0; i < manageDivs.length; i++) {
    var manageDiv = manageDivs[i];
    var userType = document.getElementsByClassName("content type")[i];

    if (userType.innerText === "Leader") {
        manageDiv.style.visibility = "hidden";
    }
}

function deleteMember(userId) {
    if (confirm("정말로 이 회원을 방출하시겠습니까?")) {
        window.location.href = "/memberDelete?userId=" + userId;
    }
}
