
function searchCourses() {
    var input, filter, cards, cardContainer, h4, title, i;
    input = document.getElementById('myInput');
    filter = input.value.toUpperCase();
    cardContainer = document.getElementsByClassName('course-item');
    
    for (i = 0; i < cardContainer.length; i++) {
        cards = cardContainer[i];
        h4 = cards.getElementsByTagName('h4')[0];
        title = h4.textContent || h4.innerText;
        if (title.toUpperCase().indexOf(filter) > -1) {
            cards.style.display = "";
        } else {
            cards.style.display = "none";
        }
    }
}

document.addEventListener('DOMContentLoaded', (event) => {
	  const toastElList = document.querySelectorAll('.toast');
	  const toastList = Array.from(toastElList).map(toastEl => new bootstrap.Toast(toastEl));

	  const liveToastBtn = document.getElementById('liveToastBtn');
	  liveToastBtn.addEventListener('click', () => {
	    const toast = new bootstrap.Toast(document.getElementById('liveToast'));
	    toast.show();
	  });
	});