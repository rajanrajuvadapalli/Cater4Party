<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-sm-offset-2 page-header">
	<h1>Update Event</h1>
</div>

<c:if test="${not empty errors}">
	<div class="alert alert-danger">
		<button type="button" class="close btn-lg" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<ul>
			<c:forEach items="${errors}" var="e">
				<li align="left">${e}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="alert alert-success">
		<button type="button" class="close btn-lg" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<ul>
			<c:forEach items="${successMessages}" var="sm">
				<li align="left">${sm}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="alert alert-warning">
		<button type="button" class="close btn-lg" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<ul>
			<c:forEach items="${warnings}" var="w">
				<li align="left">${w}</li>
			</c:forEach>
		</ul>
	</div>
</c:if>

<div align="col-sm-offset-10">
	<a class="popup-with-form" href="#deleteConfirm">
		<button class="btn btn-default">Delete Event</button>
	</a>
</div>
<br />

<div class="mfp-hide white-popup-block popupOptions" id="deleteConfirm">
	<form class="form-horizontal" method="POST" id="event-form"
		action="${pageContext.request.contextPath}/customer/event/delete/${event.id}"
		enctype="application/x-www-form-urlencoded" autocomplete="off">
		Are you sure you want to delete this event?<br /> <br />
		<div align="center">
			<button type="submit" class="btn btn-default">Confirm Delete</button>
		</div>
	</form>
</div>

<div class="col-sm-9 col-sm-offset-2">
	<form class="form-horizontal" method="POST" id="event-form"
		action="${pageContext.request.contextPath}/customer/event/update/${event.id}"
		enctype="application/x-www-form-urlencoded" autocomplete="off"
		onsubmit="return validateEventForm();">
		<div class="col-sm-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">The Basics</h3>
				</div>
				<div class="panel-body">

					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Event
							Name :</label>
						<div class="col-sm-6">
							<input type="text" size="50" maxlength="250" name="name"
								required="required" placeholder="Ex.: Victoria's Birthday party"
								autofocus class="form-control" value="${event.name}">
						</div>
					</div>

					<div class="form-group">
						<label for="datetimepicker" class="col-sm-3 control-label">Date/Time
							:</label>
						<div class="col-sm-6">
							<input hidden="hidden" value="${event.date_time}" id="eventDate">
							<input type="text" size="30" maxlength="50" name="datetimepicker"
								id="datetimepicker" required="required" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="person_count" class="col-sm-3 control-label">Number
							of Persons :</label>
						<div class="col-sm-6">
							<input type="text" size="20" maxlength="20" name="person_count"
								id="person_count" required="required" pattern="[0-9]+"
								title="Must be a Number" class="form-control"
								value="${event.personCount}">
						</div>
					</div>

					<!-- Note: This will be a future enhancement. -->
					<!-- <div class="form-group">
					<label for="budget_total" class="col-sm-3 control-label">Total
						Budget :</label>
					<div class="col-sm-6">
						<input type="text" size="20" maxlength="20" name="budget_total"
							required="required" pattern="[0-9]+" title="Must be a Number"
							class="form-control">
					</div>
				</div> -->
				</div>
			</div>

			<div class="col-sm-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Event Location</h3>
					</div>
					<div class="panel-body">

						<div class="form-group">
							<label for="street1" class="col-sm-3 control-label">Street
								1 :</label>
							<div class="col-sm-6">
								<input type="text" size="30" maxlength="50" name="street1"
									required="required" placeholder="Line 1" class="form-control"
									value="${event.location.street1}">
							</div>
						</div>

						<div class="form-group">
							<label for="street2" class="col-sm-3 control-label">Street
								2 :</label>
							<div class="col-sm-6">
								<input type="text" size="30" maxlength="50" name="street2"
									placeholder="Line 2" class="form-control"
									value="${event.location.street2}">
							</div>
						</div>

						<div class="form-group">
							<label for="city" class="col-sm-3 control-label">City :</label>
							<div class="col-sm-6">
								<input type="text" size="30" name="city" required="required"
									placeholder="City" class="form-control"
									value="${event.location.city}">
							</div>
						</div>

						<div class="form-group">
							<label for="state" class="col-sm-3 control-label">State :</label>
							<div class="col-sm-6">
								<input type="hidden" name="stateExisting"
									value="${event.location.state}"> <span id="stateArea"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="zip" class="col-sm-3 control-label">Zip :</label>
							<div class="col-sm-6">
								<input type="text" size="10" name="zip" maxlength="10"
									required="required" placeholder="Ex.: xxxxx"
									class="form-control" value="${event.location.zip}">
							</div>
						</div>

						<div class="form-group">
							<label for="deliveryOption" class="col-sm-3 control-label">Delivery
								Option :</label>
							<div class="col-sm-6">
								<select class="form-control inputs" name="deliveryOption"
									id="deliveryOption">
									<option value="1" ${event.isPickUp()?'selected':''}>Pick
										Up</option>
									<option value="2" ${event.isPickUp()?'':'selected'}>Delivered</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<button type="button" class="btn btn-default"
					onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">
					Cancel</button>
			</div>
			<div class="col-sm-4 col-sm-offset-2">
				<button type="submit" class="btn btn-default">Update Event</button>
			</div>
			<div class="col-sm-2 col-sm-offset-2">
				<button type="reset" class="btn btn-default">Reset</button>
			</div>
	</form>
</div>
<br />
<br />

<script>
	$('document').ready(function() {
		populateStateDropDown();
		var existingState = $('input[name=stateExisting]').val();
		$('select[name=state]').val(existingState);
		var eventDate = $("input[id=eventDate]").val();
		//console.log(eventDate);
		$("#datetimepicker").datetimepicker({
			value : new Date(eventDate)
		});
	});
</script>
