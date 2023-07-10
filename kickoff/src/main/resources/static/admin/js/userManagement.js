/**
 userManagement
 */

 
 function updateClassificationElements() {
		    const classificationElements = document.querySelectorAll('.classification');
		    classificationElements.forEach((element) => {
		        const classification = element.getAttribute('data-classification');
		        let classificationText;
		        switch (classification) {
		            case 'Leader':
		            	classificationText = 'role-leader';
		                break;
		            case 'User':
		            	classificationText = 'role-user';
		                break;
		            case 'Emp':
		            	classificationText = 'role-emp';
		                break;
		            default:
		            	classificationText = 'role-default';
		                break;
		        }
		        element.className = classificationText;
		    });
		}
		
function updateStatusElements() {
    const statusElements = document.querySelectorAll('.status');
    statusElements.forEach((element) => {
        const status = element.getAttribute('data-status');
        let statusText;
        let displayCancelBtn;
        switch (status) {
            case '활동':
                statusText = 'status-active';
                displayCancelBtn = 'none';
                break;
            case '정지':
                statusText = 'status-stop';
                displayCancelBtn = 'block';
                break;
            default:
                statusText = '';
            	displayCancelBtn = 'none';
                break;
        }
        element.className = statusText;
        const cancelButton = element.parentElement.querySelector('.cancel-button');
        cancelButton.style.display = displayCancelBtn;
    });
}


updateClassificationElements();
updateStatusElements();

function userAction(action) {
	var confirmFlag = "";

	if (action === "disable") {
		confirmFlag = "이 회원을 정말로 정지하시겠습니까?";
    } else if (action === "delete") {
    	confirmFlag = "이 회원을 정말로 탈퇴시키겠습니까?";
    }
	
	if(!confirm(confirmFlag)) {
		return false;
	}
}


function cancelDisable(userId, empId) {
	if (userId !== null) {
		if (confirm("이 회원의 정지 상태를 취소하시겠습니까?")) {
			location.href = "/cancelDisable?userId=" + userId;
		}
	} else if (empId !== null) {
		if (confirm("이 회원의 정지 상태를 취소하시겠습니까?")) {
			location.href = "/cancelDisable?empId=" + empId;
		}
	}
}
