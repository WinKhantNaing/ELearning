   /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;
            
            for (i = 0; i < dropdown.length; i++) {
              dropdown[i].addEventListener("click", function() {
              this.classList.toggle("active");
              var dropdownContent = this.nextElementSibling;
              if (dropdownContent.style.display === "block") {
              dropdownContent.style.display = "none";
              } else {
              dropdownContent.style.display = "block";
              }
              });
            }       
         $(document).ready( function () {
    $('#myTable').DataTable();
} );
  
    $(document).ready(function () {
			if (!$.fn.DataTable.isDataTable( '#studentTable')) {
            $('#studentTable').DataTable({
                initComplete: function () {
                    console.log("Initialization complete");
                    this.api()
                        .columns()
                        .every(function () {
                            let column = this;
                            let title = column.header().textContent.trim();
                           
                            // Create input element
                            let input = document.createElement('input');
                            input.placeholder = "Search " + title;
                            column.footer().appendChild(input);

                            // Event listener for user input
                            input.addEventListener('keyup', () => {
                                if (column.search() !== input.value) {
                                    column.search(input.value).draw();
                                }
                            });
                        });
                }
            });
            }else{
				 $( '#studentTable').DataTable().draw();
			}
        });
