<%-- 
    Document   : MainClassification
    Created on : Aug 7, 2018, 8:13:26 PM
    Author     : thirupparan
--%>

<%@page import="java.util.List"%>
<%@page import="com.sgc.model.MainClassification"%>
<%@page import="com.sgc.data.MainClassificationDao"%>
<%@page import="com.sgc.data.DatabaseConnect" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Classification</title>
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

            function getMainClassificationDetailsById(mainClassificationId) {
                $.ajax({
                    url: 'GetMainClassificationByIdController?mainClassificationId=' + mainClassificationId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);

                        var mainClassificationId = json.MainClassification[0].MainClassificationId;
                        var mainClassificationName = json.MainClassification[0].MainClassificationName;

                        $("#classificationName").val(mainClassificationName);
                    },
                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }
            $(document).on('click', 'i[id^="deleteBtn"]', function () {
                var deleteMainClassificationId = $(this).attr('value');
                var deleteMainClassificationIdValue = $(this).attr('id');
                $("#deleteMainClassificationId").val(deleteMainClassificationId);
            });





            /*
             $("#editBookMainClassification").change(function () {
             var noOfList = Object.keys(json.MainClassification).length;
             option = '<option>Select Main Classification</option>';
             
             for (var x = 0; x < noOfList; x++) {
             option += '<option value="' + json.MainClassification[x].mainClassificationId + '">' 
             + json.MainClassification[x].mainClassificationName + '</option>';
             }
             
             $('#addSubClassificationMainClassification')
             .find('option')
             .remove()
             .end()
             .append(option)
             ;
             });
             
             <select id="">
             <option></option>
             </select>
             
             */



            $(document).ready(function () {
                $(document).on('click', 'i[id^="editBtn"]', function () {
                    var editMainClassificationId = $(this).attr('value');
                    //alert(editSubClassificationId);

                    setTimeout(function () {
                        getMainClassificationDetailsById(editMainClassificationId);
                    }, 100);

                    $("#mainClassificationId").val(editMainClassificationId);
                });
            });
        </script>
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
                                        <li><a class="dropdown-item" href="/ViewMainClassificationController">Add Main Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Edite main Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Delete main classification</a></li>

                                    </ul>
                                </li>
                                <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">Sub Classification</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="./ViewSubClassificationController">Add Sub Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Edite sub Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Delete main Classification</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>      
                <!--search-->
                <form method="get" action="SearchMainController"class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" id="searchText" name="searchText" placeholder="Search" aria-label="Search"style="width:200px; display: initial;"/>
                    <button class="btn btn-success my-2 my-sm-0" type="submit"id="btnSearchMainClassification" name="btnSearchMainClassification">Search</button>
                </form>
            </nav>
        </div>
        <!-- mainthings -->
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title" style="background:#B2B8B4">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2 style="font-size:20px;">
                                <b>Main Classifications</b>
                            </h2>
                        </div>
                        <div class="col-sm-8">
                            <a href="#addMainClassificationModal" class="btn btn-info" data-toggle="modal">
                                <!--<i class="material-icons">&#xE147;</i>-->
                                <span>Add New Main Classification</span>
                            </a>
                            <a href="./ViewSubClassificationController" class="btn btn-info">
                                <!--<i class="material-icons">star</i>-->
                                <span>Add New Sub Classification</span>
                            </a>
                            <a href="./ViewMainClassificationController" class="btn btn-info" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">
                                <span>View All</span>
                            </a>
                            <!--                             <button class="btn btn-info" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">View All</button>-->
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th style="width:auto;">ID</th>
                            <th style="width:auto;">Main Classification Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (request.getAttribute("result") != null) {
                                List<MainClassification> result = (List) request.getAttribute("result");
                                MainClassification b = null;
                                for (int i = 0; i < result.size(); i++) {
                                    b = result.get(i);
                        %>
                        <tr>
                            <td style="width: 5%"><%=b.getMainClassificationId()%></td>
                            <td><%=b.getMainClassificationName()%></td>
                            <td>
                                <a href="#editMainClassificationModal" class="edit" data-toggle="modal">
                                    <i class="material-icons" data-toggle="tooltip" id="editBtn<%=b.getMainClassificationId()%>" value="<%=b.getMainClassificationId()%>" title="Edit">&#xE254;</i>
                                </a>
                                <a href="#deleteMainClassificationModal" class="delete" data-toggle="modal">
                                    <i class="material-icons" data-toggle="tooltip"  id="deleteBtn<%=b.getMainClassificationId()%>" value="<%=b.getMainClassificationId()%>" title="Delete">&#xE872;</i>
                                </a>
                            </td>

                        </tr>
                        <%}
                            }%>

                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text">Total
                        <b>${records}</b> record(s)</div>
                </div>
            </div>
        </div>
        <!-- Add Modal HTML -->
        <div id="addMainClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainClassificationController" method="get">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Main Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Main Classification ID</label>
                                <input type="text" class="form-control"name="mainClassificationId">
                            </div>
                            <div class="form-group">
                                <label>Main Classification Name</label>
                                <input type="text" class="form-control"name="classificationName" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Update Mainclassification  -->
        <div id="editMainClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="EditMainClassificationController" method="get">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Main Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Main Classification ID</label>
                                <!--<label class="form-control" name="mainClassificationId" value="" disabled ></label>-->
                                <input type="text" id="mainClassificationId" class="form-control" name="mainClassificationId" readonly required>
                            </div>
                            <div class="form-group">
                                <label>Main Classification Name</label>
                                <input type="text" class="form-control" id="classificationName" name="classificationName" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Update" name="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Delete mainclassification  -->
        <div id="deleteMainClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="DeleteMainClassificationController">
                        <input type="text" name="deleteMainClassificationId" id="deleteMainClassificationId" hidden style="display:none;"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Main Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete this record?</p>
                            <p class="text-danger">
                                <small>This action cannot be undo.</small>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
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
