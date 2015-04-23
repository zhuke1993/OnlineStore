<%@ page import="com.onlinestore.entity.COrder" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单管理</title>
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
</head>
<c:if test="${empty shop_lg_id}">
    <script>
        alert("你还未登陆登录，请先登录");
        window.location.href = "login.jsp";
    </script>
</c:if>
<c:if test="${empty order_list}">
    <script>
        //window.location.href = "orderDetail.action";
    </script>
</c:if>
<body>
<div class="main-container container-fluid">
    <a class="menu-toggler" id="menu-toggler" href="#">
        <span class="menu-text"></span>
    </a>

    <div class="main-content">
        <div class="page-content">
            <div class="row-fluid">
                <div class="span12">
                    <div class="row-fluid">
                        <h3 class="header smaller lighter blue">所有订单</h3>

                        <div class="table-header">
                            订单详情
                        </div>
                        <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label>
                                        <input type="checkbox"/>
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>订单id</th>
                                <th>金额</th>
                                <th class="hidden-480">
                                    <i class="icon-time bigger-110 hidden-phone"></i>
                                    下单时间
                                </th>

                                <th class="hidden-phone">
                                    商品列表
                                </th>
                                <th class="hidden-480">订单状态</th>
                                <th class="hidden-480">邮寄地址</th>
                            </tr>
                            </thead>
                            <c:forEach items="${order_list}" var="i">
                                <tr>
                                    <td class="center">
                                        <label>
                                            <input type="checkbox" id="select_id" name="select_id" value="${i.id}"/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td>
                                        <p>${i.id}</p>
                                    </td>
                                    <td>${i.price}</td>
                                    <td class="hidden-480">${i.bargainDate}</td>
                                    <td class="hidden-phone">
                                        <%
                                            List<COrder> orderList = (List<COrder>) session.getAttribute("order_list");
                                            for (int i = 0; i < orderList.size(); i++) {
                                                out.print("<a href=\"searchGoods.action?id=" + orderList.get(i).getId() + "\">" + orderList.get(i).getId() + "</a>");
                                            }
                                        %>
                                    </td>
                                    <td class="td-actions">
                                        <c:if test="${i.status eq 0}">
                                            <p>未处理</p>
                                        </c:if>
                                        <c:if test="${i.status eq 1}">
                                            <p>已处理</p>
                                        </c:if>
                                    </td>
                                    <td class="hidden-480"><a
                                            href="address.action?flag=find&address_id=${i.address.id}"> ${i.address.detailAddress}</a>
                                    </td>

                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-small btn-danger pull-left" data-dismiss="modal" id="status_btn"
                            onclick="return status_modify()">
                        <i class="icon-remove"></i>
                        状态处理
                    </button>
                    <button class="btn btn-small btn-danger pull-left" data-dismiss="modal" id="shop_delete_btn"
                            onclick="return shop_delete()">
                        <i class="icon-remove"></i>
                        删除
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function status_modify() {
            var arr = document.getElementsByName("select_id");
            var selected_id = new Array();
            for (var i = 0, j = 0; i < arr.length; i++) {
                if (arr[i].checked) {
                    selected_id[j] = arr[i].value;
                    j++;
                }
            }
            jQuery.ajax({
                        url: 'orderModify.action?order_ids_str=' + selected_id,
                        type: 'post',
                        dataType: 'text',
                        data: {
                            "flag": "status"
                        },
                        success: function (data) {
                            alert(data);
                            window.location.reload();
                        }
                    }
            );
        }
        function shop_delete() {
            var arr = document.getElementsByName("select_id");
            var selected_id = new Array();
            for (var i = 0, j = 0; i < arr.length; i++) {
                if (arr[i].checked) {
                    selected_id[j] = arr[i].value;
                    j++;
                }
            }
            jQuery.ajax({
                        url: 'orderModify.action?order_ids_str=' + selected_id,
                        type: 'post',
                        dataType: 'text',
                        data: {
                            "flag": "shop_delete"
                        },
                        success: function (data) {
                            alert(data);
                            window.location.reload();
                        }
                    }
            );
        }
    </script>

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

    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>

    <!--ace scripts-->

    <script src="assets/js/ace-elements.min.js"></script>
    <script src="assets/js/ace.min.js"></script>

    <!--inline scripts related to this page-->

    <script type="text/javascript">
        $(function () {
            var oTable1 = $('#sample-table-2').dataTable({
                "aoColumns": [
                    {"bSortable": false},
                    null, null, null, null, null,
                    {"bSortable": false}
                ]
            });


            $('table th input:checkbox').on('click', function () {
                var that = this;
                $(this).closest('table').find('tr > td:first-child input:checkbox')
                        .each(function () {
                            this.checked = that.checked;
                            $(this).closest('tr').toggleClass('selected');
                        });

            });


            $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
            function tooltip_placement(context, source) {
                var $source = $(source);
                var $parent = $source.closest('table')
                var off1 = $parent.offset();
                var w1 = $parent.width();

                var off2 = $source.offset();
                var w2 = $source.width();

                if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
                return 'left';
            }
        })
    </script>
</div>
</body>
</html>
