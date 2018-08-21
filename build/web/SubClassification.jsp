<%-- 
    Document   : SubClassification
    Created on : Aug 10, 2018, 8:32:35 PM
    Author     : thiru
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.sgc.model.SubClassification"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sgc.model.MainClassification"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <script src ="http://code.jquery.com/jquery-latest.js"></script>

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
            function getMainClassification() {
                $.ajax({
                    url: 'GetMainClassificationController',
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfRecords = Object.keys(json.MainClassification).length;
                        //var mainClassificationId = json.MainClassification[0].MainClassificationId;
                        //var mainClassificationName = json.MainClassification[0].MainClassificationName;

                        option = '<option Selected disabled hidden>Please select Main Classification</option>';

                        for (var x = 0; x < noOfRecords; x++) {
                            option += "<option value='" + json.MainClassification[x].MainClassificationId + "'>" + json.MainClassification[x].MainClassificationName + "</option>";
                        }

                        // Remove and load the main classification record in the drop down menu
                        $('#mainClassificationDropDown')
                                .find('option')
                                .remove()
                                .end()
                                .append(option);

                        $('#editSubClassificationMainClassification')
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

            function getEditSubClassificationMainClassification(subClassificationId) {
                $.ajax({
                    url: 'GetMainClassificationController?subClassificationId=' + subClassificationId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfList = Object.keys(json.MainClassification).length;
                        option = '<option>Select Main Classification</option>';
                        for (var x = 0; x < noOfList; x++) {
                            option += '<option value="' + json.MainClassification[x].mainClassificationId + '">' + json.MainClassification[x].mainClassificationName + '</option>';
                        }
                        $('#editSubClassificationMainClassification')
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

            function getSubClassificationDetailsById(subClassificationId) {
                $.ajax({
                    url: 'GetSubClassificationByIdController?subClassificationId=' + subClassificationId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);

                        var subClassificationId = json.SubClassification[0].SubClassificationId;
                        var subClassificationName = json.SubClassification[0].SubClassificationName;
                        var mainClassificationId = json.SubClassification[0].MainClassificationId;
                        var mainClassificationName = json.SubClassification[0].MainClassificationName;

                        $("#editSubClassificationIdLabel").text(subClassificationId);
                        $("#editSubClassificationId").val(subClassificationId);

                        setTimeout(function () {
                            $("#editSubClassificationMainClassification").val(mainClassificationId);
                        }, 100);

                        $("#editSubClassificationName").val(subClassificationName);
                    },
                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            $(document).ready(function () {
                $("#btnAddSubClassification").click(function () {
                    getMainClassification();
                });

                $(document).on('click', 'i[id^="editBtn"]', function () {
                    var editSubClassificationId = $(this).attr('value');
                    getMainClassification();

                    setTimeout(function () {
                        getSubClassificationDetailsById(editSubClassificationId);
                    }, 100);
                });

            });
            $(document).on('click', 'i[id^="deleteBtn"]', function () {
                //alert($(this).attr('value'));
                var deleteSubClassificationId = $(this).attr('value');
                var deleteSubClassificationIdValue = $(this).attr('id');
                //alert(deleteBookIdValue);
                $("#deleteSubClassificationId").val(deleteSubClassificationId);
            });
            

        </script>
        <title>Sub Classification</title>
    </head>
    <body>

        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="index.jsp"><img  src="img/Home-icon (1).png" width="40" height="40"></a>

                <a class="nav-link text-dark" href="ViewBookController">Book<span class="sr-only">(current)</span></a>


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
<!--                                        <li><a class="dropdown-item" href="#">Edite main Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Delete main classification</a></li>-->

                                    </ul>
                                </li>
                                <li class="dropdown-submenu"><a class="dropdown-item dropdown-toggle" href="#">Sub Classification</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="./ViewSubClassificationController">Add Sub Classification</a></li>
<!--                                        <li><a class="dropdown-item" href="#">Edite sub Classification</a></li>
                                        <li><a class="dropdown-item" href="#">Delete main Classification</a></li>-->
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>      
                <!--search-->
                <form method="get" action="SearchSubClassificationController"class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="text"  id="myInput" name="searchText" placeholder="Search" aria-label="Search"style="width:200px; display: initial;"/>
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
                                <b>Sub Classifications</b>
                            </h2>
                        </div>
                        <div class="col-sm-8">
                            <a href="#addSubClassificationModal" id="btnAddSubClassification" class="btn btn-info" data-toggle="modal" >
                                <!--<i class="material-icons">&#xE147;</i>-->
                                <span>Add New Sub Classification</span>
                            </a>
                            <a href="ViewMainClassificationController" class="btn btn-info" >
                                <!--                                <i class="material-icons">star</i>-->
                                <span>Main Classification</span>
                            </a>
                            <a href="ViewSubClassificationController" class="btn btn-info" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">
                                <span>View All</span>
                            </a>
                            <!--                             <button class="btn btn-info" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">View All</button>-->
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th style="width:auto;">Sub Classification ID</th>
                            <th style="width:auto;">Sub Classification Name</th>
                            <th style="width:auto;">Main Classification ID</th>
                            <th style="width:auto;">Main Classification Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (request.getAttribute("result") != null) {
                                ArrayList<SubClassification> result = (ArrayList) request.getAttribute("result");
                                SubClassification b = null;
                                for (int i = 0; i < result.size(); i++) {
                                    b = result.get(i);
                        %>
                        <tr>
                            <td style="width: auto;"><%=b.getSubClassificationId()%></td>
                            <td><%=b.getSubClassificationName()%></td>
                            <td><%=b.getMainClassificationId()%></td>
                            <td><%=b.getMainClassificationName()%></td>
                            <td>
                                <a href="#editSubClassificationModal" class="edit" data-toggle="modal">
                                    <i class="material-icons" data-toggle="tooltip" id="editBtn<%=b.getSubClassificationId()%>" value="<%=b.getSubClassificationId()%>" title="Edit">&#xE254;</i>
                                </a>
                                <a href="#deleteSubClassificationModal" class="delete" data-toggle="modal">
                                    <i class="material-icons" data-toggle="tooltip" id="deleteBtn<%=b.getSubClassificationId()%>" value="<%=b.getSubClassificationId()%>" title="Delete">&#xE872;</i>
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
        <!-- Add Sub Classification HTML -->
        <div id="addSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="AddSubClassificationController">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Sub Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Sub Classification ID</label>
                                <input type="text" class="form-control" name="subClassificationId" id="subClassificationId" required>
                            </div>
                            <div class="form-group" style="margin-bottom:20px;">
                                <label>Main Classification</label>
                                <select class="form-control" name="mainClassificationDropDown" id="mainClassificationDropDown">

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification Name</label>
                                <input type="text" class="form-control" name="subClassificationName" id="subClassificationName" required>
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
        <!-- Edit Sub Classification -->
        <div id="editSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="EditSubClassificationController">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Sub Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Sub Classification ID</label>
                                <label class="form-control" id="editSubClassificationIdLabel" name="editSubClassificationIdLabel" readonly></label>
                                <input type="text" name="editSubClassificationId" id="editSubClassificationId" class="form-control" hidden style="display:none;">
                            </div>
                            <div class="form-group">
                                <label>Main Classification</label>
                                <select class="form-control" style="margin-bottom:20px;" id="editSubClassificationMainClassification" name="editSubClassificationMainClassification">
                                    <option>Main Classification</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification Name</label>
                                <input type="text" class="form-control" id="editSubClassificationName" name="editSubClassificationName" required>
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
        <!--Delete Sub Classification model -->
        <div id="deleteSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="DeleteSubClassificationController">
                        <input type="text" name="deleteSubClassificationId" id="deleteSubClassificationId" hidden style="display:none;"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Sub Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete this record?</p>
                            <p class="text-warning">
                                <small>This action cannot be undone.</small>
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
