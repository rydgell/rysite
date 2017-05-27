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

  <title>菜单管理</title>

  <!--dynamic table-->
<%--   <link href="${ctxStatic}/bootstrap/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${ctxStatic}/bootstrap/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="${ctxStatic}/bootstrap/js/data-tables/DT_bootstrap.css" />
 --%>
  <link href="${ctxStatic}/bootstrap/css/style.css" rel="stylesheet">
  <link href="${ctxStatic}/bootstrap/css/style-responsive.css" rel="stylesheet">
  
  <link href="${ctxStatic}/jquery-jbox/2.3/Skins/GreyBlue/jbox.css" rel="stylesheet" />
  <link href="${ctxStatic}/bootstrap-select-1.12.2/dist/css/bootstrap-select.css" rel="stylesheet">
  <link href="${ctxStatic}/zTree/css/metroStyle/metroStyle.css" rel="stylesheet" >
  <link href="${ctxStatic}/bootstrap/js/iCheck/skins/square/green.css" rel="stylesheet">
  <link href="${ctxStatic}/treeTable/themes/vsStyle/treeTable.min.css" rel="stylesheet" />
  <link href="${ctxStatic}/zTree/css/metroStyle/metroStyle.css" rel="stylesheet" >

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
                         		菜单列表
                     </header>
                      
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
         <div  id="toolbar"  style="margin-bottom: 10px" >
               <div class="btn-group" >
               <shiro:hasPermission name="sys:dict:edit">
                   <a href="#myModal" id="add_new" data-toggle="modal" class="btn btn-success" onclick="add()">
                                                                    新增  <i class="fa fa-plus"></i>
                   </a>
               </shiro:hasPermission>
               </div>
           </div> 
         
          <table id="dg" class="table table-bordered table-striped table-condensed">
			<thead><tr>
			<th>名称</th>
			<th>链接</th>
			<th>排序</th>
			<th>可见</th>
			<th>权限标识</th>
			<shiro:hasPermission name="sys:menu:edit"><th>操作</th></shiro:hasPermission></tr>
			</thead>
			<tbody><c:forEach items="${list}" var="menu">
				<tr id="${menu.id}" pId="${menu.parent.id ne '1'?menu.parent.id:'0'}">
					<td nowrap><i class="icon-${not empty menu.icon?menu.icon:' hide'}"></i>${menu.name}</td>
					<td title="${menu.href}">${fns:abbr(menu.href,30)}</td>
					<td>${menu.sort}</td>
					<td>${menu.isShow eq '1'?'显示':'隐藏'}</td>
					<td title="${menu.permission}">${fns:abbr(menu.permission,30)}</td>
					<shiro:hasPermission name="sys:menu:edit"><td nowrap>
						<a href="#myModal" data-toggle="modal" onclick="modify('${menu.id}','${menu.parent.id}','${menu.parent.name}','${menu.name}','${menu.href}','${menu.sort}','${menu.isShow}','${menu.permission}','${menu.remarks}')">修改</a>
						<a href="#" onclick="del('确认要删除该字典吗？','${menu.id}')">删除</a>
						<a href="#myModal" data-toggle="modal" onclick="add('${menu.id}','${menu.name}')">添加下级菜单</a> 
					</td></shiro:hasPermission>
				</tr>
			</c:forEach></tbody>
		</table>
          
         
           <!--  <table  class="table table-bordered table-striped table-condensed" id="dg">
            </table> -->
        <%--  <table id="dg" class="table table-bordered table-striped table-condensed"  data-toggle="dg"
           data-advanced-search="true"  data-mobile-responsive="true"  data-detail-view="true"
               data-detail-formatter="detailFormatter"
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
         </table> --%>
                         
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
                          	 <input type="hidden" id="parentId" name="parent.id"  value="1"  />
                         	 <div class="form-group">
                                <label class="control-label col-lg-2">上级菜单</label>
                                <div class="col-lg-9">
                                  <!-- <select id="parentId" name="parent.id" class="form-control selectpicker show-tick dropdown "  data-size="1"  data-live-search="false"  readonly  title="请选择" >
				  	 			  </select> -->
				  	 			   <div class="content_wrap input-group m-bot15 ">
                                	<!-- <input type="text" class="form-control"> -->
                                	<input id="parent" name="parent" type="text" readonly value="" class="form-control"  required/>
                                    
                                     
                                <div class="input-group-btn" >
                                    <button id="selectMenu" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">选择 <span class="caret"></span></button>
                                    <ul id="treeDemo" class="dropdown-menu pull-right ztree " style="max-height: 300px;  overflow-x: hidden; overflow-y: auto;"></ul>
                                </div>
                            		</div>
                                	</div>
                             </div>
                             <div class="form-group">
                                <label for="label" class="control-label col-lg-2">名称</label>
                                <div class="col-lg-9">
                                     <input class=" form-control" id="name" name="name"  minlength="1" type="text" required />
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="label" class="control-label col-lg-2">链接</label>
                                <div class="col-lg-9">
                                     <input class=" form-control" id="href" name="href"  minlength="1" type="text"  placeholder="点击菜单跳转的页面 "/>
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="label" class="control-label col-lg-2">排序</label>
                                <div class="col-lg-9">
                                     <input class=" form-control" id="sort" name="sort"  minlength="1" type="text" required />
                                </div>
                             </div>
                             <div class="form-group">
                                <label  class="col-lg-2 col-sm-2 control-label">可见</label>
                                <div class="col-sm-9 icheck ">
		                            <div class="square-green single-row">
		                                <div class="radio ">
		                                    <input  type="radio" id="isShow1" name="isShow" value="1" >
		                                    <label>显示 </label>
		                                </div>
		                                 <div class="radio ">
		                                    <input  type="radio" id="isShow0" name="isShow" value="0" >
		                                    <label>隐藏 </label>
		                                </div>
		                            </div>
		                        </div>
                             </div>
                             <div class="form-group">
                                <label for="label" class="control-label col-lg-2">权限标识</label>
                                <div class="col-lg-9">
                                     <input class=" form-control" id="permission" name="permission"  minlength="1" type="text"  placeholder="权限标识，如：@RequiresPermissions('权限标识') "/>
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="description" class="control-label col-lg-2">备注</label>
                                <div class="col-lg-9">
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
<script src="${ctxStatic}/bootstrap/js/scripts.js"></script>
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/validation-init.js"></script>
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
<script src="${ctxStatic}/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.js"></script>
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.form.js"></script>
<script src="${ctxStatic}/bootstrap-select-1.12.2/dist/js/bootstrap-select.js"></script>
<script src="${ctxStatic}/bootstrap/js/iCheck/jquery.icheck.js"></script>
<script src="${ctxStatic}/bootstrap/js/icheck-init.js"></script>
<script src="${ctxStatic}/treeTable/jquery.treeTable.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/zTree/js/jquery.ztree.core.js"></script>
<script src="${ctxStatic}/zTree/js/jquery.ztree.excheck.js"></script>

