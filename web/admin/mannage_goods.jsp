<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/3/30
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商品管理</title>
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
<div style="margin: 20px 0;"></div>
<table id="dg" title="所有用户" style="width:1000px; height: 500px"
       data-options="rownumbers:true,singleSelect:true,pagination:true,url:'getPage.action',method:'get',
					  onSelect: function(rowIndex,rowData){
					  						$('#id').val(rowData.id);
					  						$('#id1').val(rowData.id);
					  						$('#name').val(rowData.name);
					  						$('#price').val(rowData.price);
											$('#briefIntroduction').val(rowData.briefIntroduction);
											$('#specification').val(rowData.specification);
											$('#inventory').val(rowData.inventory);
											$('#pictureSet').val(rowData.pictureSet);
											$('#categorySet').val(rowData.categorySet);
											$('#dlg').dialog('open');
					  					}">
    <thead>
    <tr>
        <th data-options="field:'id',width:50, align:'center'">商品id</th>
        <th data-options="field:'name',width:150, align:'center'">商品名</th>
        <th data-options="field:'price',width:150,align:'center'">价格</th>
        <th data-options="field:'briefIntroduction',width:150,align:'center'">简介</th>
        <th data-options="field:'specification',width:50, align:'center'">规格</th>
        <th data-options="field:'inventory',width:100,align:'center'">库存量</th>
        <th data-options="field:'pictureSet',width:100,align:'center'">图片</th>
        <th data-options="field:'categorySet',width:100,align:'center'">类别</th>
    </tr>
    </thead>
</table>

<div id="dlg" class="easyui-dialog" title="修改资料"
     style="width: 400px; height: 300px; padding: 10px"
     data-options="
				buttons: [{
					text:'确认修改',
					iconCls:'icon-ok',
					handler:function(){
						modifyAjax();
					}
				}]
			">
    <div class="easyui-panel" title=""
         style="width: 380px; padding: 10px 60px 20px 60px">
        <form action="#######" id="modifyGoods" method="get">
            <table cellpadding="5">
                <tr>
                    <td>商品id:</td>
                    <td><input id="id" name="id" type="hidden"><input
                            id="id1" name="id1" class="easyui-validatebox textbox"
                            data-options="required:true,validType:'length[3,10]'"
                            disabled="disabled"></td>
                </tr>
                <tr>
                    <td>商品名:</td>
                    <td><input id="name" name="name"
                               class="easyui-validatebox textbox"
                               data-options="required:true,validType:'length[3,10]'"></td>
                </tr>
                <tr>
                    <td>价格:</td>
                    <td><input id="price" name="price"
                               class="easyui-validatebox textbox"
                               data-options="required:true,validType:'length[0,10]'"></td>
                </tr>
                <tr>
                    <td>简介:</td>
                    <td><input id="briefIntroduction" name="briefIntroduction"
                               class="easyui-validatebox textbox" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>规格:</td>
                    <td><input id="specification" name="specification"
                               class="easyui-validatebox textbox" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>库存量:</td>
                    <td><input id="inventory" name="inventory"
                               class="easyui-validatebox textbox" data-options="required:true"></td>
                </tr>

                <tr>
                    <td>邮费:</td>
                    <td><input id="postage" name="postage"
                               class="easyui-validatebox textbox" data-options="required:true"></td>
                </tr>
            </table>
        </form>
    </div>
</div>


<script type="text/javascript">

    function modifyAjax() {
        jQuery.ajax({
            url: 'modifyGoods.action',
            type: 'post',
            dataType: 'text',
            data: {
                "id": $("#id1").val(),
                "name": $("#name").val(),
                "price": $('#price').val(),
                "briefIntroduction": $('#briefIntroduction').val(),
                "specification": $('#specification').val(),
                "inventory": $('#inventory').val()
            },
            success: function (data) {
                alert(data);
                $('#dlg').dialog('close');
                window.location.reload();
            }
        });
    }

    function modifyAjax1() {
        jQuery.ajax({
            url: '../modifyUser',
            type: 'post',
            dataType: 'text',
            data: {
                "id": $("#id3").val(),
                "name": $("#name3").val(),
                "pwd": $('#pwd3').val(),
                "phone": $('#phone3').val(),
                "email": $('#email3').val(),
                "sex": $('#sex3').val(),
                "balance": $('#balance3').val(),
                "groupId": $('#groupId3').val()
            },
            success: function (data) {
                alert(data);
                $('#dlg').dialog('close');
                window.location.reload();
            }
        });
    }


    encodeURIComponent("UTF-8");
    $(function () {
        $('#dlg').dialog('close');
        $('#dlg1').dialog('close');
        $('#dlg2').dialog('close');
        $('#dlg3').dialog('close');
        var pager = $('#dg').datagrid().datagrid('getPager'); // get the pager of datagrid
        pager.pagination({
            buttons: [{
                iconCls: 'icon-search',
                handler: function () {
                    $('#dlg2').dialog('open');
                }
            }, {
                iconCls: 'icon-add',
                handler: function () {
                    $('#dlg1').dialog('open');
                }
            }, {
                iconCls: 'icon-edit',
                handler: function () {
                }
            }]
        });
    })
    function getSelected() {
        var row = $('#dg').datagrid('getSelected');
        if (row) {

        }
    }
</script>
</body>
</html>