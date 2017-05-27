<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>角色管理</title>

  <!--dynamic table-->
<%--   <link href="${ctxStatic}/bootstrap/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${ctxStatic}/bootstrap/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="${ctxStatic}/bootstrap/js/data-tables/DT_bootstrap.css" />
 --%>
  <link href="${ctxStatic}/bootstrap/css/style.css" rel="stylesheet">
  <link href="${ctxStatic}/bootstrap/css/style-responsive.css" rel="stylesheet">
  
  <link href="${ctxStatic}/bootstrap-table/dist/bootstrap-table.min.css" rel="stylesheet">
  <link href="${ctxStatic}/jquery-jbox/2.3/Skins/GreyBlue/jbox.css" rel="stylesheet" />
  <link href="${ctxStatic}/bootstrap-select-1.12.2/dist/css/bootstrap-select.css" rel="stylesheet">
  <link href="${ctxStatic}/zTree/css/metroStyle/metroStyle.css" rel="stylesheet" >
  <link href="${ctxStatic}/bootstrap/js/iCheck/skins/square/green.css" rel="stylesheet">
 

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">
  		<%@ include file="/WEB-INF/views/include/menus.jsp"%>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >
        <!-- header section start-->
        <div class="header-section">
			<%@ include file="/WEB-INF/views/include/head.jsp"%>
        </div>
        <!-- header section end-->

        <!-- page heading start-->
       <!-- <div class="page-heading">
         	
        </div>  -->
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
        <div class="row">
             <div class="col-md-12">
                 <!--pagination start-->
                <!--  <h4> 字典列表</h4> -->
                 <section class="panel">
                     <header class="panel-heading">
                         		角色列表
                         <span class="tools pull-right">
                             <a class="fa fa-chevron-up" href="javascript:;"></a>
                         </span>
                     </header>
                     <div style="display: none;" class="panel-body">
                        <div class="form-horizontal" id="searchTools">
                           <div class="form-group">
                              <!--  <div class="col-lg-offset-2 col-lg-10">
                                   <button type="button" class="btn btn-primary" onclick="searchData()">查询</button>
                                   <button type="button" class="btn btn-default" onclick="resetSearch()">重置</button>
                               </div> -->
                           </div>
                       </div>
                     </div>
                 </section>
                 <!--pagination end-->
             </div>
        </div>
        <div class="row">
        
        <div class="col-sm-12">
        <section class="panel">
       <!--  <header class="panel-heading">
            	字典列表
        </header> -->
         
        <div class="panel-body">
        
        
                    
        <div class="adv-table">
         <div  id="toolbar"   >
               <div class="btn-group" >
               <shiro:hasPermission name="sys:dict:edit">
                   <a href="#myModal" id="add_new" data-toggle="modal" class="btn btn-success" onclick="add()">
                                                                    新增  <i class="fa fa-plus"></i>
                   </a>
               </shiro:hasPermission>
               </div>
           </div> 
         
          
         
         
           <!--  <table  class="table table-bordered table-striped table-condensed" id="dg">
            </table> -->
         <table id="dg" class="table table-bordered table-striped table-condensed"  data-toggle="dg"
           data-advanced-search="true"  data-mobile-responsive="true"
           data-id-table="advancedTable" >
             <thead>
             <tr>
             <th data-field="name">角色名称</th>
             <th data-field="enname">英文名称</th>
             <th data-field="roleType">角色类型</th>
             <th data-field="dataScope">数据范围</th>
             <th data-field="remarks">备注</th>
        	 <shiro:hasPermission name="sys:dict:edit"><th data-formatter="operateFormatter">操作</th></shiro:hasPermission>
        	 </tr>
        	</thead>	
         </table>
                         
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
             <div class="modal-dialog">
                 <div class="modal-content">
                     <div class="modal-header">
                         <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                         <h4 class="modal-title">新增</h4>
                     </div>
                     <div class="modal-body">

                         <form class="form-horizontal" id="rform" role="form" onsubmit="return ajaxSubmit();" >
                          	 <input type="hidden" id="id" name="id"  value=""  />
                          	 <input type="hidden" id="menuIds" name="menuIds"  value=""  />
                          	 
                         	 <div class="form-group">
                                <label for="value" class="control-label col-lg-2">角色名称</label>
                                <div class="col-lg-10">
                                     <input class=" form-control" id="name" name="name" minlength="1" type="text" required />
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="label" class="control-label col-lg-2">英文名称</label>
                                <div class="col-lg-10">
                                     <input class=" form-control" id="enname" name="enname"  minlength="1" type="text" required />
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="type" class="control-label col-lg-2">角色类型</label>
                                <div class="col-lg-10">
                                      <select class="form-control m-bot15" id="roleType" name="roleType">
		                                <option value="user">普通角色</option>
		                                <option value="security-role">管理员角色</option>
		                                <option value="assignment">分配角色</option>
		                              </select>
                                </div>
                             </div>
                             <div class="form-group">
                                <label  class="col-lg-2 col-sm-2 control-label">系统数据</label>
                                <div class="col-sm-9 icheck ">
		                            <div class="square-green single-row">
		                                <div class="radio ">
		                                    <input  type="radio" id="isSys1" name="sysData" value="1" >
		                                    <label>是 </label>
		                                </div>
		                                 <div class="radio ">
		                                    <input  type="radio" id="isSys0" name="sysData" value="0" >
		                                    <label>否 </label>
		                                </div>
		                            </div>
		                        </div>
                             </div>
                             <div class="form-group">
                                <label  class="control-label col-lg-2">可用</label>
		                        <div class="col-sm-9 icheck ">
		                            <div class="square-green single-row ">
		                                <div class="radio ">
		                                    <input  type="radio"  id="useable1" name="useable" value="1" >
		                                    <label>是 </label>
		                                </div>
		                                 <div class="radio ">
		                                    <input  type="radio"  id="useable0" name="useable" value="0" >
		                                    <label>否 </label>
		                                </div>
		                            </div>
		                        </div>
                             </div>
                             <div class="form-group">
                                <label for="sort" class="control-label col-lg-2">角色授权</label>
                                <div class="col-lg-10">
                                 	 <ul id="tt" class="ztree"></ul>
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="description" class="control-label col-lg-2">备注</label>
                                <div class="col-lg-10">
                                      <textarea rows="3" class="form-control" id="remarks"  name="remarks"></textarea>
                                </div>
                             </div>
                              
                            
                             <div class="form-group">
                                 <div class="col-lg-offset-2 col-lg-10">
                                     <button type="submit" class="btn btn-primary"  >保存</button>
                                 </div>
                             </div>
                         </form>

                     </div>

                 </div>
             </div>
         </div>
        </div>
        </div>
        </section>
        </div>
        </div>
        
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
       		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
        <!--footer section end-->
		

    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->

