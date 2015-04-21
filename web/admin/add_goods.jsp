<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Form Elements - Ace Admin</title>

    <meta name="description" content="Common form elements and layouts"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!--basic styles-->

    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!--page specific plugin styles-->

    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css"/>
    <link rel="stylesheet" href="assets/css/chosen.css"/>
    <link rel="stylesheet" href="assets/css/datepicker.css"/>
    <link rel="stylesheet" href="assets/css/bootstrap-timepicker.css"/>
    <link rel="stylesheet" href="assets/css/daterangepicker.css"/>
    <link rel="stylesheet" href="assets/css/colorpicker.css"/>

    <!--ace styles-->

    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!--inline styles related to this page-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>
<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a href="#" class="brand">
                <small>
                    <i class="icon-leaf"></i>
                    Ace Admin
                </small>
            </a><!--/.brand-->

            <ul class="nav ace-nav pull-right">
                <li class="grey">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon-tasks"></i>
                        <span class="badge badge-grey">4</span>
                    </a>

                    <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
                        <li class="nav-header">
                            <i class="icon-ok"></i>
                            4 Tasks to complete
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left">Software Update</span>
                                    <span class="pull-right">65%</span>
                                </div>

                                <div class="progress progress-mini ">
                                    <div style="width:65%" class="bar"></div>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left">Hardware Upgrade</span>
                                    <span class="pull-right">35%</span>
                                </div>

                                <div class="progress progress-mini progress-danger">
                                    <div style="width:35%" class="bar"></div>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left">Unit Testing</span>
                                    <span class="pull-right">15%</span>
                                </div>

                                <div class="progress progress-mini progress-warning">
                                    <div style="width:15%" class="bar"></div>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
                                    <span class="pull-left">Bug Fixes</span>
                                    <span class="pull-right">90%</span>
                                </div>

                                <div class="progress progress-mini progress-success progress-striped active">
                                    <div style="width:90%" class="bar"></div>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                See tasks with details
                                <i class="icon-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="purple">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon-bell-alt icon-animated-bell"></i>
                        <span class="badge badge-important">8</span>
                    </a>

                    <ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-closer">
                        <li class="nav-header">
                            <i class="icon-warning-sign"></i>
                            8 Notifications
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-pink icon-comment"></i>
												New Comments
											</span>
                                    <span class="pull-right badge badge-info">+12</span>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="btn btn-mini btn-primary icon-user"></i>
                                Bob just signed up as an editor ...
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-success icon-shopping-cart"></i>
												New Orders
											</span>
                                    <span class="pull-right badge badge-success">+8</span>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-info icon-twitter"></i>
												Followers
											</span>
                                    <span class="pull-right badge badge-info">+11</span>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                See all notifications
                                <i class="icon-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="green">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon-envelope icon-animated-vertical"></i>
                        <span class="badge badge-success">5</span>
                    </a>

                    <ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
                        <li class="nav-header">
                            <i class="icon-envelope-alt"></i>
                            5 Messages
                        </li>

                        <li>
                            <a href="#">
                                <img src="assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar"/>
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Alex:</span>
												Ciao sociis natoque penatibus et auctor ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>a moment ago</span>
											</span>
										</span>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <img src="assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar"/>
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Susan:</span>
												Vestibulum id ligula porta felis euismod ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>20 minutes ago</span>
											</span>
										</span>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <img src="assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar"/>
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Bob:</span>
												Nullam quis risus eget urna mollis ornare ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>3:15 pm</span>
											</span>
										</span>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                See all messages
                                <i class="icon-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>Welcome,</small>
									Jason
								</span>

                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                Settings
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                Profile
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="#">
                                <i class="icon-off"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!--/.ace-nav-->
        </div>
        <!--/.container-fluid-->
    </div>
    <!--/.navbar-inner-->
</div>

