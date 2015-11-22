<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>My Dashboard</h1>
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
</div>

<div class="col-sm-10 col-sm-offset-1">
	<!-- Guest cannot create an event on the dashboard, if there is already 1 event -->
	<c:if test="${!sessionScope.user.isGuest() or empty events}">
		<div align="right">
			<a href="${pageContext.request.contextPath}/customer/createEvent"
				role="button" class="btn btn-default"> Create Event</a>
		</div>
	</c:if>
	<br />
	<c:choose>
		<c:when test="${empty events}">
		Welcome to your dashboard. <br>
			<br>
		Looks like this is your first time here.<br>
			<br>
		To get started, click on the "Create Event" button on the top.
				</c:when>
		<c:otherwise>
			<div class="table-responsive">
				<table class="table table-striped table-bordered">
					<tr class="warning">
						<th class="col-sm-2">Event Name</th>
						<th class="col-sm-2"><span
							class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
							Date/Time</th>
						<th class="col-sm-2"><span
							class="glyphicon glyphicon-map-marker"></span> Location</th>
						<th class="col-sm-2">Quote(s)</th>
						<th class="col-sm-2"><span
							class="glyphicon glyphicon-cutlery"></span> Menu(s)</th>
					</tr>
					<c:forEach items="${events}" var="e">
						<tr>
							<td>${e.name}<br />(${e.personCount} adults, ${e.kidsCount}
								kids)<br /> <c:if test="${e.status eq 'ACTIVE'}">
									<a
										href="${pageContext.request.contextPath}/customer/event/edit/${e.id}">
										<span class="glyphicon glyphicon-edit"></span> Edit
									</a>
								</c:if></td>
							<td><fmt:formatDate value="${e.date_time}"
									pattern="EEE, d MMM yyyy hh:mm aaa" /></td>
							<td>${e.location.street1}${e.location.street2},
								${e.location.city}, ${e.location.state} - ${e.location.zip}</td>
							<td><c:choose>
									<c:when test="${empty e2m.get(e.id)}">Please select a menu and create your request.</c:when>
									<c:when test="${empty e2q.get(e.id)}">	0 restaurants have responded to your request.
										</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${e.status eq 'ACTIVE'}">
												<form class="form-horizontal" method="POST"
													id="order-confirm-form"
													action="${pageContext.request.contextPath}/customer/orderConfirmation"
													enctype="application/x-www-form-urlencoded"
													autocomplete="off">
													<input type="hidden" name="xeventId" value="${e.id}">
													<input type="hidden" name="xquoteId" value="">
													<c:forEach items="${e2q.get(e.id)}" var="q2c">
														<c:if test="${not empty q2c}">
															<div>
																<div class="panel panel-info">
																	<div class="panel-heading">
																		<h3 class="panel-title">${q2c.key}</h3>
																	</div>
																	<div class="panel-body">
																		<div>
																			<input type="hidden" name="xcuisineType"
																				value="${cuisine}">
																			<c:forEach items="${q2c.value}" var="q">
																				<div>
																					<label><input type="radio"
																						value="${q.restaurant.id}" required="required"
																						data-quote-id="${q.id}" name="restaurantName">
																						${q.restaurant.name} <c:if
																							test="${not empty q.price}">
																						</c:if></label>
																				</div>
																				<c:choose>
																					<c:when test="${empty q.price}">Not responded</c:when>
																					<c:otherwise>
																						<fmt:setLocale value="en_US" />
																						<b><fmt:formatNumber value="${q.price}"
																								type="currency" /></b>
																						<c:choose>
																							<c:when test="${q.canDeliver()}">
																								<span style="color: green">FREE delivery</span>
																							</c:when>
																							<c:otherwise>
																								<span style="color: red">NO delivery</span>
																							</c:otherwise>
																						</c:choose>
																					</c:otherwise>
																				</c:choose>
																				<br>
																			</c:forEach>
																		</div>
																	</div>
																</div>
															</div>
														</c:if>
													</c:forEach>
													<class="col-sm-2">
													<button type="submit" width="50px" class="btn btn-default">Confirm
														Order</button>
												</form>
											</c:when>
											<c:otherwise>
												<c:forEach items="${e2q.get(e.id)}" var="q2c">
													<c:forEach items="${q2c.value}" var="q">
														<c:if test="${ (q.status eq 'APPROVED') || (q.status eq 'PAID') }">
															<b>${q.restaurant.name}:</b> &nbsp;
																<fmt:setLocale value="en_US" />
															<a
																href="${pageContext.request.contextPath}/menu/view/${q.menu.id}"><b><fmt:formatNumber
																		value="${q.price}" type="currency" /></b></a>
														   <c:choose>
														     <c:when test = "${ q.status eq 'PAID'}">
														     <label  style="color: green">Paid</label>
														       
														     </c:when>
														     <c:otherwise>
														     <label  style="color: green">Order confirmed, pay at restaurant!</label>
														     </c:otherwise>
														   </c:choose>
														</c:if>
													</c:forEach>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose></td>
							<td><c:if test="${e.status eq 'ACTIVE'}">
									<c:if test="${not empty e2m.get(e.id)}">
										<c:forEach items="${e2m.get(e.id)}" var="cuisine"
											varStatus="loop">
											<a
												href="${pageContext.request.contextPath}/menu/view/all?eventId=${e.id}">${cuisine}</a>
											<br />
										</c:forEach>
										<hr>
									</c:if>
									<a class="popup-with-form" href="#${e.id}"><span
										class="glyphicon glyphicon-plus" aria-hidden="true"></span>
										Add Menu</a>
									<form class=" mfp-hide white-popup-block popupOptions"
										method="GET" id="${e.id}"
										action="${pageContext.request.contextPath}/menu/selectMenu"
										<%-- onsubmit="return validateCuisine(${e.id});" --%>
										enctype="application/x-www-form-urlencoded">
										<br /> <input type="text" hidden="true" name="eventId"
											value="${e.id}"> <span id="cuisineType"></span><br />
										<button type="submit" class="btn btn-default">Select
											Menu</button>
									</form>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<script>
	$('document').ready(function() {
		populateCuisineTypes();
		$('[data-toggle="tooltip"]').tooltip();
	});
	// Bind the 'onClick' event for the 'restaurantName' input field
	$('input[name=restaurantName]').on('click', function(e) {
		var $restaurantNameInputField = $(this);
		var $containerForm = $restaurantNameInputField.closest('form');
		var quoteId = $restaurantNameInputField.data('quote-id');
		$containerForm.find('input[name=xquoteId]').val(quoteId);
	});
</script>