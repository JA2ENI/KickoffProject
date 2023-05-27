

/* 엔터키 submit 방지 */
document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

/* court */
function selectCourt(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('court').innerText = text;
}

/* headcount */
function selectHeadcount(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('headcount').innerText = text;
}

/* placeForm */
function getPlaceForm(event) {
	document.getElementById('placeForm').innerText = event.target.value;
}

/* startTime */
function getStartTime(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('startTime').innerText = text;
}

/* endTime */
function getEndTime(e) {
	const text = e.options[e.selectedIndex].text;

	document.getElementById('endTime').innerText = text;
}

/* status */
function getStatus(event) {
	document.getElementById('status').innerText = event.target.value;
}

/* input text */
/* place name */
function getPlaceName()  {
	const text = document.getElementById('inputPlaceName').value;

	document.getElementById('placeName').innerText = text;
}

/* place address */
function getAddress()  {
	const text = document.getElementById('inputAddress').value;

	document.getElementById('address').innerText = text;
}

/* price */
function getPrice()  {
	const text = document.getElementById('inputPrice').value;
	
	document.getElementById('price').innerText = text;
}

/* calendar */
function getDate()  {
	const text = document.getElementById('setDate').value;
	
	document.getElementById('date').innerText = text;
}





