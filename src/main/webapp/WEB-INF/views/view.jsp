<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<script src="/assets/js/jquery.datetimepicker.full.min.js"></script>
<script src="js/jquery-1.12.3.min.js" type="text/ecmascript"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Tasks</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/Taskeria/assets/css/bootstrap.min.css"></link>
<link rel='stylesheet' href="/Taskeria/assets/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/Taskeria/assets/css/style.css"></link>
<script src="/Taskeria/assets/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="/Taskeria/assets/js/gijgo.js" type="text/javascript"></script>
<link href="/Taskeria/assets/css/gijgo.css" rel="stylesheet"
	type="text/css" />
<script src="/Taskeria/assets/js/custom.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#datepicker,#datepicker1').datepicker({
			uiLibrary : 'bootstrap'
		});
	});
</script>
<script>
	$(document).ready(function() {
		//Toggle fullscreen
		$(".table-fullscreen").click(function(e) {
			e.preventDefault();

			var $this = $(this);

			if ($this.children('i').hasClass('glyphicon-resize-full')) {
				$this.children('i').removeClass('glyphicon-resize-full');
				$this.children('i').addClass('glyphicon-resize-small');
			} else if ($this.children('i').hasClass('glyphicon-resize-small')) {
				$this.children('i').removeClass('glyphicon-resize-small');
				$this.children('i').addClass('glyphicon-resize-full');
			}
			$(this).closest('.panel').toggleClass('panel-fullscreen');
		});

	});

	function editDocument() {

		$(document)
				.on(
						"click",
						".open-editBox",
						function() {
							var editId = $(this).data('id');
							alert(editId);
							$
									.ajax({
										type : 'GET',
										url : '/Taskeria/task/getTask?id='
												+ editId,
										headers : {
											'Content-Type' : 'application/x-www-form-urlencoded'
										},
										success : function(response) {
											alert(response);
											$('#updateModal .modal-body #name')
													.val(response.task.name);

											$(
													'#updateModal .modal-body #objective')
													.val(
															response.task.objective);
											$(
													'#updateModal .modal-body #startTime')
													.val(
															response.task.startTime);
											$(
													'#updateModal .modal-body #endTime')
													.val(response.task.endTime);
											$(
													'#updateModal .modal-body #status')
													.val(response.task.status);

										}
									});

							//$(".modal-body #editId").val( editId );
						});
	}
	function getAllTaskByStatus() {
		if ($('#statusTypeFilters').val().trim().length > 0) {
			alert($('#statusTypeFilters').val());
			//console.log($('#statusTypeFilters').val());
			$('#load_screen').show();
			window.location.href = "/Taskeria/task/filter?item="
					+ $('#statusTypeFilters').val();
		}
	}
	/* function getAllTaskByStartDate()
	 {
	 if($('#statusTypeFilters').val().trim().length > 0)
	 {	
	 //console.log($('#statusTypeFilters').val());
	 $('#load_screen').show();
	 window.location.href="/Taskeria/task/filter?name="+$('#startTimeFilters').val()+"&item=startTime";
	 }
	 }
	 function getAllTaskByEndDate()
	 {
	 if($('#statusTypeFilters').val().trim().length > 0)
	 {	
	 //console.log($('#statusTypeFilters').val());
	 $('#load_screen').show();
	 window.location.href="/Taskeria/task/filter?name="+$('#endTimeFilters').val()+"&item=endTime"
	 }
	 } */

	function validate() {

		var name = document.forms["create-form"]["taskName"].value;
		var objective = document.forms["create-form"]["objective"].value;
		var startDate = document.forms["create-form"]["startTime"].value;
		var endDate = document.forms["create-form"]["endTime"].value;
		if (name == "" || objective == "" || startDate == "" || endDate == "") {
			document.getElementById("demo").innerHTML = "All fields are mandatory";
			return false;
		}

		if (startDate > endDate) {
			document.getElementById("demo").innerHTML = "Start Date must be less than or equal to End Date";
		}

	}
</script>


</head>

