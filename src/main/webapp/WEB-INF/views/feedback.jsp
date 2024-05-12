<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link href="<c:url value='/resources/css/feedback.css'/>" rel="stylesheet"></link>

</head>
<body>
<div class="newsletter">
        <div class="container">
            <div class="row">
                <div class="col-md-9 ml-auto bg-primary py-5 newsletter-block">
                    <h3 class="text-white">Rate Your Experiences</h3>
                    <form action="#">
                        <div class="input-wrapper">
                            <div class="rate-box" >
                                
                                <input type="radio" name="star" id="star0" /> <label
                                    class="star" for="star0"></label> <input type="radio"
                                    name="star" id="star1" /> <label class="star" for="star1"></label>
                                <input type="radio" name="star" id="star2" checked="checked" />
                                <label class="star" for="star2"></label> <input type="radio"
                                    name="star" id="star3" /> <label class="star" for="star3"></label>
                                <input type="radio" name="star" id="star4" /> <label
                                    class="star" for="star4"></label>
                            
                            </div>
                            <input type="text" class="form-control border-0" id="newsletter"
                                name="newsletter" placeholder="Enter Your Email...">
                            <button type="submit" value="send" class="btn btn-primary" style="margin-top:21px">Join</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>