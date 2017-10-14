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
			//console.log($('#statusTypeFilters').val());
			$('#load_screen').show();
			window.location.href = "/Taskeria/task/filter?name="
					+ $('#statusTypeFilters').val() + "&item=status";
		}
	}
	function getAllTaskByStartDate() {
		if ($('#statusTypeFilters').val().trim().length > 0) {
			//console.log($('#statusTypeFilters').val());
			$('#load_screen').show();
			window.location.href = "/Taskeria/task/filter?name="
					+ $('#startTimeFilters').val() + "&item=startTime";
		}
	}
	function getAllTaskByEndDate() {
		if ($('#statusTypeFilters').val().trim().length > 0) {
			//console.log($('#statusTypeFilters').val());
			$('#load_screen').show();
			window.location.href = "/Taskeria/task/filter?name="
					+ $('#endTimeFilters').val() + "&item=endTime"
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
				<div class="nav-side-menu"></div>
			</div>
		</div>
		<div class="col-sm-3" style="padding: 0;"></div>
		<div class="col-sm-9" style="padding: 0; padding-top: 62px;">
			<div class="admin_title"></div>

			<div class="form-group" style="width: 570px; padding-top: 70px;">



				<form class="form-horizontal" role="form"
					action="/Taskeria/task/updateTask" method="post">


					<div class="filter_form">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Task
								Id</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="id" name="id"
									value="${task.id}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Task
								Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="taskName"
									name="taskName" value="${task.name}">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Objective</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="objective"
									name="objective" value="${task.objective}">
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Start
								Date</label>
							<div class="col-sm-10">
								<input id="startTime" type="text" name="startTime"
									value="${task.startTime}" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">End
								Date</label>
							<div class="col-sm-10">
								<input id="endTime" type="text" name="endTime"
									value="${task.endTime}" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Task
								Status</label>
							<div class="col-sm-10">
								<select class="form-control" id="status" name="status">
									<option value="${task.status}" selected>${task.status}</option>
									<option value="new">new</option>
									<option value="started">started</option>
									<option value="completed">completed</option>
								</select>
							</div>
						</div>






					</div>

					<button type="submit" style="background-color: greenyellow;"
						class="btn btn-default">Update</button>


				</form>
			</div>


		</div>

	</div>



</body>


</html>