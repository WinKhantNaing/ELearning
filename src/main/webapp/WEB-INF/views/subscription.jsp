<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
           <link href="<c:url value="/resources/css/course.css" />" rel="stylesheet">
        </head>
<style>
label{
font-size: 17px;}

</style>
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
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" 
                        class="button" onclick="location.href='<c:url value="/course/subcription/${list.subId}" />' ">BUY</button>  
                    </div>

                </c:forEach>

            </div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
    <form:form  action="../subscribe" modelAttribute="paymentbean" method="post">
    
       <div class="header modal-header">
        <h1 class="payment-header modal-title fs-5" id="exampleModalLabel" style="color:blue">Payment Details</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal"  onclick="location.href='<c:url value="/" />' " aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="col-xs-12 mb-3" style="color:blue;font-size:17px;">Payment Method</div>
      
      <div class="image-method">
      <div class=" col-sm-6 mb-4" style="width:70px; height:70px;">
        <div class="card p-0  rounded-0 hover-shadow">
    <label for="kpay">
    <form:radiobutton path="paymentMethod" value="kpay" id="kpay" checked="checked" />
  <img style="width:70px; height:70px;" src="<c:url value="/resources/images/avatars/kpay.png" />" alt="Option 1">
    </label>
</div>
</div>
     <div class="col-lg-3 col-sm-6 mb-4" style="width:70px; height:70px;">
       <div class="card p-0  rounded-0 hover-shadow">
    
    <label for="aya">
    <form:radiobutton path="paymentMethod" value="aya" id="aya" />
          <img style="width:70px; height:70px;" src="<c:url value="/resources/images/avatars/aya.png" />" alt="Option 2"> 
    
    </label>
   </div>
   </div>
    <div class="col-lg-3 col-sm-6 mb-4" style="width:70px; height:70px;">
      <div class="card p-0  rounded-0 hover-shadow">
    <label for="yoma">
     <form:radiobutton path="paymentMethod" value="yoma" id="yoma" />
  <img style="width:70px; height:70px;" src="<c:url value="/resources/images/avatars/yoma.jpeg" />" alt="Option 3">
    </label>

    </div>
    </div>
     <div class="col-lg-3 col-sm-6 mb-4" style="width:70px; height:70px;">
       <div class="card p-0  rounded-0 hover-shadow">
    <label for="wave">
    <form:radiobutton path="paymentMethod" value="wave" id="wave" />
          <img style="width:70px; height:70px;" src="<c:url value="/resources/images/avatars/wave.png" />" alt="Option 4"> 
    
    </label> 
</div>
</div> 
</div>   
<div class="row">
                            <div class="col-xs-12 mb-3">
                                <div class="form-group">
                                    <label style="color:blue;">Course Duration</label>
                                    <div class="input-group col-xs-12">
                                          <form:hidden  path="subId" class="form-control" value="${priceBean.subId }" /> 
                                         <span class="form-control">${priceBean.plan }plan (${priceBean.duration})</span>  
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-6 mb-3">
                                <div class="form-group">
                                    <label style="color:blue;">Start Date</label>
                                    <form:hidden  path="startDate" class="form-control" value="${startDate }" /> 
                                    <span class="form-control">${startDate }</span>
                                </div>
                            </div>
                            <div class="col-xs-4 col-md-6 mb-3 pull-right">
                                <div class="form-group">
                                    <label style="color:blue;">End Date</label>
                                    <span class="form-control">${ endDate}</span>
                                    <form:hidden  path="endDate" class="form-control" value="${ endDate}"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 mb-3">
                                <div class="form-group">
                                    <label style="color:blue;">Amount</label><i class="bi bi-check-circle-fill"></i>
                                    <span class="form-control">$ ${priceBean.price }</span>
                                    <form:hidden path="userId" class="form-control" value="${sessionId }"/><!--  -->
                                </div>
                            </div>
                        </div>     
     </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='<c:url value="/" />' ">Close</button>
        <button type="submit" class="btn btn-primary" id="liveToastBtn" >Save changes</button>
      </div>
      
      </form:form>
    </div>
  </div>
</div>


<script>
const myModal = document.getElementById('exampleModal')
const myInput = document.getElementById('Modal')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
});
document.addEventListener('DOMContentLoaded', (event) => {
    const showModal = "${showModal}";
    if (showModal === "true") {
        const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
        myModal.show();
    }
});

</script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>    
        </body>

        </html>