<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Update Event</h1>
</div>
<div class="col-sm-10 col-sm-offset-1">
	<c:if test="${not empty errors}">
		<div class="alert alert-danger">
			<button type="button" class="close btn-lg" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<ul>
				<c:forEach items="${errors}" var="e">
					<li>${e}</li>
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
					<li>${sm}</li>
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
					<li>${w}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</div>

<div class="mfp-hide white-popup-block popupOptions" id="deleteConfirm">
	<form class="form-horizontal" method="POST" id="event-form"
		action="${pageContext.request.contextPath}/customer/event/delete/${event.id}"
		enctype="application/x-www-form-urlencoded" autocomplete="off">
		<div align="center">Are you sure you want to delete this event?</div>
		<br /> <br />
		<div align="center">
			<button type="submit" class="btn btn-default">
				<span class="glyphicon glyphicon-trash"></span> Confirm Delete
			</button>
		</div>
	</form>
</div>

<div class="col-sm-2 col-sm-offset-1">
	<a class="popup-with-form" href="#deleteConfirm">
		<button class="btn btn-default">
			<span class="glyphicon glyphicon-trash"></span> Delete Event
		</button> <br /> <br />
	</a>
</div>

<form class="form-horizontal" method="POST" id="event-form"
	action="${pageContext.request.contextPath}/customer/event/update/${event.id}"
	enctype="application/x-www-form-urlencoded" autocomplete="off"
	onsubmit="return validateEventForm();">
	<div class="col-sm-10 col-sm-offset-1">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">The Basics</h3>
			</div>
			<div class="panel-body">

				<div class="form-group">
					<label for="name" class="col-sm-3 control-label">Event Name<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="text" size="50" maxlength="250" name="name"
							required="required" placeholder="Ex.: Victoria's Birthday party"
							autofocus class="form-control" value="${event.name}">
					</div>
				</div>

				<div class="form-group">
					<label for="datetimepicker" class="col-sm-3 control-label">Date/Time<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-3">
						<input hidden="hidden" value="${event.date_time}"
							id="eventDateTime"> <input type="text" size="10"
							name="datetimepicker_date" id="datetimepicker_date"
							required="required" class="form-control">
					</div>
					<div class="col-sm-3">
						<input type="text" size="10" name="datetimepicker_time"
							id="datetimepicker_time" required="required" class="form-control">
					</div>
				</div>

				<div class="form-group">
					<label for="person_count" class="col-sm-3 control-label">Number
						of Adults<span style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="text" size="20" maxlength="20" name="person_count"
							id="person_count" required="required" pattern="[0-9]+"
							title="Must be a Number" class="form-control"
							value="${event.personCount}">
					</div>
				</div>

				<div class="form-group">
					<label for="kids_count" class="col-sm-3 control-label">Number
						of Kids : </label>
					<div class="col-sm-6">
						<input type="text" size="20" maxlength="20" name="kids_count"
							id="kids_count" pattern="[0-9]+" title="Must be a Number"
							class="form-control" value="${event.kidsCount}">
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

		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Event Location</h3>
			</div>
			<div class="panel-body">
				<input type="hidden" name="LastAddressValidated" value="">
				<div class="alert alert-danger hidden" id="addressnotok">
					<button type="button" class="close btn-lg" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					Address validation failed. Please check your address.<br /> If the
					problem persists, please contact customer support.
				</div>
				<div class="form-group">
					<label for="street1" class="col-sm-3 control-label">Street<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="street1"
							required="required" placeholder="Street" class="form-control"
							value="${event.location.street1}">
					</div>
				</div>

				<%-- <div class="form-group">
					<label for="street2" class="col-sm-3 control-label">Street
						2 :</label>
					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="street2"
							placeholder="Line 2" class="form-control"
							value="${event.location.street2}">
					</div>
				</div> --%>

				<div class="form-group">
					<label for="city" class="col-sm-3 control-label">City<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="text" size="30" name="city" required="required"
							placeholder="City" class="form-control"
							value="${event.location.city}">
					</div>
				</div>

				<div class="form-group">
					<label for="state" class="col-sm-3 control-label">State<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="hidden" name="stateExisting"
							value="${event.location.state}"> <span id="stateArea"></span>
					</div>
				</div>

				<div class="form-group">
					<label for="zip" class="col-sm-3 control-label">Zip<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="text" size="10" name="zip" maxlength="10"
							required="required" placeholder="Ex.: xxxxx" class="form-control"
							value="${event.location.zip}">
					</div>
				</div>

				<div class="form-group">
					<label for="deliveryOption" class="col-sm-3 control-label">Delivery
						Option<span style="color: red">*</span> :
					</label>
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
		<div class="col-sm-1">
			<button type="button" class="btn btn-default"
				onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">
				Cancel</button>
		</div>
		<div class="col-sm-2 col-sm-offset-4">
			<button type="submit" class="btn btn-default">Update Event</button>
		</div>
		<div class="col-sm-1 col-sm-offset-4">
			<button type="reset" class="btn btn-default">Reset</button>
			<br /> <br /> <br /> <br />
		</div>
</form>


<script>
	$('document').ready(function() {
		populateStateDropDown();
		var existingState = $('input[name=stateExisting]').val();
		$('select[name=state]').val(existingState);
		var eventDateTime = $("input[id=eventDateTime]").val();
		//console.log(eventDateTime);
		eventDateTime = moment(eventDateTime, "YYYY-MM-DD HH:mm:s.S").format('YYYY/MM/DD HH:mm');
		//console.log(eventDateTime);
		var eventDate = eventDateTime.split(' ')[0];
		var eventTime = eventDateTime.split(' ')[1];
		$("#datetimepicker_date").datetimepicker({
			value : eventDate,
			startDate : eventDate,
			dayOfWeekStart : 0,
			lang : 'en',
			timepicker : false,
			format : 'Y/m/d'
		});
		$("#datetimepicker_time").datetimepicker({
			value : eventTime,
			lang : 'en',
			datepicker : false,
			format : 'H:i',
			hours12: false,
			allowTimes : [ '6:00', '6:15', '6:30', '6:45',
							'7:00', '7:15', '7:30', '7:45', '8:00',
							'8:15', '8:30', '8:45', '9:00', '9:15',
							'9:30', '9:45', '10:00', '10:15', '10:30',
							'10:45', '11:00', '11:15', '11:30',
							'11:45', '12:00', '12:15', '12:30',
							'12:45', '13:00', '13:15', '13:30',
							'13:45', '14:00', '14:15', '14:30',
							'14:45', '15:00', '15:15', '15:30',
							'15:45', '16:00', '16:15', '16:30',
							'16:45', '17:00', '17:15', '17:30',
							'17:45', '18:00', '18:15', '18:30',
							'18:45', '19:00', '19:15', '19:30',
							'19:45', '20:00', '20:15', '20:30',
							'20:45', '21:00' ]
		});
	});
</script>
