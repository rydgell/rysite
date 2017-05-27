<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>首页</title>

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
        <!--<div class="page-heading">-->
            <!--Page Tittle goes here-->
        <!--</div>-->
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">

            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-pic text-center">
                                        <img alt="" src="${ctxStatic}/bootstrap/images/photos/user1.png">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <ul class="p-info">
                                        <li>
                                            <div class="title">性别</div>
                                            <div class="desk">男</div>
                                        </li>
                                         <li>
                                            <div class="title">姓名</div>
                                            <div class="desk">李毅大帝</div>
                                        </li>
                                        <li>
                                            <div class="title">部门</div>
                                            <div class="desk">技术部</div>
                                        </li>
                                       
                                        <li>
                                            <div class="title">用户类型</div>
                                            <div class="desk">管理员</div>
                                        </li>
                                        <li>
                                            <div class="title">邮箱</div>
                                            <div class="desk">xxx@qq.com</div>
                                        </li>
                                        <li>
                                            <div class="title">电话</div>
                                            <div class="desk">1888888888</div>
                                        </li>
                                         <li>
                                            <div class="title">用户角色</div>
                                            <div class="desk">管理员,技术人员</div>
                                        </li>
                                        <li>
                                            <div class="title">备注</div>
                                            <div class="desk">xxoo</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body p-states">
                                    <div class="summary pull-left">
                                        <h4><span>上次登录</span></h4>
                                        <span></span>
                                        <h6>IP:<span>127.0.0.1</span></h6>
                                        <h6>时间:<span>2017年5月4日 星期四 15:12:12</span></h6>
                                    </div>
                                    <div id="expense" class="chart-bar"></div>
                                </div>
                            </div>
                        </div>
                         
                        
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-desk">
                                        <h1></h1>
                                        <span class="designation"></span>
                                        <p>
                                        </p>
                                        <a class="btn p-follow-btn pull-left" href="#"> <i class="fa fa-check"></i> Following</a>

                                        <ul class="p-social-link pull-right">
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="#">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-google-plus"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <form>
                                    <textarea class="form-control input-lg p-text-area" rows="2" placeholder="Whats in your mind today?"></textarea>
                                </form>
                                <footer class="panel-footer">
                                    <button class="btn btn-post pull-right">Post</button>
                                    <ul class="nav nav-pills p-option">
                                        <li>
                                            <a href="#"><i class="fa fa-user"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-camera"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa  fa-location-arrow"></i></a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-meh-o"></i></a>
                                        </li>
                                    </ul>
                                </footer>
                            </div>
                        </div>
                    </div>
                    
                </div>
 
        </div>
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

<!--Sparkline Chart-->
<script src="${ctxStatic}/bootstrap/js/sparkline/jquery.sparkline.js"></script>
<script src="${ctxStatic}/bootstrap/js/sparkline/sparkline-init.js"></script>

<!--common scripts for all pages-->
<script src="${ctxStatic}/bootstrap/js/scripts.js"></script>
<script type="text/javascript">


$(function() {
	openSubMenu("29"); 
	 
	 
});
 function changeFrameHeight(){
    var ifm= document.getElementById("mainFrame"); 
    ifm.height=document.documentElement.clientHeight;
}
window.onresize=function(){  
     changeFrameHeight();  
}  
/* function reinitIframe(){  
	var iframe = document.getElementById("mainFrame");  
	try{  
	    var bHeight = iframe.contentWindow.document.body.scrollHeight;  
	    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;  
	    var height = Math.max(bHeight, dHeight);  
	    iframe.height = height;  
	}catch (ex){}  
	}  
	  
	var timer1 = window.setInterval("reinitIframe()", 500); //定时开始  
	  
	function reinitIframeEND(){  
	var iframe = document.getElementById("mainFrame");  
	try{  
	    var bHeight = iframe.contentWindow.document.body.scrollHeight;  
	    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;  
	    var height = Math.max(bHeight, dHeight);  
	    iframe.height = height;  
	}catch (ex){}  
	// 停止定时  
	window.clearInterval(timer1);  
	  
	}   */
</script>
</body>
</html>
