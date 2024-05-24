console.log("test");
function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}

const option1 = document.getElementById("optionId1");
const option2 = document.getElementById("optionId2");
const btnCheck = document.getElementById("checkBtn");
const error = document.getElementById("quiz-error");

function quizCheck() {
	if (document.getElementById("optionId1").checked == false && document.getElementById("optionId2").checked == false) {
		document.getElementById("quiz-error").innerHTML = "Please Choose One Answer!";
		return false;
	}
	else {
		return true;
	}
}