<%-- 
    Document   : SearchBook
    Created on : Aug 6, 2018, 10:49:36 PM
    Author     : thirupparan
--%>

<%@page import="java.util.List"%>
<%@page import="com.sgc.model.Book"%>
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
        <!-- edit delete buton -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <!-- -->
        <!-- new -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--new -->


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
            .table{
                top: 25px;
                padding:auto;
                margin-top: 25px
            }
        </style>
        <title>search Book</title>
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
                                        <li><a class="dropdown-item" href="./ViewMainClassificationController">Add Main Classification</a></li>
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
        <div class="container">
            <table class="table" id="keywords" class="table table-responsive " cellspacing="0" cellpadding="0">
                <thead class="thead-light">
                    <tr>
                        <th style="width: 8%;" >Book ID</th>
                        <th >Title</th>
                        <th >Author</th>
                        <th>Main Class</th>
                        <th>Sub Class</th>
                        <th>Published Year</th>
                        <th>Printed Year</th>
                        <th>ISBN No</th>
                        <th>No Of Pages</th>
                        <th style="width: 8%"> </th>
                    </tr>
                </thead> 
                <tbody class="table-hover">
                    <%
                        if (request.getAttribute("result") != null) {
                            List<Book> result = (List) request.getAttribute("result");
                            Book b = null;
                            for (int i = 0; i < result.size(); i++) {
                                b = result.get(i);
                    %>
                    <tr>
                        <td style=" width: 5%;"><%=b.getBookId()%></td>
                        <td><%=b.getTitle()%></td>
                        <td><%=b.getAuthor()%></td>
                        <td><%=b.getMainClassification()%></td>
                        <td><%=b.getSubClassification()%></td>
                        <td><%=b.getYearOfPublishing()%></td>
                        <td><%=b.getLastPrintedYear()%></td>
                        <td><%=b.getISBN()%></td>
                        <td><%=b.getNoOfPages()%></td>
                        <td>
                            <div class="row">
                                <a href="#editBookModal" class="edit" data-toggle="modal">
                                    <i class="material-icons" data-toggle="tooltip" value="<%=b.getBookId()%>" title="Edit">&#xE254;</i>
                                </a>
                       <!-- <div class="row"><form action="" method="get"><button name="edit" class="btn btn-link"  value="<%=b.getBookId()%>"><i class="fas fa-edit"></i></button></form> -->
                                <form action="DeleteBookController" method="get"><button name="delete" title="Delete" class="btn btn-link "  value="<%=b.getBookId()%>"><i class="fas fa-trash"></i></button></form></div>
                        </td>
                    </tr>
                    <%}
                        }%>
                </tbody>
            </table>
        </div>
        <!-- edite model-->
        <div id="editBookModal" class="modal fade">
            <div class="modal-dialog" style="max-width:100%;">
                <div class="modal-content">
                    <form method="get" action="EditBookController">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Book ID</label>
                                <label class="form-control" disabled name =""">B001</label>
                            </div>
                            <div class="form-group">
                                <label>Book Title</label>
                                <input type="text" class="form-control" required name ="title">
                            </div>
                            <div class="form-group">
                                <label>Book Author</label>
                                <input type="text" class="form-control" required name ="author">
                            </div>
                            <div class="form-group">
                                <label>Main Classification</label>
                                <select class="form-control" name="mainclassiffication">
                                    <option>Main Classification</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification</label>
                                <select class="form-control"name="subclassification">
                                    <option>Sub Classification</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Publish Year</label>
                                <select class="form-control"name="publishedyear">
                                    <option>Publish Year</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Last Print Year</label>
                                <input type="text" class="form-control" required name="lastprint">
                            </div>
                            <div class="form-group">
                                <label>ISBN No</label>
                                <input type="text" class="form-control" required name="isbn">
                            </div>
                            <div class="form-group">
                                <label>No of Pages</label>
                                <input type="number" class="form-control" required name="numberofpage">
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Update">
                        </div>
                    </form>
                </div>
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
    </script>
</html>