<div class="main-container container-fluid">
    <a class="menu-toggler" name="menu-toggler" href="#">
        <span class="menu-text"></span>
    </a>

    <div class="sidebar" name="sidebar">
        <div class="sidebar-shortcuts" name="sidebar-shortcuts">
            <div class="sidebar-shortcuts-large" name="sidebar-shortcuts-large">
                <button class="btn btn-small btn-success">
                    <i class="icon-signal"></i>
                </button>

                <button class="btn btn-small btn-info">
                    <i class="icon-pencil"></i>
                </button>

                <button class="btn btn-small btn-warning">
                    <i class="icon-group"></i>
                </button>

                <button class="btn btn-small btn-danger">
                    <i class="icon-cogs"></i>
                </button>
            </div>

            <div class="sidebar-shortcuts-mini" name="sidebar-shortcuts-mini">
                <span class="btn btn-success"></span>

                <span class="btn btn-info"></span>

                <span class="btn btn-warning"></span>

                <span class="btn btn-danger"></span>
            </div>
        </div>
        <!--#sidebar-shortcuts-->

        <ul class="nav nav-list">
            <li>
                <a href="index.jsp">
                    <i class="icon-dashboard"></i>
                    <span class="menu-text"> Dashboard </span>
                </a>
            </li>

            <li>
                <a href="typography.html">
                    <i class="icon-text-width"></i>
                    <span class="menu-text"> Typography </span>
                </a>
            </li>

            <li>
                <a href="#" class="dropdown-toggle">
                    <i class="icon-desktop"></i>
                    <span class="menu-text"> UI Elements </span>

                    <b class="arrow icon-angle-down"></b>
                </a>

                <ul class="submenu">
                    <li>
                        <a href="elements.html">
                            <i class="icon-double-angle-right"></i>
                            Elements
                        </a>
                    </li>

                    <li>
                        <a href="buttons.html">
                            <i class="icon-double-angle-right"></i>
                            Buttons &amp; Icons
                        </a>
                    </li>

                    <li>
                        <a href="treeview.html">
                            <i class="icon-double-angle-right"></i>
                            Treeview
                        </a>
                    </li>

                    <li>
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-double-angle-right"></i>

                            Three Level Menu
                            <b class="arrow icon-angle-down"></b>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="#">
                                    <i class="icon-leaf"></i>
                                    Item #1
                                </a>
                            </li>

                            <li>
                                <a href="#" class="dropdown-toggle">
                                    <i class="icon-pencil"></i>

                                    4th level
                                    <b class="arrow icon-angle-down"></b>
                                </a>

                                <ul class="submenu">
                                    <li>
                                        <a href="#">
                                            <i class="icon-plus"></i>
                                            Add Product
                                        </a>
                                    </li>

                                    <li>
                                        <a href="#">
                                            <i class="icon-eye-open"></i>
                                            View Products
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>

            <li>
                <a href="tables.html">
                    <i class="icon-list"></i>
                    <span class="menu-text"> Tables </span>
                </a>
            </li>

            <li class="active open">
                <a href="#" class="dropdown-toggle">
                    <i class="icon-edit"></i>
                    <span class="menu-text"> Forms </span>

                    <b class="arrow icon-angle-down"></b>
                </a>

                <ul class="submenu">
                    <li class="active">
                        <a href="form-elements.html">
                            <i class="icon-double-angle-right"></i>
                            Form Elements
                        </a>
                    </li>

                    <li>
                        <a href="form-wizard.html">
                            <i class="icon-double-angle-right"></i>
                            Wizard &amp; Validation
                        </a>
                    </li>

                    <li>
                        <a href="wysiwyg.html">
                            <i class="icon-double-angle-right"></i>
                            Wysiwyg &amp; Markdown
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="widgets.html">
                    <i class="icon-list-alt"></i>
                    <span class="menu-text"> Widgets </span>
                </a>
            </li>

            <li>
                <a href="calendar.html">
                    <i class="icon-calendar"></i>

							<span class="menu-text">
								Calendar
								<span class="badge badge-transparent tooltip-error"
                                      title="2&nbsp;Important&nbsp;Events">
									<i class="icon-warning-sign red bigger-130"></i>
								</span>
							</span>
                </a>
            </li>

            <li>
                <a href="gallery.html">
                    <i class="icon-picture"></i>
                    <span class="menu-text"> Gallery </span>
                </a>
            </li>

            <li>
                <a href="#" class="dropdown-toggle">
                    <i class="icon-tag"></i>
                    <span class="menu-text"> More Pages </span>

                    <b class="arrow icon-angle-down"></b>
                </a>

                <ul class="submenu">
                    <li>
                        <a href="profile.html">
                            <i class="icon-double-angle-right"></i>
                            User Profile
                        </a>
                    </li>

                    <li>
                        <a href="pricing.html">
                            <i class="icon-double-angle-right"></i>
                            Pricing Tables
                        </a>
                    </li>

                    <li>
                        <a href="invoice.html">
                            <i class="icon-double-angle-right"></i>
                            Invoice
                        </a>
                    </li>

                    <li>
                        <a href="login.jsp">
                            <i class="icon-double-angle-right"></i>
                            Login &amp; Register
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="#" class="dropdown-toggle">
                    <i class="icon-file-alt"></i>

							<span class="menu-text">
								Other Pages
								<span class="badge badge-primary ">4</span>
							</span>

                    <b class="arrow icon-angle-down"></b>
                </a>

                <ul class="submenu">
                    <li>
                        <a href="error-404.html">
                            <i class="icon-double-angle-right"></i>
                            Error 404
                        </a>
                    </li>

                    <li>
                        <a href="error-500.html">
                            <i class="icon-double-angle-right"></i>
                            Error 500
                        </a>
                    </li>

                    <li>
                        <a href="grid.html">
                            <i class="icon-double-angle-right"></i>
                            Grid
                        </a>
                    </li>

                    <li>
                        <a href="blank.html">
                            <i class="icon-double-angle-right"></i>
                            Blank Page
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
        <!--/.nav-list-->

        <div class="sidebar-collapse" name="sidebar-collapse">
            <i class="icon-double-angle-left"></i>
        </div>
    </div>

    <div class="main-content">
        <div class="breadcrumbs" name="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="icon-home home-icon"></i>
                    <a href="#">Home</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
                </li>

                <li>
                    <a href="#">Forms</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
                </li>
                <li class="active">Form Elements</li>
            </ul>
            <!--.breadcrumb-->

            <div class="nav-search" name="nav-search">
                <form class="form-search"/>
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small nav-search-input"
                                       name="nav-search-input" autocomplete="off"/>
								<i class="icon-search nav-search-icon"></i>
							</span>
                </form>
            </div>
            <!--#nav-search-->
        </div>

        <div class="page-content">
            <div class="page-header position-relative">
                <h1>
                    Form Elements
                    <small>
                        <i class="icon-double-angle-right"></i>
                        Common form elements and layouts
                    </small>
                </h1>
            </div>
            <!--/.page-header-->

            <div class="row-fluid">
                <div class="span12">
                    <!--PAGE CONTENT BEGINS-->

                    <form id="add_goods_form" class="form-horizontal" method="post" action="addGoods.action"
                          enctype="multipart/form-data">
                        <div class="control-group">
                            <label class="control-label">商品名称</label>

                            <div class="controls">
                                <input type="text" name="goods_name" placeholder="商品名称"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">定价</label>

                            <div class="controls">
                                <input type="text" name="goods_price" placeholder="定价"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">简介</label>

                            <div class="controls">
                                <input type="text" name="goods_brief" placeholder="简介"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">规格</label>

                            <div class="controls">
                                <input type="text" name="goods_spe" placeholder="规格"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">初始库存</label>

                            <div class="controls">
                                <input type="text" name="goods_inventory" placeholder="初始库存"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label">邮费</label>

                            <div class="controls">
                                <input type="text" name="goods_postage" placeholder="邮费"/>
                            </div>
                        </div>

                        <%--文件上传--%>
                        <div class="span4">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4>图片上传</h4>
                                    <span class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="icon-chevron-up"></i>
                                        </a>
                                        <a href="#" data-action="close">
                                            <i class="icon-remove"></i>
                                        </a>
                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main">
                                        <input multiple="" type="file" id="id-input-file-3" name="files"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br><br><br><br><br><br><br><br><br><br><br><br>

                        <div class="widget-box">
                            <button class="btn btn-info" type="button" onclick="return $('#add_goods_form').submit()">
                                <i class="icon-ok bigger-110"></i>
                                Submit
                            </button>

                            &nbsp; &nbsp; &nbsp;
                            <button class="btn" type="reset">
                                <i class="icon-undo bigger-110"></i>
                                Reset
                            </button>
                        </div>
                        <br><br>
                    </form>
                </div>
            </div>
            <!--/.main-content-->
        </div>
        <!--/.main-container-->

        <a href="#" name="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
            <i class="icon-double-angle-up icon-only bigger-110"></i>
        </a>

        <!--basic scripts-->

        <!--[if !IE]>-->

        <script src="assets/js/notie-jquery.mini.js"></script>

        <!--<![endif]-->

        <!--[if IE]>
        <script src="assets/js/ie-jquery.mini.js"></script>
        <![endif]-->

        <!--[if !IE]>-->

        <script type="text/javascript">
            window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
        </script>

        <!--<![endif]-->

        <!--[if IE]>
        <script type="text/javascript">
            window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
        </script>
        <![endif]-->

        <script type="text/javascript">
            if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!--page specific plugin scripts-->

        <!--[if lte IE 8]>
        <script src="assets/js/excanvas.min.js"></script>
        <![endif]-->

        <script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
        <script src="assets/js/chosen.jquery.min.js"></script>
        <script src="assets/js/fuelux/fuelux.spinner.min.js"></script>
        <script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
        <script src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
        <script src="assets/js/date-time/moment.min.js"></script>
        <script src="assets/js/date-time/daterangepicker.min.js"></script>
        <script src="assets/js/bootstrap-colorpicker.min.js"></script>
        <script src="assets/js/jquery.knob.min.js"></script>
        <script src="assets/js/jquery.autosize-min.js"></script>
        <script src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
        <script src="assets/js/jquery.maskedinput.min.js"></script>
        <script src="assets/js/bootstrap-tag.min.js"></script>

        <!--ace scripts-->

        <script src="assets/js/ace-elements.min.js"></script>
        <script src="assets/js/ace.min.js"></script>

        <!--inline scripts related to this page-->

        <script type="text/javascript">
            $(function () {
                $('#id-disable-check').on('click', function () {
                    var inp = $('#form-input-readonly').get(0);
                    if (inp.hasAttribute('disabled')) {
                        inp.setAttribute('readonly', 'true');
                        inp.removeAttribute('disabled');
                        inp.value = "This text field is readonly!";
                    }
                    else {
                        inp.setAttribute('disabled', 'disabled');
                        inp.removeAttribute('readonly');
                        inp.value = "This text field is disabled!";
                    }
                });


                $(".chzn-select").chosen();

                $('[data-rel=tooltip]').tooltip({container: 'body'});
                $('[data-rel=popover]').popover({container: 'body'});

                $('textarea[class*=autosize]').autosize({append: "\n"});
                $('textarea[class*=limited]').each(function () {
                    var limit = parseInt($(this).attr('data-maxlength')) || 100;
                    $(this).inputlimiter({
                        "limit": limit,
                        remText: '%n character%s remaining...',
                        limitText: 'max allowed : %n.'
                    });
                });

                $.mask.definitions['~'] = '[+-]';
                $('.input-mask-date').mask('99/99/9999');
                $('.input-mask-phone').mask('(999) 999-9999');
                $('.input-mask-eyescript').mask('~9.99 ~9.99 999');
                $(".input-mask-product").mask("a*-999-a999", {
                    placeholder: " ", completed: function () {
                        alert("You typed the following: " + this.val());
                    }
                });


                $("#input-size-slider").css('width', '200px').slider({
                    value: 1,
                    range: "min",
                    min: 1,
                    max: 6,
                    step: 1,
                    slide: function (event, ui) {
                        var sizing = ['', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
                        var val = parseInt(ui.value);
                        $('#form-field-4').attr('class', sizing[val]).val('.' + sizing[val]);
                    }
                });

                $("#input-span-slider").slider({
                    value: 1,
                    range: "min",
                    min: 1,
                    max: 11,
                    step: 1,
                    slide: function (event, ui) {
                        var val = parseInt(ui.value);
                        $('#form-field-5').attr('class', 'span' + val).val('.span' + val).next().attr('class', 'span' + (12 - val)).val('.span' + (12 - val));
                    }
                });
                $("#slider-range").css('height', '200px').slider({
                    orientation: "vertical",
                    range: true,
                    min: 0,
                    max: 100,
                    values: [17, 67],
                    slide: function (event, ui) {
                        var val = ui.values[$(ui.handle).index() - 1] + "";

                        if (!ui.handle.firstChild) {
                            $(ui.handle).append("<div class='tooltip right in' style='display:none;left:15px;top:-8px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>");
                        }
                        $(ui.handle.firstChild).show().children().eq(1).text(val);
                    }
                }).find('a').on('blur', function () {
                    $(this.firstChild).hide();
                });

                $("#slider-range-max").slider({
                    range: "max",
                    min: 1,
                    max: 10,
                    value: 2
                });

                $("#eq > span").css({width: '90%', 'float': 'left', margin: '15px'}).each(function () {
                    // read initial values from markup and remove that
                    var value = parseInt($(this).text(), 10);
                    $(this).empty().slider({
                        value: value,
                        range: "min",
                        animate: true

                    });
                });


                $('#id-input-file-1 , #id-input-file-2').ace_file_input({
                    no_file: 'No File ...',
                    btn_choose: 'Choose',
                    btn_change: 'Change',
                    droppable: false,
                    onchange: null,
                    thumbnail: false //| true | large
                    //whitelist:'gif|png|jpg|jpeg'
                    //blacklist:'exe|php'
                    //onchange:''
                    //
                });

                $('#id-input-file-3').ace_file_input({
                    style: 'well',
                    btn_choose: 'Drop files here or click to choose',
                    btn_change: null,
                    no_icon: 'icon-cloud-upload',
                    droppable: true,
                    thumbnail: 'small'
                    //,icon_remove:null//set null, to hide remove/reset button
                    /**,before_change:function(files, dropped) {
						//Check an example below
						//or examples/file-upload.html
						return true;
					}*/
                    /**,before_remove : function() {
						return true;
					}*/
                    ,
                    preview_error: function (filename, error_code) {
                        //name of the file that failed
                        //error_code values
                        //1 = 'FILE_LOAD_FAILED',
                        //2 = 'IMAGE_LOAD_FAILED',
                        //3 = 'THUMBNAIL_FAILED'
                        //alert(error_code);
                    }

                }).on('change', function () {
                    //console.log($(this).data('ace_input_files'));
                    //console.log($(this).data('ace_input_method'));
                });


                //dynamically change allowed formats by changing before_change callback function
                $('#id-file-format').removeAttr('checked').on('change', function () {
                    var before_change
                    var btn_choose
                    var no_icon
                    if (this.checked) {
                        btn_choose = "Drop images here or click to choose";
                        no_icon = "icon-picture";
                        before_change = function (files, dropped) {
                            var allowed_files = [];
                            for (var i = 0; i < files.length; i++) {
                                var file = files[i];
                                if (typeof file === "string") {
                                    //IE8 and browsers that don't support File Object
                                    if (!(/\.(jpe?g|png|gif|bmp)$/i).test(file)) return false;
                                }
                                else {
                                    var type = $.trim(file.type);
                                    if (( type.length > 0 && !(/^image\/(jpe?g|png|gif|bmp)$/i).test(type) )
                                            || ( type.length == 0 && !(/\.(jpe?g|png|gif|bmp)$/i).test(file.name) )//for android's default browser which gives an empty string for file.type
                                    ) continue;//not an image so don't keep this file
                                }

                                allowed_files.push(file);
                            }
                            if (allowed_files.length == 0) return false;

                            return allowed_files;
                        }
                    }
                    else {
                        btn_choose = "Drop files here or click to choose";
                        no_icon = "icon-cloud-upload";
                        before_change = function (files, dropped) {
                            return files;
                        }
                    }
                    var file_input = $('#id-input-file-3');
                    file_input.ace_file_input('update_settings', {
                        'before_change': before_change,
                        'btn_choose': btn_choose,
                        'no_icon': no_icon
                    })
                    file_input.ace_file_input('reset_input');
                });


                $('#spinner1').ace_spinner({
                    value: 0,
                    min: 0,
                    max: 200,
                    step: 10,
                    btn_up_class: 'btn-info',
                    btn_down_class: 'btn-info'
                })
                        .on('change', function () {
                            //alert(this.value)
                        });
                $('#spinner2').ace_spinner({
                    value: 0,
                    min: 0,
                    max: 10000,
                    step: 100,
                    icon_up: 'icon-caret-up',
                    icon_down: 'icon-caret-down'
                });
                $('#spinner3').ace_spinner({
                    value: 0,
                    min: -100,
                    max: 100,
                    step: 10,
                    icon_up: 'icon-plus',
                    icon_down: 'icon-minus',
                    btn_up_class: 'btn-success',
                    btn_down_class: 'btn-danger'
                });


                $('.date-picker').datepicker().next().on(ace.click_event, function () {
                    $(this).prev().focus();
                });
                $('#id-date-range-picker-1').daterangepicker().prev().on(ace.click_event, function () {
                    $(this).next().focus();
                });

                $('#timepicker1').timepicker({
                    minuteStep: 1,
                    showSeconds: true,
                    showMeridian: false
                })

                $('#colorpicker1').colorpicker();
                $('#simple-colorpicker-1').ace_colorpicker();


                $(".knob").knob();


                //we could just set the data-provide="tag" of the element inside HTML, but IE8 fails!
                var tag_input = $('#form-field-tags');
                if (!( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase())))
                    tag_input.tag({placeholder: tag_input.attr('placeholder')});
                else {
                    //display a textarea for old IE, because it doesn't support this plugin or another one I tried!
                    tag_input.after('<textarea name="' + tag_input.attr('id') + '" name="' + tag_input.attr('name') + '" rows="3">' + tag_input.val() + '</textarea>').remove();
                    //$('#form-field-tags').autosize({append: "\n"});
                }


                /////////
                $('#modal-form input[type=file]').ace_file_input({
                    style: 'well',
                    btn_choose: 'Drop files here or click to choose',
                    btn_change: null,
                    no_icon: 'icon-cloud-upload',
                    droppable: true,
                    thumbnail: 'large'
                })

                //chosen plugin inside a modal will have a zero width because the select element is originally hidden
                //and its width cannot be determined.
                //so we set the width after modal is show
                $('#modal-form').on('show', function () {
                    $(this).find('.chzn-container').each(function () {
                        $(this).find('a:first-child').css('width', '200px');
                        $(this).find('.chzn-drop').css('width', '210px');
                        $(this).find('.chzn-search input').css('width', '200px');
                    });
                })
                /**
                 //or you can activate the chosen plugin after modal is shown
                 //this way select element has a width now and chosen works as expected
                 $('#modal-form').on('shown', function () {
					$(this).find('.modal-chosen').chosen();
				})
                 */

            });
        </script>
    </div>
</div>
</body>
</html>
