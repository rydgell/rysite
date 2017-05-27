<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html> 
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>${fns:getConfig('productName')} 登录</title>

    <link href="${ctxStatic}/bootstrap/css/style.css" rel="stylesheet">
    <link href="${ctxStatic}/bootstrap/css/style-responsive.css" rel="stylesheet">
	<link href="${ctxStatic}/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					 
				},
				messages: {
					 
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
<body class="login-body">

<div class="container">
     <form class="form-signin" id="loginForm" action="${ctx}/login" method="post">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">${fns:getConfig('productName')}</h1>
            <img src="${ctxStatic}/bootstrap/images/login-logo.png" alt=""/>
        </div>
       
        <div id="messageBox" class="alert alert-warning ${empty message ? 'hide' : ''}">
        	<a href="#" class="close" data-dismiss="alert">&times;</a>
			<strong id="loginError" >${message}</strong>
		</div>
		
        <div class="login-wrap">
            <input type="text" class="form-control" id="username" name="username" placeholder="账号" autofocus required>
            <input type="password" class="form-control" id="password" name="password" placeholder="密码" required>

            <button class="btn btn-lg btn-login btn-block" type="submit" >
                <i class="fa fa-check"></i>
            </button>

            <div class="registration">
                <!-- 	没有账号?
                <a class="" href="registration.html">
                   	 注册
                </a> -->
            </div>
            <label class="checkbox">
                <!-- <input type="checkbox" value="remember-me"> 记住我（公共场所慎用） -->
                <span class="pull-right">
                   <!--  <a data-toggle="modal" href="#myModal"> 忘记密码?</a> -->

                </span>
            </label>
 
        </div>
		 </form>
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">忘记密码 ?</h4>
                    </div>
                    <div class="modal-body">
                        <p>请填写你的e-mail重置密码!</p>
                        <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">取消</button>
                        <button class="btn btn-primary" type="button">确定</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

   
 
</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${ctxStatic}/bootstrap/js/jquery-1.10.2.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/bootstrap/js/modernizr.min.js"></script>
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
</body>
</html>
