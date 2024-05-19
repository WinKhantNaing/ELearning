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
                        <button type="button" onclick="location.href='<c:url value="/course/subcription/${list.subId}" />' "
                        class="button">BUY</button>
                    </div>

                </c:forEach>

            </div>

        </body>

        </html>