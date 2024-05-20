<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>jQuery Hip.js: Grid Layout With Pagination Example</title>

<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<style>
/* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
  display: block;
}
body {
  line-height: 1;
}
ol, ul {
  list-style: none;
}
blockquote, q {
  quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}

.cf:after { 
   content: "."; 
   visibility: hidden; 
   display: block; 
   height: 0; 
   clear: both;
}

body{
  background-color: #e1f1f6;
  font-family: Helvetica, sans-serif;
  color: #222;
}

.page{
  margin: 50px auto;
  width: 70%;
  background-color: #fff;
  border-radius: 5px;
  padding: 50px;
}

.page-header{
  margin-bottom: 20px;
}
  .page-header h2{
    float: left;
    font-size: 22px;
    text-transform: uppercase;
    font-weight: bold;
    color: #555;
  }

  .page-header .student-search{
    float: right;
  }

    .page-header .student-search input{
      border-radius: 5px;
      border: 1px solid #eaeaea;
      padding: 8px 15px;
      font-size: 14px;
    }

    .page-header .student-search button{
      border-radius: 5px;
      border: 1px solid #eaeaea;
      padding: 8px 15px;
      font-size: 14px;
      background-color: #4ba6c3;
      color: #fff
    }

.student-list{}

  .student-item{
    margin: 0 0 20px 0;
    padding: 0 0 20px 0;
    border-bottom: 1px solid #eaeaea;
  }

    .student-details{
      width: 50%;
      float: left;
    }

      .student-details .avatar{
        width: 40px;
        height: auto;
        border-radius: 20px;
        float: left;
        margin-right: 14px
      }

      .student-details h3{
        margin: 4px 0 2px 0;
        font-weight: bold;
        color: #4ba6c3;
      }

      .student-details .email{
        color: #888;
        font-size: 14px;
      }


    .joined-details{
      width: 50%;
      float: left;
      text-align: right;
    }

      .joined-details .date{
        margin-top: 15px;
        display: block;
        font-size: 14px;
        color: #999;
      }

  .student-item:last-child{
    margin: 0;
    padding: 0;
    border-bottom: none;
  }

.pagination{
  margin: 40px 0 0 0;
  text-align: center;
}
 
  .pagination li{
    display: inline;
  }

    .pagination li a{
      border: 1px solid #eaeaea;
      border-radius: 5px;
      padding: 3px 8px;
      text-decoration: none;
      color: #4ba6c3;
    }

    .pagination li a.active,
    .pagination li a:hover{
      background-color: #4ba6c3;
      color: #fff;
    }
</style>
</head>
<body>
    <div class="page">
      <div class="page-header cf">
        <h2>Students</h2>
        <div class="student-search">
        <input placeholder="Search for students...">
        <button>Search</button>
    </div>
      </div>
      <ul class="student-list">
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/67.jpg">
                <h3>iboya vat</h3>
                <span class="email">iboya.vat@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 07/15/15</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/75.jpg">
                <h3>aapo niskanen</h3>
                <span class="email">aapo.niskanen@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 06/15/12</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/34.jpg">
                <h3>phillip cox</h3>
                <span class="email">phillip.cox@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 09/11/14</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/38.jpg">
                <h3>zilda moreira</h3>
                <span class="email">zilda.moreira@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 07/15/15</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/23.jpg">
                <h3>lilou le gall</h3>
                <span class="email">lilou.le gall@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 06/16/13</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/94.jpg">
                <h3>lucy hall</h3>
                <span class="email">lucy.hall@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 09/11/16</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/24.jpg">
                <h3>mark colin</h3>
                <span class="email">mark.colin@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 01/14/14</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/14.jpg">
                <h3>sara alves</h3>
                <span class="email">sara.alves@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 07/19/16</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/49.jpg">
                <h3>ramon macrae</h3>
                <span class="email">ramon.macrae@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 05/13/12</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/15.jpg">
                <h3>connor taylor</h3>
                <span class="email">connor.taylor@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 05/18/14</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/11.jpg">
                <h3>aymeric morel</h3>
                <span class="email">aymeric.morel@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 06/13/13</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/49.jpg">
                <h3>lorenz otto</h3>
                <span class="email">lorenz.otto@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 05/11/14</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/29.jpg">
                <h3>karl williamson</h3>
                <span class="email">karl.williamson@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 01/12/14</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/34.jpg">
                <h3>ouassim heering</h3>
                <span class="email">ouassim.heering@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 01/18/12</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/91.jpg">
                <h3>roberto molina</h3>
                <span class="email">roberto.molina@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 06/13/15</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/28.jpg">
                <h3>jordan hubert</h3>
                <span class="email">jordan.hubert@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 06/13/15</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/29.jpg">
                <h3>melvin baker</h3>
                <span class="email">melvin.baker@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 09/18/14</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/26.jpg">
                <h3>everett gordon</h3>
                <span class="email">everett.gordon@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 06/17/15</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/82.jpg">
                <h3>aiden ma</h3>
                <span class="email">aiden.ma@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 07/18/12</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/62.jpg">
                <h3>florent gerard</h3>
                <span class="email">florent.gerard@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 02/12/13</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/96.jpg">
                <h3>amber chen</h3>
                <span class="email">amber.chen@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 07/12/12</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/9.jpg">
                <h3>alexandra davies</h3>
                <span class="email">alexandra.davies@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 05/11/13</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/57.jpg">
                <h3>sergio cole</h3>
                <span class="email">sergio.cole@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 02/17/15</span>
           </div>
        </li>
        
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/63.jpg">
                <h3>virgulino silva</h3>
                <span class="email">virgulino.silva@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 03/18/11</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/11.jpg">
                <h3>lucile bertrand</h3>
                <span class="email">lucile.bertrand@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 06/13/16</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/10.jpg">
                <h3>elsa lahti</h3>
                <span class="email">elsa.lahti@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 04/15/12</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/women/12.jpg">
                <h3>soline leclercq</h3>
                <span class="email">soline.leclercq@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 05/12/14</span>
           </div>
        </li>
        <li class="student-item cf">
            <div class="student-details">
                <img class="avatar" src="https://randomuser.me/api/portraits/thumb/men/89.jpg">
                <h3>henri kruse</h3>
                <span class="email">henri.kruse@example.com</span>
            </div>
            <div class="joined-details">
                   <span class="date">Joined 05/14/13</span>
           </div>
        </li>
      </ul>
      <div class="pagination">
            <ul>   
                <li>
                    <a href="#" class="active">1</a>
                </li>
            
                <li>
                    <a href="#">2</a>
                </li>
            
                <li>
                    <a href="#">3</a>
                </li>
            
                <li>
                    <a href="#">4</a>
                </li>
            
                <li>
                    <a href="#">5</a>
                </li>
            
                <li>
                    <a href="#">6</a>
                </li>
            </ul>
        </div>
    </div>


<script>
//Setting up variables
const $studentList = $('.student-list').children();
$('.student-list').prepend('<div class="notFound"></div>');
$('.notFound').html(`<span>No results</span>`);
$('.notFound').hide();

// Bulding a list of ten students and displaying them on the page
function showPage(studentList, pageNum = 1){
    const showPerPage = 10;    
    // hide all students on the page
    $(studentList).hide(); 
    
    // Get start/end for each student based on the page number
    const calcStart = (pageNum) => pageNum === 1 ? 0 : (pageNum - 1) * showPerPage;
    const start = calcStart(pageNum);
    const end = pageNum * showPerPage;

    // Looping through all students in studentList
    $(studentList).slice(start,end).each(function(i, li){
        // if student should be on this page number
        // show the student
        $(li).fadeIn(50);
    });
}

// Search component
const searchBar = `
    <div class="student-search">
        <input placeholder="Search for students...">
        <button>Search</button>
    </div>
`;
$('.page-header').append(searchBar);

$('.student-search input').on('keyup', function(){
    const searchQuery = $(this).val();
    const searchResults = searchStudent($('.student-list li'), searchQuery.toUpperCase());
    showPage(searchResults);
    appendPageLinks(searchResults);
});


// Student search
function searchStudent(element, filter){

    $(element).each(function(){         
        if($(this).text().toUpperCase().includes(filter)){
            $(this).show();
        } else {
            $(this).hide();
        }        
    });
    let num = $('.student-item:not([style*="display: none"])').length;
    let searchRes = $('.student-item:not([style*="display: none"])');
    num > 0 ? $('.notFound').hide() : $('.notFound').show();
    return searchRes;
};



// Creating all page links based on a list of students
function appendPageLinks(studentList){
    // determine how many pages for this student list
    totalPageNum = Math.ceil(studentList.length / 10);
    // create a page link section
    const pagination = 'pagination';
    // add a page link to the page link section
    // if class the element already exists
    if($('.pagination').length === 0){
        $('.page').append(`
        <div class="${pagination}">
            <ul></ul>
        </div>
    `);
    } 
 
    // remove the old page link section from the site
    $('.pagination ul').children().remove();

    if (totalPageNum > 1){
        // 'for' every page
        for(let i=0; i<totalPageNum; i++){
            const pageLink = `
                <li>
                    <a href="#">${i + 1}</a>
                </li>
            `;
            // append our new page link section to the site
            $('.pagination ul').append(pageLink);
        }
    }

    $('.pagination ul li').children().first().addClass('active'); 
        
        // define what happens when you click a link (event listener)
        $('.pagination ul').on('click', 'a', function(e){
            e.preventDefault();
            const pgNum = parseInt($(e.target).text());
            // Use showPage() to display the page for the link clicked
            showPage(studentList, pgNum);
            // mark that link as 'active'
            $(this).parent().siblings().children().removeClass('active');
            $(this).addClass('active');
        });
} 

showPage($studentList);
appendPageLinks($studentList);
</script>
</body>

</html>
