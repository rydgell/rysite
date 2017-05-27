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

  <title>Blank Page</title>

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
           <%--  <jsp:include page="/WEB-INF/views/include/menus.jsp" flush="true" />  --%>
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
        <div class="page-heading">
            Page Tittle goes here
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">
            Body contents goes here
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer class="sticky-footer">
            2014 &copy; AdminEx by ThemeBucket
        </footer>
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


<!--common scripts for all pages-->
<script src="${ctxStatic}/bootstrap/js/scripts.js"></script>

</body>
</html>
