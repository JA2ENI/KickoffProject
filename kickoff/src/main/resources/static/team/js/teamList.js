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