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

  <title>用户管理</title>

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
  <link href="${ctxStatic}/bootstrap/js/iCheck/skins/minimal/green.css" rel="stylesheet">

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
                         		用户列表
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
             <th data-field="loginName">登录名称</th>
             <th data-field="name">姓名</th>
             <th data-field="email">email</th>
             <th data-field="phone">电话</th>
             <th data-field="office.name">所属部门</th>
             <th data-field="userType" data-formatter="formatUserType">用户类型</th>
             <th data-field="loginFlag" data-formatter="formatLoginFlag">状态</th> 
             <th data-field="createDate" data-formatter="formatDateTimebox">创建时间</th>
             <th data-field="loginDate" data-formatter="formatDateTimebox">最后登录</th>
        	 <shiro:hasPermission name="sys:user:edit"><th data-formatter="operateFormatter">操作</th></shiro:hasPermission>
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
                          	  <div class="form-group">
                                <label for="value" class="control-label col-lg-2">登录名</label>
                                <div class="col-lg-7">
                                     <input class=" form-control" id="loginName" name="loginName" minlength="1" type="text" required />
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="value" class="control-label col-lg-2">密码</label>
                                <div class="col-lg-7">
                                     <input class=" form-control" id="newPassword" name="newPassword" minlength="1" type="password" required />
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="value" class="control-label col-lg-2">确认密码</label>
                                <div class="col-lg-7">
                                     <input class=" form-control" id="confirmNewPassword" name="confirmNewPassword" minlength="1" type="password" required />
                                </div>
                             </div>
                         	 <div class="form-group">
                                <label for="value" class="control-label col-lg-2">姓名</label>
                                <div class="col-lg-7">
                                     <input class=" form-control" id="name" name="name" minlength="1" type="text" required />
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="label" class="control-label col-lg-2">工号</label>
                                <div class="col-lg-7">
                                     <input class=" form-control" id="no" name="no"  minlength="1" type="text" required />
                                </div>
                             </div>
                              <div class="form-group">
                                <label for="label" class="control-label col-lg-2">邮箱</label>
                                <div class="col-lg-7">
                                     <input class=" form-control" id="email" name="email"  minlength="1" type="text" required />
                                </div>
                             </div>
                              <div class="form-group">
                                <label for="label" class="control-label col-lg-2">电话</label>
                                <div class="col-lg-7">
                                     <input class=" form-control" id="phone" name="phone"  minlength="1" type="text" required />
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="label" class="control-label col-lg-2">手机</label>
                                <div class="col-lg-7">
                                     <input class=" form-control" id="mobile" name="mobile"  minlength="1" type="text" required />
                                </div>
                             </div>
                            <div class="form-group">
                                <label for="value" class="control-label col-lg-2">所属部门</label>
                                <div class="col-lg-7">
                                  <select id="office" name="office.id" class="form-control selectpicker show-tick dropup " data-live-search="false" data-size="5"  title="请选择" >
				  	 			  </select>
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="type" class="control-label col-lg-2">用户类型</label>
                                <div class="col-lg-7">
                                      <select class="form-control selectpicker show-tick dropdown " id="userType" name="userType">
		                                <option value="0">普通用户</option>
										<option value="2">部门经理</option>
		                                <option value="1">系统管理员</option>
		                              </select>
                                </div>
                             </div>
                             <div class="form-group">
                                <label  class="col-lg-2 col-sm-2 control-label">状态</label>
                                <div class="col-sm-7 icheck ">
		                            <div class="square-green single-row">
		                                <div class="radio ">
		                                    <input  type="radio" id="loginFlag1" name="loginFlag" value="1" >
		                                    <label>可用 </label>
		                                </div>
		                                 <div class="radio ">
		                                    <input  type="radio" id="loginFlag0" name="loginFlag" value="0" >
		                                    <label>禁用 </label>
		                                </div>
		                            </div>
		                        </div>
                             </div>
                              
                             <div class="form-group">
                                <label  class="control-label col-lg-2">用户角色</label>
                                <!-- <div class="col-lg-8 icheck">
                                <div class="minimal-green " id="roleIdListSpan">
	                                
                            	</div>
                                </div> -->
                                <div class="col-lg-8 icheck minimal-green" id="roleIdListSpan">
                                 
                                </div>
                             </div>
                             <div class="form-group">
                                <label for="description" class="control-label col-lg-2">备注</label>
                                <div class="col-lg-7">
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
	openSubMenu("20"); 
	
    $table.bootstrapTable({
        url: '${ctx}/sys/user/userList',
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

function searchData() {
	$table.bootstrapTable('refresh');
}

function resetSearch() {
	 
}

function ajaxSubmit() {
	  	
	  $("#rform").ajaxSubmit({
	     type: "post",
	     async: false,
	     url: "${ctx}/sys/user/save",
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
	selectDpt();
	selectRole();
	$('#rform #isSys0').iCheck('check');
	$('#rform #useable1').iCheck('check');
	$('#rform #confirmNewPassword').attr("required",true);
	$('#rform #newPassword').attr("required",true);
	$('#rform #confirmNewPassword').attr('placeholder','');
	$('#rform #newPassword').attr('placeholder','');
	
}

function operateFormatter(value, row, index) {
    return [
        '<shiro:hasPermission name="sys:dict:edit">',
        '<a href="#myModal" data-toggle="modal" onclick="modify('+"'"+row.id+"'"+','+"'"+row.loginName+"'"+','+"'"+row.name+"'"+','
        		+"'"+row.no+"'"+','+"'"+row.email+"'"+','+"'"+row.phone+"'"+','+"'"+row.mobile+"'"+','+"'"+row.office.id+"'"+','
        		+"'"+row.userType+"'"+','+"'"+row.loginFlag+"'"+','+"'"+row.roleIdList+"'"+','+"'"+row.remarks+"'"+')">修改</a>  ',
        '<a href="#"  onclick="del('+"'确认要删除该用户吗？'"+','+"'"+row.id+"'"+')">删除</a>  ',
        '</shiro:hasPermission>'
    ].join(''); 
}

/* 修改 */
function modify(id,loginName,name,no,email,phone,
		mobile,officeId,userType,loginFlag,remarks){
	$('#rform')[0].reset();//重置表单
	$('#rform #id').val(id);
	$('#rform #loginName').val(loginName);
	$('#rform #name').val(name);
	$('#rform #no').val(no);
	if(email!="undefined"){
		$('#rform #email').val(email);
	}
	if(phone!="undefined"){
		$('#rform #phone').val(phone);
	}
	if(mobile!="undefined"){
		$('#rform #mobile').val(mobile);
	}
	
	selectDpt();
	 
	if(loginFlag==0){
		$('#rform #loginFlag0').iCheck('check');
	}else{
		$('#rform #loginFlag1').iCheck('check');
	}
	 
	if(remarks=="undefined"){ 
		$('#rform #remarks').val("");
	}else{
		$('#rform #remarks').val(remarks);
	}
 
	selectRole(id);
	$('#rform #office').selectpicker('val',officeId);
	$('#rform #userType').selectpicker('val',userType);
	$('#rform #confirmNewPassword').attr("required",false);
	$('#rform #newPassword').attr("required",false);
	$('#rform #confirmNewPassword').attr('placeholder','若不修改密码，请留空');
	$('#rform #newPassword').attr('placeholder','若不修改密码，请留空');
	
}
//确认对话框
function del(mess,id){
	var submit = function (v, h, f) {
	    if (v == 'ok'){
	    	$.post('${ctx}/sys/user/delete',{id : id},function(result) {
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

function selectDpt(){
	$('#rform #office').empty();
	var defaule = '<option class="bs-title-option" value="">请选择...</option>';
	$('#rform #office').append(defaule);
	$.ajax({
            url: "${ctx}/sys/office/selectDpt",
            dataType: "json",
			async : false, 
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
 				 var op = '<option value="'+data[i].id+'">'+data[i].name+'</option>';
                    $('#rform #office').append(op);
                }
				 $("#rform #office").selectpicker('refresh');
            }
        }); 
}

function selectRole(id){
	$('#rform #roleIdListSpan').empty();
	var ids = "";
	if(id!=""&&typeof(id)!="undefined"){
		$.ajax({
            url: "${ctx}/sys/user/getUserRoleIds?id="+id,
            dataType: "json",
			async : false, 
            success: function (data) {
				ids = data;
            }
        }); 
		ids = ","+ids+",";
	}
	
	$.ajax({
            url: "${ctx}/sys/role/selectRole",
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
					var op ='<div class="checkbox ">';
					if(ids.indexOf(","+data[i].id+",")!=-1){
						 op += '<input type="checkbox" name="roleIdList" value="'+data[i].id+'" checked>';
					}else{
						 op += '<input type="checkbox" name="roleIdList" value="'+data[i].id+'">';
					}
 				    op +=' <label>'+data[i].name+' </label></div>';
                    $('#rform #roleIdListSpan').append(op);
					
                }
					 
            }
        }); 
}

function formatUserType(value, row, index) {
	 if(value==1){
		 return "系统管理员";
	 }else if(value==2){
		 return "部门经理";
	 }else{
		 return "普通用户";
	 }
}

function formatLoginFlag(value, row, index) {
	 if(value==1){
		 return "可用";
	 }else{
		 return "<font color='red'>禁用</font>";
	 }
}
</script>
</body>
</html>
