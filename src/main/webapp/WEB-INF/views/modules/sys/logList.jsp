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

  <title>日志查询</title>

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
  <link href="${ctxStatic}/bootstrap/js/bootstrap-datepicker/css/datepicker-custom.css" rel="stylesheet"/>
 
  <link href="${ctxStatic}/bootstrap/js/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet"/>
  <link href="${ctxStatic}/bootstrap/js/bootstrap-datetimepicker/css/datetimepicker-custom.css" rel="stylesheet"/>
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
                         		日志查询
                         <span class="tools pull-right">
                             <a class="fa fa-chevron-up" href="javascript:;"></a>
                         </span>
                     </header>
                     <div style="display: none;" class="panel-body">
                        <div class="form-horizontal" id="searchTools">
                           <div class="form-group">
                               <label for="type" class="col-lg-2 col-sm-2 control-label">类型</label>
                               <div class="col-lg-2">
                                   <select id="type" name="type" class="form-control selectpicker show-tick dropup "  data-size="5"  data-live-search="false"   title="请选择" >
					               	<option class="bs-title-option" value="">请选择...</option> 
					               	<option value="1">接入日志</option>
					               	<option value="2">错误日志</option>
				  	 			  </select>
                               </div>
                           </div>
                           <div class="form-group">
                               <label  class="col-lg-2 col-sm-2 control-label">操作菜单</label>
                               <div class="col-lg-2">
                                   <input type="text" id="title" name="title" class="form-control input-sm m-bot3" placeholder="操作菜单 "> 
                               </div>
                           </div>
                           <div class="form-group">
                               <label  class="col-lg-2 col-sm-2 control-label">操作用户</label>
                               <div class="col-lg-2">
                                   <input type="text" id="userName" name="userName" class="form-control input-sm m-bot3" placeholder="操作用户 "> 
                               </div>
                           </div>
                           <div class="form-group">
                               <label  class="col-lg-2 col-sm-2 control-label">URI</label>
                               <div class="col-lg-2">
                                   <input type="text" id="requestUri" name="requestUri" class="form-control input-sm m-bot3" placeholder="访问路径 "> 
                               </div>
                           </div>
                          <div class="form-group">
                               <label  class="col-lg-2 col-sm-2 control-label">日期范围</label>
                               <div class="col-lg-3">
                               <div class="input-group input-large custom-date-range" data-date-format="yyyy-mm-dd hh:mm">
                                    <input id="beginDate" name="beginDate" data-format="yyyy-mm-dd hh:mm" type="text" class="form-control dpd1" readonly value="" size="16">
                                    <span class="input-group-addon">To</span>
                                    <input id="endDate" name="endDate" data-format="yyyy-mm-dd hh:mm" type="text" class="form-control dpd2" readonly value="" size="16">
                               </div>
                               </div>
                           </div>
                           <div class="form-group">
                               <div class="col-lg-offset-2 col-lg-10">
                                   <button type="button" class="btn btn-primary" onclick="searchData()">查询</button>
                                   <button type="button" class="btn btn-default" onclick="resetSearch()">重置</button>
                               </div>
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
         
        <div class="panel-body">
                    
        <div class="adv-table">
         <div  id="toolbar"   >
           </div> 
         
           <!--  <table  class="table table-bordered table-striped table-condensed" id="dg">
            </table> -->
         <table id="dg" class="table table-bordered table-striped table-condensed"  data-toggle="dg"
           data-advanced-search="true"  data-mobile-responsive="true"
           data-id-table="advancedTable" >
             <thead>
             <tr>
             <th data-field="title">操作菜单</th>
             <th data-field="createBy.name">操作用户</th>
             <th data-field="office.name">所在部门</th>
             <th data-field="requestUri">URI</th>
             <th data-field="type" data-formatter="formatType">日志类型</th>
             <th data-field="remoteAddr" >操作者IP</th>
             <th data-field="createDate" data-formatter="formatDateTimebox" >操作时间</th>
        	 </tr>
        	</thead>	
         </table>
                         
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
<script src="${ctxStatic}/bootstrap/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="${ctxStatic}/bootstrap/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
 
<script type="text/javascript">
var $table = $('#dg');


$(function() {
	openSubMenu("68"); 
	
	$('#beginDate').datetimepicker();
	$('#endDate').datetimepicker();
	$("#searchTools #beginDate").val(formatDatebox(new Date()-7*24*60*60*1000)+" 00:00");
	$("#searchTools #endDate").val(formatDatebox(new Date())+" 23:59");
	
    $table.bootstrapTable({
        url: '${ctx}/sys/log/logList',
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
        offset: params.offset,  //页码
        type: $("#searchTools #type").val(),
        title: $("#searchTools #title").val(),
        "createBy.name":$("#searchTools #userName").val(),
        requestUri:$("#searchTools #requestUri").val(),
        beginDate:$("#searchTools #beginDate").val(),
        endDate:$("#searchTools #endDate").val()
    };
    return temp;
}

function formatType(value, row, index) {
	 if(value==1){
		 return "接入日志";
	 }else{
		 return "错误日志";
	 }
}
function searchData() {
	$table.bootstrapTable('refresh');
}

function resetSearch() {
	$("#searchTools #type").selectpicker('val','');
    $("#searchTools #title").val("") ;
    $("#searchTools #userName").val("") ;
    $("#searchTools #requestUri").val("") ;
    $("#searchTools #beginDate").val(formatDatebox(new Date()-7*24*60*60*1000)+" 00:00");
	$("#searchTools #endDate").val(formatDatebox(new Date())+" 23:59");
}

 


</script>
</body>
</html>
