<%-- 
    Document   : AddBook
    Created on : Jul 29, 2018, 9:45:58 AM
    Author     : thirupparan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="contents/bootstrap-4.1.3-dist/css/bootstrap.min.css">
        <script src="contents/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
        <style>
            .dropdown-submenu {
                position: relative;
            }

            .dropdown-submenu a::after {
                transform: rotate(-90deg);
                position: absolute;
                right: 6px;
                top: .8em;
            }

            .dropdown-submenu .dropdown-menu {
                top: 0;
                left: 100%;
                margin-left: .1rem;
                margin-right: .1rem;
            }
            .m1{
                top: 25px;
                padding:auto;
                margin-top: 25px
            }
        </style>

        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="index.jsp"><img  src="img/Home-icon (1).png" width="40" height="40"></a>

                <a class="nav-link text-dark" href="AddBook.jsp">Add Book<span class="sr-only">(current)</span></a>


                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Classification
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                                <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">Main Classification</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Add Main Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Edite main Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Delete main classification</a></li>

                                    </ul>
                                </li>
                                <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">Sub Classification</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Add Sub Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Edite sub Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Delete main Classification</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>      
                <!--search-->
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </nav>
        </div>
        <div class="row">
            <div class="m1 bg-light col col-lg-3 offset-3">

                <form class=" bg-light form-group " action="BookController" method="get">                
                    Book Id
                    <input class="form-control" type="text"placeholder="Book Id" name ="bookId">
                    Book Title 
                    <input class="form-control" type="text" placeholder="Book Title " name ="title">
                    Author
                    <input class="form-control" type="text" placeholder="Author" name ="author">
                    Main Classification
                    <input class="form-control" type="text" placeholder="Main Classification" name ="mainClassification">
                    Sub Classification
                    <input class="form-control" type="text" placeholder=" Sub Classification" name ="subClassification">
                    </div>
                    <div class=" m1 bg-light col col-lg-3">
                        Year Of Published 
                        <select name ="yearOfPublished" id="publishedYear" class="form-control">
                            <option value="">Published Year</option>
                        </select>    
                        Last Printed Year 
                        <select name ="lastPrintedYear" id="printedYear" class="form-control">
                            <option value="">Printed Year</option>
                        </select>     
                        ISBN 
                        <input class="form-control" type="text" placeholder="ISBN " name ="ISBN">
                        No Of Pages
                        <input class="form-control mb-3" type="text" placeholder=" No Of Pages" name ="noOfPages">

                        <input class="btn btn-success float-right mb-3" type="submit" name="save" value="submit" >
                        </form>
                    </div>
            </div>
    </body>
    <script>
        $('.dropdown-menu a.dropdown-toggle').on('click', function (e) {
            if (!$(this).next().hasClass('show')) {
                $(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
            }
            var $subMenu = $(this).next(".dropdown-menu");
            $subMenu.toggleClass('show');


            $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function (e) {
                $('.dropdown-submenu .show').removeClass("show");
            });


            return false;
        });

        function loaddropdown()
        {
            var fpy = document.getElementById('publishedYear');
            var lpy = document.getElementById('printedYear');

            var cYear = (new Date()).getFullYear();
            for (var i = 1900; i <= cYear; i++) {
                var theOption = new Option;
                theOption.text = i;
                theOption.value = i;
                fpy.options[i + 1 - 1900] = theOption;
            }

            for (var i = 1900; i <= cYear; i++) {
                var theOption = new Option;
                theOption.text = i;
                theOption.value = i;
                lpy.options[i + 1 - 1900] = theOption;
            }
        }
        window.onload = loaddropdown();

    </script>
</html>