<script type="text/javascript">
var $table = $('#dg');
var zTreeObj;

$(function() {
	openSubMenu("4"); 
 
	$('#dg').treeTable({expandLevel : 3}).show(); 
	
	
	//getDictType();    
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
	 
}

function resetSearch() {
	 
}

function ajaxSubmit() {
	
	  $("#rform").ajaxSubmit({
	     type: "post",
	     async: false,
	     url: "${ctx}/sys/menu/save",
	     dataType: "json",
	     success: function(result){
	        	if (result.success==true){  
	        		$('#myModal').modal('toggle');
	        		jBox.tip("保存成功!", 'success');
	        		setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
	    				window.location.reload();//页面刷新
	    			},500);
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
var setting = {
		check: {
			enable: false 
		},
		 
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick: onClick
		}
	};

	 
function add(parentId,parentName){
	$('#rform')[0].reset();//重置表单
	
	$('#rform #isShow1').iCheck('check');
	if(typeof(parentId)=="undefined"){ 
		$('#rform #selectMenu').prop('disabled', false);
		selectParentMenu();
	}else{
		initParent(parentId, parentName);
		$('#rform #selectMenu').prop('disabled', true);
	}
	
 }

/* 修改 */
function modify(id,parentId,parentName,name,href,sort,isShow,permission,remarks){
	$('#rform #selectMenu').prop('disabled', false);
	selectParentMenu();
	$('#rform')[0].reset();//重置表单
	$('#rform #id').val(id);
	$('#rform #name').val(name);
	initParent(parentId,parentName);
	
	$('#rform #href').val(href);
	$('#rform #sort').val(sort);
	$('#rform #permission').val(permission);
	if(isShow==0){
		$('#rform #isShow0').iCheck('check');
	}else{
		$('#rform #isShow1').iCheck('check');
	}
	if(remarks=="undefined"){ 
		$('#rform #remarks').val("");
	}else{
		$('#rform #remarks').val(remarks);
	}
	
}
//确认对话框
function del(mess,id){
	var submit = function (v, h, f) {
	    if (v == 'ok'){
	    	$.post('${ctx}/sys/menu/delete',{id : id},function(result) {
	    		if (result.success) {
	    			jBox.tip("删除成功!", 'success');
	    			setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
	    				window.location.reload();//页面刷新
	    			},500);
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

function selectParentMenu(){
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
	
	$.fn.zTree.init($("#treeDemo"), setting, ret);
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	treeObj.expandAll(true);
}


function initParent(id,name){
	$("#parent").val(name);;
	$("#parentId").val(id);
	/* var p = '<option value="'+id+'">'+name+'</option>';
	$('#rform #parent').append(p);
	$('#rform #parent').prop('readonly', true);
	$("#rform #parent").selectpicker('refresh'); */
}

function onClick(e, treeId, treeNode) {
	$("#parent").val(treeNode.name);;
	$("#parentId").val(treeNode.id);
}



function showMenu() {
	var cityObj = $("#parent");
	var cityOffset = $("#parent").offset();

	$("#rform").bind("mousedown", onBodyDown);
}
function hideMenu() {
	/* $("#menuContent").fadeOut("fast"); */
	$("#rform").unbind("mousedown", onBodyDown);
}
 
</script>
</body>
</html>
