<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="utf-8">
<head>
  <meta charset="utf-8"/>
  <title>网上商城购物系统后台管理</title>
  <meta name="description" content="overview &amp; stats"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <!--basic styles-->

  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

  <!--[if IE 7]>
  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
  <![endif]-->

  <!--page specific plugin styles-->

  <!--fonts-->

  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>

  <!--ace styles-->

  <link rel="stylesheet" href="assets/css/ace.min.css"/>
  <link rel="stylesheet" href="assets/css/ace-responsive.min.css"/>
  <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>

  <!--[if lte IE 8]>
  <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
  <![endif]-->

  <!--inline styles related to this page-->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <link rel="stylesheet" type="text/css"
        href="jquery-easyui-1.4.1/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css"
        href="jquery-easyui-1.4.1/themes/icon.css">
  <link rel="stylesheet" type="text/css"
        href="jquery-easyui-1.4.1/demo/demo.css">
  <script type="text/javascript"
          src="jquery-easyui-1.4.1/jquery.min.js"></script>
  <script type="text/javascript"
          src="jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<div class="navbar">
  <c:if test="${empty shop_lg_id}">
    <script>
      alert("你还未登陆登录，请先登录");
      window.location.href = "login.jsp";
    </script>
  </c:if>
  <div class="navbar-inner">
    <div class="container-fluid">
      <a href="#" class="brand">
        <small>
          <i class="icon-leaf"></i>
          网上商城后台管理系统
        </small>
      </a><!--/.brand-->

      <ul class="nav ace-nav pull-right">
        <li class="light-blue">
          <a data-toggle="dropdown" href="#" class="dropdown-toggle">
            <img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo"/>
								<span class="user-info">
									<small>Welcome,</small>
								</span>

            <i class="icon-caret-down"></i>
          </a>

          <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
            <li>
              <a href="account.jsp">
                <i class="icon-cog"></i>
                设置
              </a>
            </li>
            <li class="divider"></li>

            <li>
              <a href="logout.jsp">
                <i class="icon-off"></i>
                退出登陆
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
  <a class="menu-toggler" id="menu-toggler" href="#">
    <span class="menu-text"></span>
  </a>

  <div class="sidebar" id="sidebar">
    <!--#sidebar-shortcuts-->
    <ul class="nav nav-list">
      <li class="active">
        <a href="index.jsp">
          <i class="icon-dashboard"></i>
          <span class="menu-text"> 管理商品 </span>
        </a>
      </li>
      <li>
        <a href="add_goods.jsp">
          <i class="icon-text-width"></i>
          <span class="menu-text"> 增加商品 </span>
        </a>
      </li>

      <li>
        <a href="../orderDetail.action" class="dropdown-toggle">
          <i class="icon-desktop"></i>
          <span class="menu-text"> 订单处理 </span>
          <b class="arrow icon-angle-down"></b>
        </a>

      </li>
    </ul>
    <!--/.nav-list-->

    <div class="sidebar-collapse" id="sidebar-collapse">
      <i class="icon-double-angle-left"></i>
    </div>
  </div>
  <div class="main-content">
    <div class="breadcrumbs" id="breadcrumbs">
      <ul class="breadcrumb">
        <li class="active">订单处理</li>
      </ul>
      <!--.breadcrumb-->

    </div>
    <div class="page-content">
      <div class="row-fluid">
        <div class="span12">
          <!--PAGE CONTENT BEGINS-->
          <iframe src="orderDetails.jsp" frameborder="0" height="800px" width="100%"></iframe>
          <!--PAGE CONTENT ENDS-->
        </div>
        <!--/.span-->
      </div>
      <!--/.row-fluid-->
    </div>
    <!--/.page-content-->

    <div class="ace-settings-container" id="ace-settings-container">
      <div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
        <i class="icon-cog bigger-150"></i>
      </div>

      <div class="ace-settings-box" id="ace-settings-box">
        <div>
          <div class="pull-left">
            <select id="skin-colorpicker" class="hide" style="display: none;">
              <option data-class="default" value="#438EB9">#438EB9
              </option>
              <option data-class="skin-1" value="#222A2D">#222A2D
              </option>
              <option data-class="skin-2" value="#C6487E">#C6487E
              </option>
              <option data-class="skin-3" value="#D0D0D0">#D0D0D0
              </option>
            </select>

            <div class="dropdown dropdown-colorpicker"><a data-toggle="dropdown" class="dropdown-toggle"
                                                          href="#"><span class="btn-colorpicker"
                                                                         style="background-color:#438EB9"></span></a>
              <ul class="dropdown-menu dropdown-caret">
                <li><a class="colorpick-btn selected" href="#" style="background-color:#438EB9;"
                       data-color="#438EB9"></a></li>
                <li><a class="colorpick-btn" href="#" style="background-color:#222A2D;"
                       data-color="#222A2D"></a></li>
                <li><a class="colorpick-btn" href="#" style="background-color:#C6487E;"
                       data-color="#C6487E"></a></li>
                <li><a class="colorpick-btn" href="#" style="background-color:#D0D0D0;"
                       data-color="#D0D0D0"></a></li>
              </ul>
            </div>
          </div>
          <span>&nbsp; Choose Skin</span>
        </div>

        <div>
          <input type="checkbox" class="ace-checkbox-2" id="ace-settings-header">
          <label class="lbl" for="ace-settings-header"> Fixed Header</label>
        </div>

        <div>
          <input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar">
          <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
        </div>

        <div>
          <input type="checkbox" class="ace-checkbox-2" id="ace-settings-breadcrumbs">
          <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
        </div>

        <div>
          <input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl">
          <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
        </div>
      </div>
    </div>
    <!--/#ace-settings-container-->
  </div>

  <!--/.main-content-->
