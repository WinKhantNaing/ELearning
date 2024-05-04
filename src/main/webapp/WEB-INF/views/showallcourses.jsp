<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link href="<c:url value ="resources/css/test.css"/>" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>

</head>
<body>
    <div id="sub_content">
        <form class="row g-3 mt-3 ms-2">
          <div class="col-auto">
            <label for="staticEmail2" class="visually-hidden">studentID</label>
            <input type="text"  class="form-control" id="staticEmail2" placeholder="Student ID">
          </div>
          <div class="col-auto">
            <label for="inputPassword2" class="visually-hidden">studentName</label>
            <input type="text" class="form-control" id="inputPassword2" placeholder="Student Name">
          </div>
          <div class="col-auto">
              <label for="inputPassword2" class="visually-hidden">Course</label>
              <input type="text" class="form-control" id="inputPassword2" placeholder="Course">
            </div>
          <div class="col-auto">
            <button type="submit" class="btn btn-success mb-3">Search</button>
          </div>
          <div class="col-auto">
            <button type="submit" class="btn btn-secondary mb-3">Reset</button>
          </div>
        </form>
  <div>
        <table class="table table-striped" id="stduentTable">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Course ID</th>
              <th scope="col">Title</th>
              <th scope="col">Description</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>STU0001</td>
              <td>Thu</td>
              <td>Java</td>
              <td>
                <a href="STU002.html"><button type="submit" class="btn btn-secondary mb-2">See More</button></a> 
              </td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>STU0001</td>
              <td>Thu</td>
              <td>java</td>
              <td>
                <a href="STU002.html"><button type="submit" class="btn btn-secondary mb-2">See More</button></a> 
              </td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>STU0001</td>
              <td>Thu</td>
              <td>Java</td>
              <td>
                <a href="STU002.html"><button type="submit" class="btn btn-secondary mb-2">See More</button></a>
                <!-- <a href="STU002.html" class="text-decoration-none">See more</a> -->
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      </div>
      
</body>
</html>