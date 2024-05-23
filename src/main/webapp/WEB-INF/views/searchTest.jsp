<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Search</title>
</head>
<body>
<input id='myInput' onkeyup='searchCourses()' type='text' placeholder='Search for courses...'>

<div class="row justify-content-center">
  <!-- course item -->
  <div class="col-lg-4 col-sm-6 mb-5 course-item">
    <div class="card p-0 border-primary rounded-0 hover-shadow">
      <img class="card-img-top rounded-0" src="images/courses/course-1.jpg" alt="course thumb">
      <div class="card-body">
        <ul class="list-inline mb-2">
          <li class="list-inline-item"><i class="ti-calendar mr-1 text-color"></i>02-14-2018</li>
          <li class="list-inline-item"><a class="text-color" href="course-single.html">Humanities</a></li>
        </ul>
        <a href="course-single.html">
          <h4 class="card-title">Photography</h4>
        </a>
        <p class="card-text mb-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.</p>
        <a href="course-single.html" class="btn btn-primary btn-sm">Apply now</a>
      </div>
    </div>
  </div>
  <!-- Add other course items similarly -->
  <!-- ... -->
</div>

<script>
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
</script>
</body>
</html>
