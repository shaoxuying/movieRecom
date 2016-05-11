<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>

<!-- 左侧菜单 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/menu/styles.css" />

<!-- 左侧菜单-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/menu/jquery.easing.1.3.js"></script>

	<!-- 左侧浮动菜单 -->
	<div id="page">
		<div id="container" class="content clearfix">
			<div id="fl_menu">
				<div style="display:none;" class="menulabel">MENU</div>
				<div class="menu">
					<a style="display:none;" href="<%=request.getContextPath()%>/pages/index.jsp" class="menu_item">主页</a>
					<a style="display:none;" href="<%=request.getContextPath() %>/mes/queryUnRead.action" class="menu_item">留言管理</a>
					
					<shiro:hasPermission name="notice:all">
						<a style="display:none;" href="<%=request.getContextPath()%>/notice/queryAllNotice.action" class="menu_item">公告管理</a>
					</shiro:hasPermission>
					<shiro:lacksPermission name="notice:all">
						<a style="display:none;" href="<%=request.getContextPath()%>/notice/queryAllNotice.action" class="menu_item">查看公告</a>
					</shiro:lacksPermission>
					
					<a style="display:none;" href="<%=request.getContextPath()%>/schedule/queryMySchedule.action" class="menu_item">个人办公</a>
					<a style="display:none;" href="<%=request.getContextPath()%>/folder/queryByEmpId.action" class="menu_item">个人文件</a>
					<a style="display:none;" href="<%=request.getContextPath()%>/card/queryByEmpId.action" class="menu_item">我的名片</a>
					<a style="display:none;" href="<%=request.getContextPath()%>/meet/query.action" class="menu_item">会议管理</a>
					
					<shiro:hasPermission name="expatriate:manage">
						<a style="display:none;" href="<%=request.getContextPath()%>/exp/query.action" class="menu_item">外派管理</a>
					</shiro:hasPermission>
					
					<shiro:lacksPermission name="asset:all">
						<a style="display:none;" href="<%=request.getContextPath()%>/ao/query2.action" class="menu_item">资产申请</a>
					</shiro:lacksPermission>
					<shiro:hasPermission name="asset:all">
						<a style="display:none;" href="<%=request.getContextPath()%>/ao/query.action" class="menu_item">资产管理</a>
					</shiro:hasPermission>
					
					
					<shiro:hasAnyRoles name="carmanager, systemadmin">
						<a style="display:none;" href="<%=request.getContextPath() %>/carProcess/queryUserTask.action" class="menu_item">车队管理</a>
					</shiro:hasAnyRoles>
					<shiro:hasRole name="adminadmin">
						<shiro:lacksRole name="carmanager">
							<shiro:lacksRole name="systemadmin">
								<a style="display:none;" href="<%=request.getContextPath() %>/carProcess/queryUserTask.action" class="menu_item">用车审批</a>
							</shiro:lacksRole>
						</shiro:lacksRole>
					</shiro:hasRole>
					<shiro:lacksRole name="carmanager">
						<shiro:lacksRole name="adminadmin">
							<shiro:lacksRole name="systemadmin">
								<a style="display:none;" href="<%=request.getContextPath() %>/pages/car/AddUseOrder.jsp" class="menu_item">用车申请</a>
							</shiro:lacksRole>
						</shiro:lacksRole>
					</shiro:lacksRole>
					
					<shiro:lacksPermission name="leaveout:all">
						<a style="display:none;" href="<%=request.getContextPath()%>/leave/queryy.action" class="menu_item">请假申请</a>
					</shiro:lacksPermission>
					<shiro:hasPermission name="leaveout:all">
						<a style="display:none;" href="<%=request.getContextPath()%>/process/queryUserTask.action" class="menu_item">请假审批</a>
					</shiro:hasPermission>
					
					<shiro:lacksPermission name="reimb:manage">
						<a style="display:none;" href="<%=request.getContextPath()%>/reimb/queryMyReimbursement.action" class="menu_item">报销申请</a>
					</shiro:lacksPermission>
					<shiro:hasPermission name="reimb:manage">
						<a style="display:none;" href="<%=request.getContextPath()%>/reimbprocess/queryUserTask.action" class="menu_item">报销审批</a>
					</shiro:hasPermission>
					
					<shiro:hasRole name="systemadmin">
						<a style="display:none;" href="<%=request.getContextPath() %>/pages/system/SystemMain1.jsp" class="menu_item">系统管理</a>
					</shiro:hasRole>
				</div>
			</div>
			<script type="text/javascript" src="<%=request.getContextPath() %>/js/menu/menu.js"></script>
		</div>
	</div>
