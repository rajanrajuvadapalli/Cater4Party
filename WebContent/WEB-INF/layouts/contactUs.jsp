<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Contact Us</h1>
</div>

<div class="col-sm-10 col-sm-offset-1">
	<c:if test="${not empty errors}">
		<div class="alert alert-danger">
			<ul>
				<c:forEach items="${errors}" var="e">
					<li>${e}</li>
				</c:forEach>
			</ul>

		</div>
	</c:if>

	<c:if test="${not empty successMessages}">
		<div class="alert alert-success">
			<ul>
				<c:forEach items="${successMessages}" var="sm">
					<li>${sm}</li>
				</c:forEach>
			</ul>

		</div>
	</c:if>

	<c:if test="${not empty warnings}">
		<div class="alert alert-warning">
			<ul>
				<c:forEach items="${warnings}" var="w">
					<li>${w}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</div>

<div class="col-sm-10 col-sm-offset-1 ">
	<div class="col-sm-5">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">Head Quarters</h3>
			</div>
			<div class="panel-body">
				3466 Data Dr. 1222, <br />Rancho Cordova, <br />CA 95670
			</div>
		</div>
	</div>
	<div class="col-sm-5">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Customer Service</h3>
			</div>
			<div class="panel-body">
				Hours: Monday to Sunday - 9am to 5pm PST <br /> <br /> <img
					src="${pageContext.request.contextPath}/resources/images/phone-logo.jpg"
					width="35px"> Phone : 1-916-693-4547 <br /> <img
					src="${pageContext.request.contextPath}/resources/images/message-logo.jpg"
					width="40px"> Message: 1-916-693-4547 <br /> <img
					src="${pageContext.request.contextPath}/resources/images/whatsapp-logo.jpg"
					width="40px"> Whatsapp : 1-916-693-4547
			</div>
		</div>
	</div>



	<div class="col-sm-10">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h3 class="panel-title">Email</h3>
			</div>
			<div class="panel-body" style="font-size: 18px;">
				<form class="form-horizontal" method="POST" id="contactUsForm"
					action="${pageContext.request.contextPath}/contactUs"
					enctype="application/x-www-form-urlencoded" autocomplete="off">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Name: </label>
						<div class="col-sm-8" style="font-family: courier;">
							<input type="text" id="name" name="name" required="required"
								class="form-control" style="font-size: 18px;">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">Email: </label>
						<div class="col-sm-8" style="font-family: courier;">
							<input type="email" id="email" name="email" required="required"
								class="form-control" style="font-size: 18px;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">To: </label> <span
							class="col-sm-8 text-muted" align="left">${infoEmail} </span>
					</div>
					<div class="form-group">
						<label for="subject" class="col-sm-2 control-label">Subject:
						</label>
						<div class="col-sm-8" style="font-family: courier;">
							<input type="text" id="subject" name="subject"
								required="required" class="form-control"
								style="font-size: 18px;">
						</div>
					</div>
					<div class="form-group">
						<label for="message" class="col-sm-2 control-label">Message:
						</label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="6" id="message"
								name="message" required="required"
								style="font-family: courier; font-size: 18px;"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> </label>
						<div class="col-sm-6" align="left">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>