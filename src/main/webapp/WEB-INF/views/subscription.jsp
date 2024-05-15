<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="ISO-8859-1">
            <title>Subscription Plan</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                crossorigin="anonymous">
            <!-- <link rel="stylesheet" href="./css/subscription.css"> -->
            <link href="<c:url value="/resources/css/subscriptionPlan.css" />" rel="stylesheet">
        </head>

        <body>
            <div class="container group">
                <c:forEach items="${subscriptionplan}" var="list">
                    <div class="grid-1-5">
                        <h5>Purchase</h5>for
                        <h3><span class="uppercase">${list.plan}</span></h3>

                        <h3><sup>$</sup>${list.price}<span class="small">/mo</span></h3>
                        <ul>
                            <li>Full access to all course materials for ${list.duration}</li>
                            <li>Obtain the chance to learn and practice at one sight</li>
                            <li>Progress tracking</li>
                            <li>Early access to upcoming features and events</li>
                        </ul>
                        <button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#subpModal" onclick="location.href='<c:url value=" /course/subcription/${list.subId}" />' "
                        class="button">BUY</button>
                    </div>

                </c:forEach>

            </div>
            
            <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#subpModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="#subpModal" tabindex="-1" aria-labelledby="subModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="subModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        d;aslvkd;vao;envgorehno
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        </body>

        </html>