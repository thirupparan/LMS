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
        <script>
            function getAddBookMainClassification() {
                $.ajax({
                    url: 'GetMainClassificationController',
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfList = Object.keys(json.MainClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Main Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += "<option value='" + json.MainClassification[x].MainClassificationId + "'>" + json.MainClassification[x].MainClassificationName + "</option>";
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#addBookMainClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option)
                                ;
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function getEditBookMainClassification() {
                $.ajax({
                    url: 'GetMainClassificationController',
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfList = Object.keys(json.MainClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Main Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += '<option value="' + json.MainClassification[x].mainClassificationId + '">' + json.MainClassification[x].mainClassificationName + '</option>';
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editBookMainClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option)
                                ;
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function loadAddBookPublishYear() {
                var date = new Date();
                var endYear = 1800;

                option = '<option>Select Publish Year</option>';
                for (var publishYear = date.getFullYear(); publishYear >= endYear; publishYear--) {
                    option += '<option value="' + publishYear + '">' + publishYear + '</option>';
                }

                $('#addBookPublishYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function loadEditBookPublishYear() {
                var date = new Date();
                var endYear = 1800;

                option = '<option>Select Publish Year</option>';
                for (var publishYear = date.getFullYear(); publishYear >= endYear; publishYear--) {
                    option += '<option value="' + publishYear + '">' + publishYear + '</option>';
                }

                $('#editBookPublishYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function loadAllSubClassification() {
                $.ajax({
                    url: 'GetSubClassificationController',

                    complete: function (responsex) {
                        var json = JSON.parse(responsex.responseText);
                        var noOfList = Object.keys(json.SubClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Sub Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editBookSubClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option);
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function loadAllLastPrintYear(publishYear) {
                var date = new Date();
                option = '<option>Select Last Print Year</option>';
                for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                    option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                }

                $('#editBookLastPrintYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function getBookDetailsById(editBookId) {
                $.ajax({
                    url: 'GetBookDetailsByIdController?bookId=' + editBookId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);

                        var bookId = json.books[0].bookId;
                        var bookTitle = json.books[0].Title;
                        var bookAuthor = json.books[0].Author;
                        var bookPublishYear = json.books[0].PublishYear;
                        var bookLastPrintYear = json.books[0].LastPrintYear;
                        var bookISBN = json.books[0].ISBN;
                        var bookNoOfPages = json.books[0].NoOfPages;
                        var bookMainClassificationId = json.books[0].MainClassificationId;
                        var bookMainClassificationName = json.books[0].MainClassificationName;
                        var bookSubClassificationId = json.books[0].SubClassificationId;
                        var bookSubClassificationName = json.books[0].SubClassificationName;

                        $("#editBookIdLabel").text(bookId);
                        $("#editBookId").val(bookId);
                        $("#editBookTitle").val(bookTitle);
                        $("#editBookAuthor").val(bookAuthor);
                        $("#editBookMainClassification").val(bookMainClassificationId);

                        getSubClassificationByMainClassificationEditBox(bookMainClassificationId);
                        setTimeout(function () {
                            $("#editBookSubClassification").val(bookSubClassificationId);
                        }, 100);

                        $("#editBookPublishYear").val(bookPublishYear);
                        loadAllLastPrintYear(bookPublishYear);
                        setTimeout(function () {
                            $("#editBookLastPrintYear").val(bookLastPrintYear);
                        }, 100);
                        $("#editISBN").val(bookISBN);
                        $("#editNoOfPages").val(bookNoOfPages);
                    },
                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function getSubClassificationByMainClassificationEditBox(mainClassificationId) {
                //var mainClassificationId = $('#editBookMainClassification :selected').val();
                $.ajax({
                    url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                    complete: function (responsex) {
                        var json = JSON.parse(responsex.responseText);
                        var noOfList = Object.keys(json.SubClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Sub Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editBookSubClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option);
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            $(document).ready(function () {
                $("#addBookMainClassification").change(function () {
                    var mainClassificationId = this.value;
                    $.ajax({
                        url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                        complete: function (responsex) {
                            var json = JSON.parse(responsex.responseText);
                            var noOfList = Object.keys(json.SubClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            option = '<option>Select Sub Classification</option>';

                            for (var x = 0; x < noOfList; x++) {
                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                            }
                            //$('#idMainClassification').append(option);

                            $('#addBookSubClassification')
                                    .find('option')
                                    .remove()
                                    .end()
                                    .append(option);
                        },

                        error: function () {
                            //$('#id').html('Error receiving the response from json');
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });

                $("#editBookMainClassification").change(function () {
                    var mainClassificationId = this.value;
                    $.ajax({
                        url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                        complete: function (responsex) {
                            var json = JSON.parse(responsex.responseText);
                            var noOfList = Object.keys(json.SubClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            option = '<option>Select Sub Classification</option>';

                            for (var x = 0; x < noOfList; x++) {
                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                            }
                            //$('#idMainClassification').append(option);

                            $('#editBookSubClassification')
                                    .find('option')
                                    .remove()
                                    .end()
                                    .append(option);
                        },

                        error: function () {
                            //$('#id').html('Error receiving the response from json');
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });

                $("#addBookPublishYear").change(function () {
                    var publishYear = this.value;
                    var date = new Date();

                    option = '<option>Select Last Print Year</option>';
                    for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                        option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                    }

                    $('#addBookLastPrintYear')
                            .find('option')
                            .remove()
                            .end()
                            .append(option);
                });

                $("#editBookPublishYear").change(function () {
                    var publishYear = this.value;
                    var date = new Date();

                    option = '<option>Select Last Print Year</option>';
                    for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                        option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                    }

                    $('#editBookLastPrintYear')
                            .find('option')
                            .remove()
                            .end()
                            .append(option);
                });

                $(document).on('click', 'i[id^="editBtn"]', function () {
                    //alert($(this).attr('value'));
                    var editBookId = $(this).attr('value');
                    getEditBookMainClassification();
                    loadAllSubClassification();
                    loadEditBookPublishYear();
                    getBookDetailsById(editBookId);
                });

                $(document).on('click', 'i[id^="deleteBtn"]', function () {
                    //alert($(this).attr('value'));
                    var deleteBookId = $(this).attr('value');
                    var deleteBookIdValue = $(this).attr('id');
                    //alert(deleteBookIdValue);
                    $("#deleteBookId").val(deleteBookId);
                });

                $("#btnViewAll").click(function () {
                    $("#tbodyBookDetails").empty();

                    $("#totalRecordCount").empty();

                    var viewAllRecords = $("#btnViewAll").attr("value");

                    $.ajax({
                        url: 'SearchBookController?viewAllRecords=' + viewAllRecords,

                        complete: function (viewResponse) {
                            var json = JSON.parse(viewResponse.responseText);
                            var noOfList = Object.keys(json.books).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            for (var x = 0; x < noOfList; x++) {
                                var bookId = json.books[x].bookId;
                                var bookTitle = json.books[x].Title;
                                var bookAuthor = json.books[x].Author;
                                var bookPublishYear = json.books[x].PublishYear;
                                var bookLastPrintYear = json.books[x].LastPrintYear;
                                var bookISBN = json.books[x].ISBN;
                                var bookNoOfPages = json.books[x].NoOfPages;
                                var bookMainClassificationId = json.books[x].MainClassificationId;
                                var bookMainClassificationName = json.books[x].MainClassificationName;
                                var bookSubClassificationId = json.books[x].SubClassificationId;
                                var bookSubClassification = json.books[x].SubClassificationName;

                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                var tbodyViewAll = '<tr>\n\
                                                    <td>' + bookId + '</td>\n\
                                                    <td>' + bookTitle + '</td>\n\
                                                    <td>' + bookAuthor + '</td>\n\
                                                    <td>' + bookMainClassificationName + '</td>\n\
                                                    <td>' + bookSubClassification + '</td>\n\
                                                    <td>' + bookPublishYear + '</td>\n\
                                                    <td>' + bookLastPrintYear + '</td>\n\
                                                    <td>' + bookISBN + '</td>\n\
                                                    <td>' + bookNoOfPages + '</td>\n\
                                                    <td>\n\
                                                        <a href="#editBookModal" class="edit" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + bookId + '" value="' + bookId + '" title="Edit">&#xE254;</i></a>\n\
                                                        <a href="#deleteBookModal" class="delete" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + bookId + '" value="' + bookId + '" title="Delete">&#xE872;</i></a>\n\
                                                    </td>\n\
                                                    </tr>';

                                $("#tbodyBookDetails").append(tbodyViewAll);
                            }
                            var totalRecords = "Total <b>" + noOfList + "</b> record(s)";
                            $("#totalRecordCount").append(totalRecords);
                        },

                        error: function () {
                            //$('#id').html('Error receiving the response from json');
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });

                $("#btnSearchBook").click(function () {
                    $("#tbodyBookDetails").empty();

                    $("#totalRecordCount").empty();

                    var firstFilterType = $("#firstFilterType").find('option:selected').attr('id');
                    var firstFilterText = $("#firstFilterText").val();
                    var secondFilterType = $("#secondFilterType").find('option:selected').attr('id');
                    var secondFilterText = $("#secondFilterText").val();
                    //var editBookId = $(this).attr('value');

                    $.ajax({
                        url: 'SearchBookController?firstFilterText=' + firstFilterText + '&firstFilterType=' + firstFilterType + '&secondFilterType=' + secondFilterType + '&secondFilterText=' + secondFilterText,

                        complete: function (searchResponse) {
                            var json = JSON.parse(searchResponse.responseText);
                            var noOfList = Object.keys(json.books).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            for (var x = 0; x < noOfList; x++) {
                                var bookId = json.books[x].bookId;
                                var bookTitle = json.books[x].Title;
                                var bookAuthor = json.books[x].Author;
                                var bookPublishYear = json.books[x].PublishYear;
                                var bookLastPrintYear = json.books[x].LastPrintYear;
                                var bookISBN = json.books[x].ISBN;
                                var bookNoOfPages = json.books[x].NoOfPages;
                                var bookMainClassificationId = json.books[x].MainClassificationId;
                                var bookMainClassificationName = json.books[x].MainClassificationName;
                                var bookSubClassificationId = json.books[x].SubClassificationId;
                                var bookSubClassification = json.books[x].SubClassificationName;

                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                var tbodyViewAll = '<tr>\n\
                                                    <td>' + bookId + '</td>\n\
                                                    <td>' + bookTitle + '</td>\n\
                                                    <td>' + bookAuthor + '</td>\n\
                                                    <td>' + bookMainClassificationName + '</td>\n\
                                                    <td>' + bookSubClassification + '</td>\n\
                                                    <td>' + bookPublishYear + '</td>\n\
                                                    <td>' + bookLastPrintYear + '</td>\n\
                                                    <td>' + bookISBN + '</td>\n\
                                                    <td>' + bookNoOfPages + '</td>\n\
                                                    <td>\n\
                                                        <a href="#editBookModal" class="edit" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + bookId + '" value="' + bookId + '" title="Edit">&#xE254;</i></a>\n\
                                                        <a href="#deleteBookModal" class="delete" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + bookId + '" value="' + bookId + '" title="Delete">&#xE872;</i></a>\n\
                                                    </td>\n\
                                                    </tr>';

                                $("#tbodyBookDetails").append(tbodyViewAll);
                            }
                            var totalRecords = "Total <b>" + noOfList + "</b> record(s)";
                            $("#totalRecordCount").append(totalRecords);
                        },

                        error: function () {
                            //$('#id').html('Error receiving the response from json');
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });
            });


        </script>
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
            <div class="table-wrapper">
                <div class="table-title" style="background:#B2B8B4">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2 style="font-size:20px;">
                                <b>Book Details</b>
                            </h2>
                        </div>
                        <div class="col-sm-8 float-right col-lg-6 ">
                           <a href="#addBookModal" id="btnAddBook" class="btn btn-info" data-toggle="modal" onclick="getAddBookMainClassification();
                                    loadAddBookPublishYear();">
<!--                                <i class="material-icons">&#xE147;</i>-->
                                <span>Add New Book</span>
                            </a>
                            <a href="./ViewMainClassificationController" class="btn btn-info" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">
                                <span>View All</span>
                            </a>
                            <!--                             <button class="btn btn-info" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">View All</button>-->
                        </div>
                    </div>
                </div>
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
        </div>
        <!-- ADD BOOK -->
        <div id="addBookModal" class="modal fade">
            <div class="modal-dialog" style="max-width:60%;">
                <div class="modal-content">
                    <form method="get" action="AddBookController">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Book ID</label>
                                <input type="text" name="bookId" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Book Title</label>
                                <input type="text" name="bookTitle" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Book Author</label>
                                <input type="text" name="bookAuthor" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Main Classification</label>
                                <select class="form-control" id="addBookMainClassification" name="addBookMainClassification">
                                    <option>Select Main Classification</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification</label>
                                <select class="form-control" id="addBookSubClassification" name="addBookSubClassification">
                                </select>
                            </div>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Publish Year</label>
                                <select class="form-control" id="addBookPublishYear" name="addBookPublishYear">
                                    <option>Publish Year</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Last Print Year</label>
                                <select class="form-control" id="addBookLastPrintYear" name="addBookLastPrintYear">
                                    <option>Select Last Print Year</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>ISBN No</label>
                                <input type="text" name="isbn" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>No of Pages</label>
                                <input type="number" name="noofpages" class="form-control" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save" style="background: #54a754;">
                        </div>
                    </form>
                </div>
            </div>
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
