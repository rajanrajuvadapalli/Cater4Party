<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="quote" value="${quote}"></c:set>
<c:set var="r" value="${restuarant}"></c:set>
<c:set var="e" value="${event}"></c:set>


<div class="col-sm-offset-2 page-header">
	<h1>Payment</h1>
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

<div class="col-sm-9 col-sm-offset-2">
	<form class="form-horizontal" method="POST" id="event-form"
		action="${pageContext.request.contextPath}/customer/makePayment"
		enctype="application/x-www-form-urlencoded" autocomplete="off"
		>
		
		   <div class="col-sm-12">
				<div class="panel panel-success" >
					<div class="panel-heading">
						<h3 class="panel-title">Event Details</h3>
					</div>
				<div class="panel-body" align="left">
				<b>Event name:</b> ${e.name}<br /> <b>Time:</b>
				${e.date_time}<br /> <b>Number of people:</b> <span
					style="color: red;">${e.personCount}</span><br /> <b>Delivery
					Option:</b> <span style="color: red;">${e.isPickUp()?'Pick Up':'Delivered'}</span><br />
				<b>Customer name:</b> ${e.customer.name}<br /> <b>Customer
					contact number:</b> ${e.customer.contactNumber}<br />
					<b>Restaurant Name:</b>${r.name}
					<div class="row" align="center">
					
					<script async="async" src="https://www.paypalobjects.com/js/external/paypal-button.min.js?merchant=PX5RV8W8STFCY" 
                   data-button="buynow" 
                   data-name="${e.name}" 
                   data-amount="${quote.price}" 
                   data-currency="USD" 
                   data-tax="" 
                   data-number="${quote.id}"
    
    data-style="secondary"
    data-callback="http://www.caterrequest.us/payment/notify" 
    
></script>
 <div class="col-sm-4 col-sm-offset-2">
				<button type="submit" class="btn btn-default">Pay at Restaurant</button>
			</div>
			
</div>
          
			</div>
				
				</div>
				<input type="hidden" name="xquoteId" value="${quote.id}">
				<input type="hidden" size="30" maxlength="10" name="eventName"  class="form-control"  value = "${e.name}" readonly>
				<input type="hidden" size="16" name="eventTime" class="form-control" value="${e.date_time}" readonly>
				<input type="hidden" size="30" name="expDate" class="form-control" value = "${e.location }">
				<input type="hidden" size="30" name="restuarantName" required="required" class="form-control" value="${r.name}">
				<input type="hidden" size="4" name="securityCode" required="required" value="${quote.price}" class="form-control" readonly>
			</div>
            <!--
             <div class="col-sm-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Card Info</h3>
					</div>
					<div class="panel-body">
					 <div class="form-group">
							<label for="cardType" class="col-sm-3 control-label">Name on the Card</label>
							<div class="col-sm-6">
								<input type="text" size="30" maxlength="10" name="firstName"
									required="required" placeholder="First Name" class="form-control">
							
								<input type="text" size="30" maxlength="10" name="lastName"
									required="required" placeholder="Last Name" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label for="cardType" class="col-sm-3 control-label">Credit Card Type</label>
							<div class="col-sm-6">
							
								<input type="text" size="30" maxlength="10" name="cardType"
									required="required" placeholder="Credit Card Type" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="cardNumber" class="col-sm-3 control-label">Credit Card Number</label>
							<div class="col-sm-6">
								<input type="text" size="16" name="cardNumber" required="required"
									placeholder="Credit Card Number" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="expDate" class="col-sm-3 control-label">Exp Date</label>
							<div class="col-sm-6">
								<input type="text" size="2" name="month" required="required"
									placeholder="Month" class="form-control">
									<input type="text" size="4" name="year" required="required"
									placeholder="Year" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="securityCode" class="col-sm-3 control-label">Security Code</label>
							<div class="col-sm-6">
								<input type="text" size="4" name="securityCode" required="required"
									placeholder="Security Code" class="form-control">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Billing Address</h3>
					</div>
					<div class="panel-body">

						<div class="form-group">
							<label for="street1" class="col-sm-3 control-label">Street</label>
							<div class="col-sm-6">
								<input type="text" size="30" maxlength="50" name="street"
									required="required" placeholder="Street" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="city" class="col-sm-3 control-label">City</label>
							<div class="col-sm-6">
								<input type="text" size="30" name="city" required="required"
									placeholder="City" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label for="state" class="col-sm-3 control-label">State :</label>
							<div class="col-sm-6">
								<input type="text" size="30" name="state" required="required"
									placeholder="State" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label for="zip" class="col-sm-3 control-label">Zip :</label>
							<div class="col-sm-6">
								<input type="text" size="10" name="zip" maxlength="10"
									required="required" placeholder="Ex.: xxxxx"
									pattern="^\d{5}(\-\d{4})?$" class="form-control">
							</div>
						</div>

						
					</div>
				</div>
             --> 
						</div>
			
			<div class="col-sm-2">
				<button type="button" class="btn btn-default"
					onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">
					Cancel</button>
			</div>
			
	</form>

</div>
<br />
<br />