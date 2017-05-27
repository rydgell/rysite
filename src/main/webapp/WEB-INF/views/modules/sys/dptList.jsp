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

  <title>部门管理</title>

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
                         		部门列表
                         <span class="tools pull-right">
                             <a class="fa fa-chevron-up" href="javascript:;"></a>
                         </span>
                     </header>
                     <div style="display: none;" class="panel-body">
                        <div class="form-horizontal" id="searchTools">
                            
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
               <shiro:hasPermission name="sys:office:edit">
                   <a href="#myModal" id="add_new" data-toggle="modal" class="btn btn-success" onclick="add()">
                                                                    新增  <i class="fa fa-plus"></i>
                   </a>
               </shiro:hasPermission>
               </div>
                
           
              <!-- <div class="form-horizontal">
               <label style="font-size: 18px; " >键值:</label>
                  <select class="form-control input-sm m-bot15" >
	                  <option>Option 1</option>
	                  <option>Option 2</option>
	                  <option>Option 3</option>
  	 			  </select>
              </div>
              <div class="form-group">
              </div>
              <div class="form-group">
                  <input type="text" class="form-control input-sm m-bot15" placeholder="描述 "> 
              </div>
              <button class="btn btn-default input-sm m-bot15" type="button">查找</button> -->
           </div> 
         
          
         
         
           <!--  <table  class="table table-bordered table-striped table-condensed" id="dg">
            </table> -->
         <table id="dg" class="table table-bordered table-striped table-condensed"  data-toggle="dg"
           data-advanced-search="true"  data-mobile-responsive="true"
           data-id-table="advancedTable" >
             <thead>
             <tr>
             <th data-field="name">部门名称</th>
             <th data-field="sort" class="hidden-phone" >排序</th>
        	 <shiro:hasPermission name="sys:office:edit"><th data-formatter="operateFormatter">操作</th></shiro:hasPermission>
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
                                <label for="value" class="control-label col-lg-2">部门名称</label>
                                <div class="col-lg-10">
                                     <input class=" form-control" id="name" name="name" minlength="1" type="text" required />
                                </div>
                             </div>
                              
                             <div class="form-group">
                                <label for="sort" class="control-label col-lg-2">排序</label>
                                <div class="col-lg-10">
                                 	 <input class="form-control" id="sort" name="sort"  max="999" type="number"  required /> 
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
<script type="text/javascript">
var $table = $('#dg');


$(function() {
	openSubMenu("803df6728fb84ed3a00bfcae4efbabae"); 
	 
    $table.bootstrapTable({
        url: '${ctx}/sys/office/dptList',
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
        offset: params.offset  //页码
    };
    return temp;
}

function operateFormatter(value, row, index) {
    return [
        '<shiro:hasPermission name="sys:office:edit">',
        '<a href="#myModal" data-toggle="modal" onclick="modify('+"'"+row.id+"'"+','+"'"+row.name+"'"+','+"'"+row.sort+"'"+','+"'"+row.remarks+"'"+')">修改</a>  ',
        '<a class="delete" href="#"  onclick="del('+"'确认要删除该部门吗？'"+','+"'"+row.id+"'"+','+"'"+row.type+"'"+')">删除</a>  ',
        '</shiro:hasPermission>'
    ].join('');
}
//action="${ctx}/sys/dict/saveDict" method="post" 

function searchData() {
	$table.bootstrapTable('refresh');
}

function resetSearch() {
	$("#searchTools #type").selectpicker('val','');
    $("#searchTools #description").val("") ;
}

 
function ajaxSubmit() {
	  $("#rform").ajaxSubmit({
	     type: "post",
	     async: false,
	     url: "${ctx}/sys/office/save",
	     dataType: "json",
	     success: function(result){
	        	if (result.success==true){  
	        		$('#myModal').modal('toggle');
	        		jBox.tip("保存成功!", 'success');
	        		getDictType();
	        		$table.bootstrapTable('refresh');
	        		//window.location.reload(); 
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
}

/* 修改 */
function modify(id,name,sort,remarks){
	$('#rform')[0].reset();//重置表单
	$('#rform #id').val(id);
	$('#rform #name').val(name);
	$('#rform #sort').val(sort);
	if(remarks=="undefined"){ 
		$('#rform #remarks').val("");
	}else{
		$('#rform #remarks').val(remarks);
	}
	
}
//确认对话框
function del(mess,id,type){
	var submit = function (v, h, f) {
	    if (v == 'ok'){
	    	$.post('${ctx}/sys/office/delete',{id : id,type:type},function(result) {
	    		if (result.success) {
	    			jBox.tip("删除成功!", 'success');
	    			$table.bootstrapTable('refresh');
	    		} else {
	    			jBox.tip("删除失败!", 'error');
	    		}
	    	}, 'json');
	    }
	    else if (v == 'cancel'){
	    	
	    }
	    return true; //close
	};
	$.jBox.confirm(mess, "系统提示", submit);
}


</script>
</body>
</html>
