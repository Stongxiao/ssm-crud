<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web的路径
不以 /开始的路径，找资源是以当前的路径为基准，经常出问题

推荐 /开始，找资源不是当前路径，是服务器路径为基准(http://localhost:3306):需要加上项目名
http://localhost:3306/crud

 -->

<script src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
<link href="${APP_PATH}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>

				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_add_input" class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_add_input" placeholder="员工姓名"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="email_add_input" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_add_input" placeholder="员工邮箱"> <span
									class="help-block" id="email_help"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="gender_add_input" class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="F"> 女
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_add_select">

								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	
		<!-- 员工编辑的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" >员工编辑</h4>
				</div>

				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_update_input" class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								 <p class="form-control-static" id="empName_update"></p>
							</div>
						</div>

						<div class="form-group">
							<label for="email_update_input" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_update_input" placeholder="员工邮箱"> <span
									class="help-block" id="email_help"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="gender_update_input" class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="F"> 女
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_Update_select">

								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>
	


	<!-- 搭建显示list -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button type="button" class="btn btn-danger">查询</button>
			</div>
		</div>
		<div class="row">
			<dir>
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>dept</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</dir>
		</div>
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6" id="page_info"></div>

			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav"></div>

		</div>

		<script type="text/javascript">
			$(function(){
				to_page(1);
					
				});
				var totalRecord;
				var currentPage;
				
			
				function to_page(pn){
					$.ajax({
						url:"emps",
						data:"pn="+pn,
						type:"get",
						success:function(result){
							//console.log(result);
							get_emps_table(result);
							get_page_info(result);
							get_page_nav(result);
						}
					});
				}
				
				$("#empName_add_input").change(function(){
					var empName = this.value;
					$.ajax({
						url:"checkUser",
						data:"empName="+empName,
						type:"POST",
						success:function(result){
							if(result.code==100){
							show_validate_msg("#empName_add_input","success","用户名可用")
							$("#emp_save_btn").attr("ajax-val","success")
							}else{
							show_validate_msg("#empName_add_input","error",result.extend.va_msg)
							$("#emp_save_btn").attr("ajax-val","error")
							}
						}
					})
				})
				
				
				//点击新增按钮弹出模态框
				$("#emp_add_modal_btn").click(function(){
					//清除表单数据重置(数据+样式)
					$("#empAddModal form")[0].reset();
					reset_form("#empAddModal form");
					//发送ajax请求，获取deptName
					getDepts("#dept_add_select");	
					$("#empAddModal").modal({
						backdrop:"static"
					});
				})
				function reset_form(ele){
			//数据清除
				$(ele)[0].reset();
			//样式
				$(ele).find("*").removeClass("has-error has-success");
				$(ele).find(".help-block").text("");
				}
				
				function getDepts(ele){
					//清空下拉列表的值
					$(ele).empty();
					$.ajax({
						url:"depts",
						type:"GET",
						success:function(result){
							$.each(result.extend.depts,function(index,item){
								var optionEle=$("<option></option>").append(item.deptName).attr("value",this.deptId);
								$(ele).append(optionEle);
							});
						}
					})
					
				}
				
				function validate_add_form(){
					//1.拿到要校验的数据，使用正则表达式
					/*------------Name-----------------*/
					var empName = $("#empName_add_input").val();
					//2.正则表达式
					var regName =  /(^[A-Za-z0-9]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
					//alert(regName.test(empName));
					if(!regName.test(empName)){
						//清空这个元素之前的样式
						show_validate_msg("#empName_add_input","error","名字必须是2-5个中文或者6-16位英文数字组合")
						//alert("用户名可以是2-5位中文，或者6-16位英文和数字的集合")				
						return false;
					}else{
						show_validate_msg("#empName_add_input","success","")
					}
					/*------------email-----------------*/
					var email = $("#email_add_input").val();
					//alert(email);
					var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
					if (!regEmail.test(email)) {
						show_validate_msg("#email_add_input","error","邮箱格式不正确");
						return false;
					}else{
						show_validate_msg("#email_add_input","success","");
					}
					return true;
					
					
				}
				
				function show_validate_msg(ele,status,msg){
					//清除状态
					$(ele).parent().removeClass("has-success has-error");
					$(ele).next("span").text("");
					
					if("success"==status){
						$(ele).parent().addClass("has-success");
						$(ele).next("span").text(msg);
					}else{
						$(ele).parent().addClass("has-error");
						$(ele).next("span").text(msg);
						 
					}
					}
				
				$(document).on("click",".delete_btn",function(result){
					if(confirm("确认删除")){
					var delId = $(this).parents("tr").find("td:eq(0)").text();
					$.ajax({
					url:"del_emps/"+delId,
					type:"DELETE",
					success:function(result){
						alert(result.msg)
						to_page(1);
					}
					
					})
					}
				});
				
				$(document).on("click",".edit_btn",function(){
					getDepts("#empUpdateModal select");
					getEmp($(this).attr("edit-id"));
					$("#empUpdateModal").modal({
						backdrop:"static"
					});
					
				})
				
				function getEmp(id){
					$.ajax({
						url:"empUpdate/",
						data:"id="+id,
						type:"GET",
						success:function(result){
						var empName = result.extend.emp.empName
						var empGender = result.extend.emp.gender
						var empEmail = result.extend.emp.email
						var dept = result.extend.emp.dId
						$("#empName_update").text(empName);
						$("#email_update_input").val(empEmail);
						$("#empUpdateModal input[name=gender]").val([empGender])
						$("#empUpdateModal select").val([dept])
						}
					})					
				}
				
				$("#emp_save_btn").click(function(result){
					if(!validate_add_form()){
						return false;
					}
					if($(this).attr("ajax-val")=="error"){
						return false;
					}
					$.ajax({
						url:"emps",
						data:$("#empAddModal form").serialize(),
						type:"POST",
						success:function(result){
							$("#empAddModal").modal('hide');
							to_page(9999);
						}					
					})
				})
				
				function get_emps_table(result) {
					$("#emps_table tbody").empty();
					var emps = result.extend.pageInfo.list;
					$.each(emps,function(index,item){
						var empId = $("<td></td>").append(item.empId);
						var empName = $("<td></td>").append(item.empName);
						var gender = $("<td></td>").append(item.gender=='M'?"男":"女");
						var email = $("<td></td>").append(item.email);
						var dept = $("<td></td>").append(item.department.deptName);
						//创建按钮
						var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
		  				/* 增加id属性 */
		  				editBtn.attr("edit-id",item.empId);
						var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
						delBtn.attr("del-id",item.empId);
						//删除按钮点击事件											
						var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
						
						$("<tr></tr>").append(empId).append(empName)
						.append(gender).append(email).append(dept)
						.append(btnTd).appendTo("#emps_table tbody")						
					})
				}
				
				
				
				function get_page_nav(result) {
					$("#page_nav").empty();
					//构建元素
					var ul=$("<ul></ul>").addClass("pagination");
					var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
					var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
					if(!result.extend.pageInfo.hasPreviousPage){
						firstPageLi.addClass("disabled");
						prePageLi.addClass("disabled");
					}else{
						//为元素添加点击翻页事件
						/* 首页 */
						firstPageLi.click(function(){
							to_page(1);
						});
						/* 前一页 */
						prePageLi.click(function(){
							to_page(result.extend.pageInfo.pageNum-1);
						});
						
					}
					var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));			
					var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
					if(!result.extend.pageInfo.hasNextPage){
						nextPageLi.addClass("disabled");
						lastPageLi.addClass("disabled");
					}else{
						nextPageLi.click(function(){
							to_page(result.extend.pageInfo.pageNum+1);
						});
						
						lastPageLi.click(function(){
							to_page(result.extend.pageInfo.pages);
						});
					};
					
					ul.append(firstPageLi).append(prePageLi);
					//item 1,2,3,4,5
					$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
						var numLi=$("<li></li>").append($("<a></a>").append(item));
						if(result.extend.pageInfo.pageNum == item){
							numLi.addClass("active");
						}
						numLi.click(function(){
							to_page(item);
						})
						ul.append(numLi);
					});
					//添加下一页和末页提示
					ul.append(nextPageLi).append(lastPageLi);
					//把ul加入到nav中
					var navEle=$("<nav></nav>").append(ul);
					//添加到导航条
					navEle.appendTo("#page_nav");		
				}
				
				function get_page_info(result) {
					$("#page_info").empty();
					var info = result.extend.pageInfo
					var pageNum = ("当前第"+info.pageNum+"页,");
					var pagePages = ("总"+info.pages+"页,");
					var pageTotal = ("总"+info.total+"条记录");
					$("#page_info").append(pageNum).append(pagePages).append(pageTotal);
					var totalRecord = result.extend.pageInfo.total;
					var currentPage = result.extend.pageInfo.pageNum;
					
				}
		
		
		</script>
</body>
</html>