<script src="${ctxStatic}/bootstrap/js/jquery-1.10.2.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/modernizr.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/jquery.nicescroll.js"></script>
<script src="${ctxStatic}/bootstrap-table/dist/bootstrap-table.min.js"></script>
<script src="${ctxStatic}/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/scripts.js"></script>
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/validation-init.js"></script>
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
<script src="${ctxStatic}/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.js"></script>
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.form.js"></script>
<script src="${ctxStatic}/bootstrap-table/dist/extensions/toolbar/bootstrap-table-toolbar.js"></script>
<script src="${ctxStatic}/bootstrap-select-1.12.2/dist/js/bootstrap-select.js"></script>
<script src="${ctxStatic}/bootstrap-table/dist/extensions/mobile/bootstrap-table-mobile.js"></script>
<script src="${ctxStatic}/zTree/js/jquery.ztree.core.js"></script>
<script src="${ctxStatic}/zTree/js/jquery.ztree.excheck.js"></script>
<script src="${ctxStatic}/bootstrap/js/iCheck/jquery.icheck.js"></script>
<script src="${ctxStatic}/bootstrap/js/icheck-init.js"></script>
 
<script type="text/javascript">
var $table = $('#dg');
var zTreeObj;

$(function() {
	openSubMenu("7"); 
 
    $table.bootstrapTable({
        url: '${ctx}/sys/role/roleList',
        striped: true,  //表格显示条纹  
        pagination: true, //启动分页  
        toolbar: '#toolbar', 
        pageSize: 15,  //每页显示的记录数  
        pageNumber:1, //当前第几页  
        pageList: [15, 20, 30,50],  //记录数可选列表  
        search: false,  //是否启用查询  
        showColumns: false,  //显示下拉框勾选要显示的列  
        showRefresh: false,  //显示刷新按钮  
        sidePagination: "server", //表示服务端请求  
        queryParams:queryParams,
        onLoadSuccess: function(){  //加载成功时执行  
            // layer.msg("加载成功");  
        },  
        onLoadError: function(){  //加载失败时执行  
             //layer.msg("加载数据失败", {time : 1500, icon : 2});  
        } 
    });
	 
});

//配置参数
function queryParams(params) {
    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
    	limit: params.limit,   //每页显示数量
        offset: params.offset   //页码
    };
    return temp;
}

