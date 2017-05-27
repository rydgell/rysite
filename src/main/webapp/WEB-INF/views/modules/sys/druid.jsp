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

  <title>连接池监控</title>

  <!--dynamic table-->
  <link href="${ctxStatic}/bootstrap/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${ctxStatic}/bootstrap/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="${ctxStatic}/bootstrap/js/data-tables/DT_bootstrap.css" />

  <link href="${ctxStatic}/bootstrap/css/style.css" rel="stylesheet">
  <link href="${ctxStatic}/bootstrap/css/style-responsive.css" rel="stylesheet">

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
       <!--  <div class="page-heading">
            
        </div> -->
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
        <div class="row">
        <div class="col-sm-12">
        <section class="panel">
        
        <div class="panel-body">
         
        	<iframe id="officeContent" src="../../../druid/index.html" width="100%" height="800px" frameborder="0"></iframe> 
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

<!--dynamic table-->
<script type="text/javascript" language="javascript" src="${ctxStatic}/bootstrap/js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${ctxStatic}/bootstrap/js/data-tables/DT_bootstrap.js"></script>
<!--dynamic table initialization -->
<script src="${ctxStatic}/bootstrap/js/dynamic_table_init.js"></script>

<!--common scripts for all pages-->
<script src="${ctxStatic}/bootstrap/js/scripts.js"></script>
<script type="text/javascript">

$(function() {
	 openSubMenu("84"); 
});
 </script> 
</body>
</html>
