<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!--logo and iconic logo start-->
        <div class="logo">
            <a href=""><img src="${ctxStatic}/bootstrap/images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href=""><img src="${ctxStatic}/bootstrap/images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->


<div class="left-side-inner">
            <!-- visible to small devices only -->
 <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="${ctxStatic}/bootstrap/images/photos/user1.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#">${fns:getUser().name}</a></h4>
                    </div>
                </div>

                <ul class="nav nav-pills nav-stacked custom-nav">
                    <li><a href="#"><i class="fa fa-cog"></i> <span>设置</span></a></li>
                    <li><a href="${ctx}/logout"><i class="fa fa-sign-out"></i> <span>登出</span></a></li>
                </ul>
            </div>

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
            
                <%-- <li class="menu-list"><a href="${ctx}"><i class="fa fa-home"></i> <span>首页</span></a>
                    <ul class="sub-menu-list">
                    	<li ><a href="${ctx}">首页</a></li>
                        <li ><a href="${ctx}/sys/user/userinfo">个人中心</a></li>
                    </ul>
                </li> --%>
                 <c:set var="firstMenu" value="true"/>
                 <c:forEach items="${fns:getSysMenuList()}" var="menu" varStatus="idxStatus">
							<c:if test="${menu.parent.parentId eq '1'&&menu.parent.isShow eq '1'}">
								<%-- <li class="menu-list ${not empty firstMenu && firstMenu ? ' nav-active' : ''}">  --%>
								<li class="menu-list">
									<c:if test="${empty menu.parent.href}">
										<a href="javascript:" data-href="#" data-id="${menu.parent.id}">
										<c:if test="${menu.parent.id !='2' && menu.parent.id !='27'}">
											<i class="fa fa-laptop"></i>
										</c:if>
										<c:if test="${menu.parent.id eq '2'}">
											<i class="fa fa-cogs"></i>
										</c:if>
										<c:if test="${menu.parent.id eq '27'}">
											<i class="fa fa-home"></i>
										</c:if>
										<span>${menu.parent.name}</span></a>
										<ul class="sub-menu-list">
											<c:forEach items="${menu.submenus}" var="sub" >
												<li id="m_${sub.id}"><a href="${ctx}${sub.href}">${sub.name}</a></li>
											</c:forEach>
					                    	 
                    					</ul>
									</c:if>
									<c:if test="${not empty menu.parent.href}">
										<a id="m_${menu.parent.id}" href="${fn:indexOf(menu.parent.href, '://') eq -1 ? ctx : ''}${menu.parent.href}" data-id="${menu.parent.id}" ><i class="fa fa-laptop"></i><span>${menu.parent.name}</span></a>
									</c:if>
								</li>
								<%-- <c:if test="${firstMenu}">
									<c:set var="firstMenuId" value="${menu.parent.id}"/>
								</c:if>
								<c:set var="firstMenu" value="false"/> --%>
							</c:if>
				</c:forEach>
                
                 
                 
                 
              
            </ul>
        <!--sidebar nav end-->     
 </div>