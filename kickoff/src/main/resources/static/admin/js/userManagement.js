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
    const classificationElements = document.querySelectorAll('.classification');
    statusElements.forEach((element, index) => {
        const status = element.getAttribute('data-status');
        const classification = classificationElements[index].getAttribute('data-classification');
        let statusText;
        let displayCancelBtn = 'none';
        let displayEmpBtn = 'none';
        
        if(status === '활동') {
			statusText = 'status-active';
		} else if(status === '정지') {
			statusText = 'status-stop';
			
			if(classification === 'User') {
				displayCancelBtn = 'block';
			} else if(classification === 'Emp') {
				displayEmpBtn = 'block';
			}
		} else {
			statusText = '';
		}
        
        element.className = statusText;
        const cancelButton = element.parentElement.querySelector('.cancel-button');
        cancelButton.style.display = displayCancelBtn;
        const empButton = element.parentElement.querySelector('.emp-button');
        empButton.style.display = displayEmpBtn;
    });
}
updateStatusElements();
updateClassificationElements();



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


function cancelDisable(userId) {
	if (userId !== null && userId !== "") {
		if (confirm("이 회원의 정지 상태를 취소하시겠습니까?")) {
			location.href = "/cancelDisable?userId=" + userId;
		}
	}
}

function cancelDisableEmp(empId) {
	if (empId !== null && empId !== "") {
		if (confirm("이 회원의 정지 상태를 취소하시겠습니까?")) {
			location.href = "/cancelDisable?empId=" + empId;
		}
	}
}