<body>
	<div class="wrapper_header">
		<div class="header_part">
			<div class="col-sm-6">
				<div class="logo">
					<img src="/Taskeria/assets/images/logo.png" alt="logo">
				</div>
			</div>



			<div class="col-sm-6">
				<div class="profile">
					<img src="/Taskeria/assets/images/admin_icon.png" alt="profile">

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">Username<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#"><span class="fa fa-cogs"></span>
										Settings</a></li>
								<li class="divider"></li>
								<li><a href="#"><span class="fa fa-power-off"></span>
										Log Out</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>

	</div>
	<!--fixed_menu-->
	<div class="workarea">
		<div class="nav_sidemenu">
			<div class="col-sm-3" style="padding: 0;">
				<div class="nav-side-menu">
				<p style="font-size: 30px;margin:76px 46px 10px;">Welcome ${userName}</p>
				</div>
			</div>
		</div>
		<div class="col-sm-3" style="padding: 0;"></div>
		<div class="col-sm-9" style="padding: 0; padding-top: 62px;">
			<div class="admin_title"></div>
			<div class="work_area">
				<div class="col-sm-6">
					<div class="filters">
						<h3 style="margin: 0px 0px 15px 0px;">Filters</h3>
						<div class="filter_select">
							<select class="drop_down" onchange="getAllTaskByStatus()"
								id="statusTypeFilters">
								<option value="">select</option>
								<option value="new">New</option>
								<option value="started">Started</option>
								<option value="completed">Completed</option>

							</select>
						</div>


					</div>
				</div>
				<div class="col-sm-6">
					<div class="create_new">
						<button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">Create New</button>

						<div id="myModal" class="modal fade" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<form id="create-form" class="form-horizontal" role="form"
										action="/Taskeria/task/addTask1" method="post"
										onsubmit="validate()">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Create Task</h4>
											<p id="demo"></p>
										</div>
										<div class="modal-body">
											<div class="filter_form">

												<div class="form-group">
													<label for="inputEmail3" class="col-sm-2 control-label">Task
														Name</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="taskName"
															name="taskName" placeholder="Enter task name">
													</div>
												</div>
												<div class="form-group">
													<label for="inputPassword3" class="col-sm-2 control-label">Objective</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="objective"
															name="objective" placeholder="objective">
													</div>
												</div>

												<div class="form-group">
													<label for="inputPassword3" class="col-sm-2 control-label">Start
														Date</label>
													<div class="col-sm-10">
														<input id="startTime" type="text" name="startTime"
															width="270" placeholder="dd/mm/yyyy" />
													</div>
												</div>
												<div class="form-group">
													<label for="inputPassword3" class="col-sm-2 control-label">End
														Date</label>
													<div class="col-sm-10">
														<input id="endTime" type="text" name="endTime" width="270"
															placeholder="dd/mm/yyyy" />
													</div>
												</div>
												<div class="form-group">
													<label for="inputEmail3" class="col-sm-2 control-label">Task
														Status</label>
													<div class="col-sm-10">
														<input type="text" class="form-control" id="status"
															name="status" readonly="readonly" value="new">
													</div>
												</div>





											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-default">Save</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="">
				<table id="viewMasterPropertiesTableData"
					class="table table-bordered">
					<thead>
						<tr class="inf">
							<th class="id" align="center" style="font-size: 14px;"><label
								class="text-info">ID</label></th>
							<th class="default" align="center" style="font-size: 14px;"><label
								class="text-info">Name</label></th>
							<th class="default" align="center" style="font-size: 14px;"><label
								class="text-info">objective</label></th>
							<th class="desc" align="center" style="font-size: 14px;"><label
								class="text-info">Start Time</label></th>
							<th class="default" align="center" style="font-size: 14px;"><label
								class="text-info">End Time</label></th>
							<th class="default" align="center" style="font-size: 14px;"><label
								class="text-info">Status</label></th>
							<th class="text-center" style="font-size: 14px;"><label
								class="text-info">Update</label></th>

						</tr>
					</thead>
					<tbody>

						<c:forEach var="tasks" items="${requestScope.tasks}">
							<tr class="well">
								<td align="center"><c:out value="${tasks.id}" /></td>
								<td align="center" class="capitalize"><c:out
										value="${tasks.name}" /></td>
								<td align="center" class="capitalize"><c:out
										value="${tasks.objective}" /></td>
								<td align="center" class="capitalize"><c:out
										value="${tasks.startTime}" /></td>
								<td align="center" class="capitalize"><c:out
										value="${tasks.endTime}" /></td>
								<td align="center" class="capitalize"><c:out
										value="${tasks.status}" /></td>
								<c:choose>
									<c:when test="${tasks.status eq 'completed'}">
										<td class="text-center"><a href="#"
											class="btn btn-info btn-lg" style="font-size: 8px;"> Ok </a></td>
									</c:when>
									<c:otherwise>
										<td class="text-center"><a
											href="/Taskeria/task/editTask?id=<c:out value="${tasks.id}"/>"><span
												class="glyphicon glyphicon-edit" style="color: #1d5866;"></span></a>
										</td>
									</c:otherwise>
								</c:choose>
								<td align="center" class="capitalize"><a
									href="/Taskeria/task/deleteTask?id=<c:out value="${tasks.id}"/>">
										<span class="glyphicon glyphicon-trash"></span>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>


</body>


</html>