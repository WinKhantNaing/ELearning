function getPageList(totalPages, page, maxLength){
  function range(start, end){
    return Array.from(Array(end - start + 1), (_, i) => i + start);
  }

  var sideWidth = maxLength < 9 ? 1 : 2;
  var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
  var rightWidth = (maxLength - sideWidth * 2 - 3) >> 1;

  if(totalPages <= maxLength){
    return range(1, totalPages);
  }

  if(page <= maxLength - sideWidth - 1 - rightWidth){
    return range(1, maxLength - sideWidth - 1).concat(0, range(totalPages - sideWidth + 1, totalPages));
  }

  if(page >= totalPages - sideWidth - 1 - rightWidth){
    return range(1, sideWidth).concat(0, range(totalPages- sideWidth - 1 - rightWidth - leftWidth, totalPages));
  }

  return range(1, sideWidth).concat(0, range(page - leftWidth, page + rightWidth), 0, range(totalPages - sideWidth + 1, totalPages));
}

$(function(){
  var numberOfItems = $(".card-content .card").length;
  var limitPerPage = 6; //How many card items visible per a page
  var totalPages = Math.ceil(numberOfItems / limitPerPage);
  var paginationSize = 5; //How many page elements visible in the pagination
  var currentPage ;

  function showPage(whichPage){
    if(whichPage < 1 || whichPage > totalPages) return false;

    currentPage = whichPage;

    $(".card-content .card").hide().slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage).show();

    $(".pagination li").slice(1, -1).remove();

    getPageList(totalPages, currentPage, paginationSize).forEach(item => {
      $("<li>").addClass("page-item").addClass(item ? "current-page" : "dots")
      .toggleClass("active", item === currentPage).append($("<a>").addClass("page-link")
      .attr({href: "javascript:void(0)"}).text(item || "...")).insertBefore(".next-page");
    });

    $(".previous-page").toggleClass("disable", currentPage === 1);
    $(".next-page").toggleClass("disable", currentPage === totalPages);
    return true;
  }

  $(".pagination").append(
    $("<li>").addClass("page-item").addClass("previous-page").append($("<a>").addClass("page-link").attr({href: "javascript:void(0)"}).text("Prev")),
    $("<li>").addClass("page-item").addClass("next-page").append($("<a>").addClass("page-link").attr({href: "javascript:void(0)"}).text("Next"))
  );

  $(".card-content").show();
  showPage(1);

  $(document).on("click", ".pagination li.current-page:not(.active)", function(){
    return showPage(+$(this).text());
  });

  $(".next-page").on("click", function(){
    return showPage(currentPage + 1);
  });

  $(".previous-page").on("click", function(){
    return showPage(currentPage - 1);
  });
 $('#myInput').on('input', function () {
	  if ($(this).val().trim() === "") {
	    	//Define filteredCount initially as the total number of items
	        // If the input is cleared, reset the pagination and item count
	        numberOfItems = $(".card-content .card").length;
	        
	        // Update filteredCount to reflect the new count of items after filtering
	        filteredCount = numberOfItems;
	        
	        // Recalculate totalPages based on the updated filteredCount
	        totalPages = Math.ceil(filteredCount / limitPerPage);
	        
	        // Show the current page after resetting pagination
	        showPage(currentPage);
	    }else{
	    	searchCourses();
	    }
	    
	  });
	  
function searchCourses() {
var input, filter, cards, cardContainer, h4, title, i;
input = document.getElementById('myInput');
filter = input.value.toUpperCase();
cardContainer = document.getElementsByClassName('course-item');
numberOfItems = 0;
for (i = 0; i < cardContainer.length; i++) {
  cards = cardContainer[i];
  h4 = cards.getElementsByTagName('h4')[0];
  title = h4.textContent || h4.innerText;
  if (title.toUpperCase().indexOf(filter) > -1) {
      cards.style.display = "";
      numberOfItems++;
  } else {
      cards.style.display = "none";
  } 
}
}

});

document.addEventListener('DOMContentLoaded', (event) => {
	  const toastElList = document.querySelectorAll('.toast');
	  const toastList = Array.from(toastElList).map(toastEl => new bootstrap.Toast(toastEl));

	  const liveToastBtn = document.getElementById('liveToastBtn');
	  liveToastBtn.addEventListener('click', () => {
	    const toast = new bootstrap.Toast(document.getElementById('liveToast'));
	    toast.show();
	  });
	});