function operateFormatter(value, row, index) {
    return [
        '<shiro:hasPermission name="sys:dict:edit">',
        '<a href="#"  onclick="assign('+"'"+row.id+"'"+')">分配角色</a>  ',
        '<a href="#myModal" data-toggle="modal" onclick="modify('+"'"+row.id+"'"+','+"'"+row.name+"'"+','+"'"+row.enname+"'"+','+"'"+row.roleType+"'"+','+"'"+row.sysData+"'"+','+"'"+row.useable+"'"+','+"'"+row.remarks+"'"+')">修改</a>  ',
        '<a href="#"  onclick="del('+"'确认要删除该角色吗？'"+','+"'"+row.id+"'"+')">删除</a>  ',
        '</shiro:hasPermission>'
    ].join('');
}
//action="${ctx}/sys/dict/saveDict" method="post" 

function searchData() {
	$table.bootstrapTable('refresh');
}

function resetSearch() {
	 
}

function ajaxSubmit() {
	var ids = [], nodes = zTreeObj.getCheckedNodes(true);
	for(var i=0; i<nodes.length; i++) {
		ids.push(nodes[i].id);
	}
	$("#menuIds").val(ids);
	
	  $("#rform").ajaxSubmit({
	     type: "post",
	     async: false,
	     url: "${ctx}/sys/role/save",
	     dataType: "json",
	     success: function(result){
	        	if (result.success==true){  
	        		$('#myModal').modal('toggle');
	        		jBox.tip("保存成功!", 'success');
	        		$table.bootstrapTable('refresh');
	        		$('#rform')[0].reset();
	            } else {  
	            	jBox.tip("保存失败!", 'error');
	            }        
	     },
	     error:function(result){
	    	 jBox.tip("保存失败!", 'error');
	     }
	 });  
	return false;//false 不会刷新页面
}

function add(){
	$('#rform')[0].reset();//重置表单
	$('#rform #isSys0').iCheck('check');
	$('#rform #useable1').iCheck('check');
	getMenuPermissions();
}

/* 修改 */
function modify(id,name,enname,roleType,sysData,useable,remarks){
	var ret;
	$.ajax(
		{
			url:'${ctx}/sys/role/userRole',
			type:'POST',
			data:'id=' + id,
			async:false,
			success:function(msg)
			{
				ret = msg;
			}
		}
	)
 
	$('#rform')[0].reset();//重置表单
	$('#rform #id').val(id);
	$('#rform #name').val(name);
	$('#rform #enname').val(enname);
	$('#rform #roleType').val(roleType);
	 
	if(sysData==0){
		$('#rform #isSys0').iCheck('check');
	}else{
		$('#rform #isSys1').iCheck('check');
	}
	if(useable==0){
		$('#rform #useable').iCheck('check');
	}else{
		$('#rform #useable1').iCheck('check');
	}
	 
	
 
	if(remarks=="undefined"){ 
		$('#rform #remarks').val("");
	}else{
		$('#rform #remarks').val(remarks);
	}
	getMenuPermissions();
	var ids = ret.split(",");
	for(var i=0; i<ids.length; i++) {
		var node = zTreeObj.getNodeByParam("id", ids[i]);
		try{zTreeObj.checkNode(node, true, false);}catch(e){}
	}
	
}
//确认对话框
function del(mess,id){
	var submit = function (v, h, f) {
	    if (v == 'ok'){
	    	$.post('${ctx}/sys/role/delete',{id : id},function(result) {
	    		if (result.success) {
	    			jBox.tip("删除成功!", 'success');
	    			$table.bootstrapTable('refresh');
	    		} else {
	    			jBox.tip(result.errorMsg, 'error');
	    		}
	    	}, 'json');
	    }
	    else if (v == 'cancel'){
	    	
	    }
	    return true; //close
	};
	$.jBox.confirm(mess, "系统提示", submit);
}

function assign(id){
	var url = '${ctx}/sys/role/assign?id='+id; 
	window.location.href= url;
}
function getMenuPermissions(){
	var ret;
	$.ajax(
		{
			url:'${ctx}/sys/menu/getAllMenu',
			type:'POST',
			dataType:'json',
			data:'' ,
			async:false,
			success:function(msg)
			{
				ret = msg;
			}
		}
	)
	
	   // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
	   var setting = {
				check: {
					enable: true,
					chkStyle: "checkbox",
					chkboxType: { "Y": "p", "N": "s" }
				},
				 data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "pId",
						rootPId: 1
					}
					 
				} 
	   };
	
	   $(document).ready(function(){
		      zTreeObj = $.fn.zTree.init($("#tt"), setting, ret);
		      zTreeObj.expandAll(true);
		});
}
 
</script>
</body>
</html>
