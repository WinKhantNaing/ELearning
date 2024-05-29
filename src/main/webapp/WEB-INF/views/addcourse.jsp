<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <!-- Required meta tags-->
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="Colorlib Templates">
                <meta name="author" content="Colorlib">
                <meta name="keywords" content="Colorlib Templates">

                <!-- Title Page-->
                <title>Adding New Course Form</title>

                <!-- Icons font CSS-->
                <link href="<c:url value ="/adduserresources/vendor/mdi-font/css/material-design-iconic-font.min.css" />" rel="stylesheet"
                media="all">
                <link href="<c:url value ="/adduserresources/vendor/font-awesome-4.7/css/font-awesome.min.css" />"
                rel="stylesheet" media="all">
                <!-- Font special for pages-->
                <link href="<c:url value ="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" />
                " rel="stylesheet">

                <!-- Vendor CSS-->
                <link href="<c:url value ="/adduserresources/vendor/select2/select2.min.css" />" rel="stylesheet"
                media="all">
                <link href="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.css" />"
                rel="stylesheet" media="all">

                <!-- Main CSS-->
                <link href="<c:url value ="/adduserresources/css/main.css" />" rel="stylesheet" media="all">
                
            </head>

            <body>
                <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
                    <div class="wrapper wrapper--w680">
                        <div class="card card-4">
                       
                            <div class="card-body">
                                <h2 class="title">Adding New Course Form</h2>

                                <!-- form start here -->

                                <form:form modelAttribute="coursebean" action="savecourse" method="POST"
                                    enctype="multipart/form-data">
                                    <div class="row row-space">
                                        <div>

                                            <label class="label">Title</label>

                                            <form:input path="courseName" class="input--style-4" style="width:300px;" />
                                        </div>
                                    </div>


                                    <div class="row row-space">
                                        <div>
                                            <div>
                                                <label class="label">Membership</label>
                                                <div class="p-t-10">
                                                    <label class="radio-container m-r-45">Free
                                                        <form:radiobutton path="courseStatus" checked="checked"
                                                            value="free"></form:radiobutton>
                                                        <span class="checkmark"></span>
                                                    </label>
                                                    <label class="radio-container">Premium
                                                        <form:radiobutton path="courseStatus" value="premium"/>
                                                        <span class="checkmark"></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div>
                                        <label class="label">Introduction</label>
                                        <div class="wrapper-ta">
                                            <form:textarea path="courseIntroduction" name="introduction" id="introduction" maxlength="500" placeholder="Start Typin..."/>
                                            <div id="the-count">
                                                <span id="current">0</span>
                                                <span id="maximum">/500</span>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    <div>
                                        <label class="label">Write description about lesson</label>
                                        <div class="wrapper-ta">
                                            <form:textarea path="courseDescription" name="the-textarea" id="the-textarea1" maxlength="300" placeholder="Start Typin..."/>
                                            <div id="the-count1">
                                                <span id="current1">0</span>
                                                <span id="maximum1">/300</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <label class="label">Attach Files</label>
                                        <div class="file-upload">

                                            <div class="image-upload-wrap">
                                                <form:input type='file' path="courseImage" class="file-upload-input" onchange="readURL(this);" />
                                                <div class="drag-text">
                                                    <h3>Attach any relevant documents or images</h3>
                                                </div>
                                            </div>
                                            <div class="file-upload-content">
                                                <img class="file-upload-image" src="#" alt="your image" />
                                                <div class="image-title-wrap">
                                                    <button type="button" onclick="removeUpload()"
                                                        class="remove-image">Remove <span class="image-title">Uploaded
                                                            Image</span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="p-t-15">
                                     <a href='<c:url value="../course/showcourses"/>'><button type="button" class="btn btn-primary" style="margin:20px; background-color:lightgrey;">Back</button></a>
                                        <button type="submit" class="btn btn--radius-2 btn--blue">Add</button>
                                        
                                    </div>

                                    <!-- form end here -->
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Jquery JS-->
                <script src="<c:url value ="/adduserresources/vendor/jquery/jquery.min.js" />"></script>
                <!-- Vendor JS-->
                <script src="<c:url value ="/adduserresources/vendor/select2/select2.min.js" />"></script>
                <script src="<c:url value ="/adduserresources/vendor/datepicker/moment.min.js" />"></script>
                <script src="<c:url value ="/adduserresources/vendor/datepicker/daterangepicker.js" />"></script>

                <!-- Main JS-->
                
                <script type="text/javascript" src="<c:url value ="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"/>"></script>
                  <script>
        // Initialize CKEditor
        CKEDITOR.replace('introduction');

        // Function to count characters
        function countCharacters() {
            
            let editorContent = CKEDITOR.instances.introduction.getData();
            let textContent = editorContent.replace(/<[^>]*>/g, ''); // Strip HTML tags
            let characterCount = textContent.length;
            let current = $('#current'),
                maximum = $('#maximum'),
                theCount = $('#the-count');

            current.text(characterCount);

            /*This isn't entirely necessary, just playing around*/
            if (characterCount < 70) {
                current.css('color', '#666');
            }
            if (characterCount >= 70 && characterCount < 90) {
                current.css('color', '#6d5555');
            }
            if (characterCount >= 90 && characterCount < 100) {
                current.css('color', '#793535');
            }
            if (characterCount >= 100 && characterCount < 120) {
                current.css('color', '#841c1c');
            }
            if (characterCount >= 120 && characterCount < 139) {
                current.css('color', '#8f0001');
            }
            if (characterCount >= 140) {
                maximum.css('color', '#8f0001');
                current.css('color', '#8f0001');
                theCount.css('font-weight', 'bold');
            } else {
                maximum.css('color', '#666');
                theCount.css('font-weight', 'normal');
            }
        }

        CKEDITOR.on('instanceReady', function() {
            var editor = CKEDITOR.instances.introduction;
            

            // Attach event listeners
            editor.on('contentDom', function() {
                editor.document.on('keyup', countCharacters);
                editor.document.on('input', countCharacters);
            });

            // Attach 'change' event listener
            editor.on('change', countCharacters);

            // Initial countCharacters call to update the count on load
            countCharacters();
        });
    </script>
               <script src="<c:url value ="/resources/js/global.js"/>"></script>

                <script class="jsbin" src="<c:url value ="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" />"></script>
            </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

            </html>
            <!-- end document-->