</div>
<!--/.main-container-->

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
  <i class="icon-double-angle-up icon-only bigger-110"></i>
</a>

<!--basic scripts-->

<!--[if !IE]>-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!--<![endif]-->

<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
<script src="assets/js/jquery.slimscroll.min.js"></script>
<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="assets/js/jquery.sparkline.min.js"></script>
<script src="assets/js/flot/jquery.flot.min.js"></script>
<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="assets/js/flot/jquery.flot.resize.min.js"></script>

<!--ace scripts-->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!--inline scripts related to this page-->

<script type="text/javascript">
  $(function () {
    $('.easy-pie-chart.percentage').each(function () {
      var $box = $(this).closest('.infobox');
      var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
      var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
      var size = parseInt($(this).data('size')) || 50;
      $(this).easyPieChart({
        barColor: barColor,
        trackColor: trackColor,
        scaleColor: false,
        lineCap: 'butt',
        lineWidth: parseInt(size / 10),
        animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
        size: size
      });
    })

    $('.sparkline').each(function () {
      var $box = $(this).closest('.infobox');
      var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
      $(this).sparkline('html', {
        tagValuesAttribute: 'data-values',
        type: 'bar',
        barColor: barColor,
        chartRangeMin: $(this).data('min') || 0
      });
    });


    var placeholder = $('#piechart-placeholder').css({'width': '90%', 'min-height': '150px'});
    var data = [
      {label: "social networks", data: 38.7, color: "#68BC31"},
      {label: "search engines", data: 24.5, color: "#2091CF"},
      {label: "ad campaings", data: 8.2, color: "#AF4E96"},
      {label: "direct traffic", data: 18.6, color: "#DA5430"},
      {label: "other", data: 10, color: "#FEE074"}
    ]

    function drawPieChart(placeholder, data, position) {
      $.plot(placeholder, data, {
        series: {
          pie: {
            show: true,
            tilt: 0.8,
            highlight: {
              opacity: 0.25
            },
            stroke: {
              color: '#fff',
              width: 2
            },
            startAngle: 2
          }
        },
        legend: {
          show: true,
          position: position || "ne",
          labelBoxBorderColor: null,
          margin: [-30, 15]
        }
        ,
        grid: {
          hoverable: true,
          clickable: true
        }
      })
    }

    drawPieChart(placeholder, data);

    /**
     we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
     so that's not needed actually.
     */
    placeholder.data('chart', data);
    placeholder.data('draw', drawPieChart);


    var $tooltip = $("<div class='tooltip top in hide'><div class='tooltip-inner'></div></div>").appendTo('body');
    var previousPoint = null;

    placeholder.on('plothover', function (event, pos, item) {
      if (item) {
        if (previousPoint != item.seriesIndex) {
          previousPoint = item.seriesIndex;
          var tip = item.series['label'] + " : " + item.series['percent'] + '%';
          $tooltip.show().children(0).text(tip);
        }
        $tooltip.css({top: pos.pageY + 10, left: pos.pageX + 10});
      } else {
        $tooltip.hide();
        previousPoint = null;
      }

    });


    var d1 = [];
    for (var i = 0; i < Math.PI * 2; i += 0.5) {
      d1.push([i, Math.sin(i)]);
    }

    var d2 = [];
    for (var i = 0; i < Math.PI * 2; i += 0.5) {
      d2.push([i, Math.cos(i)]);
    }

    var d3 = [];
    for (var i = 0; i < Math.PI * 2; i += 0.2) {
      d3.push([i, Math.tan(i)]);
    }


    var sales_charts = $('#sales-charts').css({'width': '100%', 'height': '220px'});
    $.plot("#sales-charts", [
      {label: "Domains", data: d1},
      {label: "Hosting", data: d2},
      {label: "Services", data: d3}
    ], {
      hoverable: true,
      shadowSize: 0,
      series: {
        lines: {show: true},
        points: {show: true}
      },
      xaxis: {
        tickLength: 0
      },
      yaxis: {
        ticks: 10,
        min: -2,
        max: 2,
        tickDecimals: 3
      },
      grid: {
        backgroundColor: {colors: ["#fff", "#fff"]},
        borderWidth: 1,
        borderColor: '#555'
      }
    });


    $('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
    function tooltip_placement(context, source) {
      var $source = $(source);
      var $parent = $source.closest('.tab-content')
      var off1 = $parent.offset();
      var w1 = $parent.width();

      var off2 = $source.offset();
      var w2 = $source.width();

      if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
      return 'left';
    }


    $('.dialogs,.comments').slimScroll({
      height: '300px'
    });


    //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
    //so disable dragging when clicking on label
    var agent = navigator.userAgent.toLowerCase();
    if ("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
      $('#tasks').on('touchstart', function (e) {
        var li = $(e.target).closest('#tasks li');
        if (li.length == 0)return;
        var label = li.find('label.inline').get(0);
        if (label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation();
      });

    $('#tasks').sortable({
              opacity: 0.8,
              revert: true,
              forceHelperSize: true,
              placeholder: 'draggable-placeholder',
              forcePlaceholderSize: true,
              tolerance: 'pointer',
              stop: function (event, ui) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
                $(ui.item).css('z-index', 'auto');
              }
            }
    );
    $('#tasks').disableSelection();
    $('#tasks input:checkbox').removeAttr('checked').on('click', function () {
      if (this.checked) $(this).closest('li').addClass('selected');
      else $(this).closest('li').removeClass('selected');
    });


  })
</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/24
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
