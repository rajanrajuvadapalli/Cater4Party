<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_mexican_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		mexican_menu_items.splice($.inArray(data, mexican_menu_items), 1);
		divToRemove.remove();
	}

	function mexican_menu_submit() {
		if (mexican_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(mexican_menu_items);
		//console.log(JSON.stringify(mexican_menu_items));
		$("#mexican-menu-items").val(JSON.stringify(mexican_menu_items));
		$("#mexicantarget").submit();
	}
</script>

<!-- Page Canvas-->
<div id="page-canvas">
	<input type="hidden" id="refreshed" value="no">
	<!--Off Canvas Navigation-->
	<nav class="off-canvas-navigation">
		<header>Navigation</header>
		<div class="main-navigation navigation-off-canvas"></div>
	</nav>
	<!--end Off Canvas Navigation-->

	<!--Page Content-->
	<div id="page-content">
		<!--/.container-->
		<section id="image">
			<div class="container">
				<div class="col-md-8 col-md-offset-2">
					<div class="text-banner">
						<figure>
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/marker.png"
								alt="">
						</figure>
						<div class="description">
							<h2>Pick the desired Menu</h2>
							<p>Just click on each of the item to get them selected. Its
								as easy as that.</p>
						</div>
					</div>
				</div>
			</div>
			<!--/.container-->
			<div class="background">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/about-us-bg.jpg"
					alt="">
			</div>
			<!--/.background-->
		</section>

		<section class="container" style="padding-top: 50px;">
			<div class="">
				<!--Content-->
				<div class="">
					<h3>Click on the image below to build your items.</h3>
					<!--Listing Grid-->
					<section class="block equal-height col-md-6 col-xs-12">
						<div class="row">
							<c:forEach items="${menu.categories}" var="category"
								varStatus="loop">
								<c:forEach items="${category.items}" var="item">

									<div class="col-md-4 col-sm-3 col-xs-6">
										<div class="item" id="C${loop.index}">
											<div class="image">
												<a class="popup-with-form" href="#popup_${loop.index}">
													<div class="item-specific">
														<span class="name">${item.name}</span>
													</div>
													<div>
														<span hidden="hidden">${item.code}</span>
													</div> <img
													src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-s3bucket/images_menu/MEXICAN/${item.code}.jpg"
													alt="">
												</a>
											</div>
										</div>
										<!-- /.item-->
									</div>
								</c:forEach>
							</c:forEach>

							<div id="popup_0"
								class="mfp-hide white-popup-block mexicanPopupOptions col-xs-6 col-sm-4 col-md-6">
								<form id="popup_0" class="form-horizontal"
									onsubmit="return populateMexicanTacoBarSelectedItems();">
									<span id="mexican-popup-title"><h2>Taco Bar</h2></span>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Tortillas
											Count<span style="color: red">*</span>:
										</label>
										<div class="col-sm-6">
											<input type="text" size="20" name="tcount" maxlength="20"
												required="required" pattern="^\d+$" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Tortilla
											Type<span style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-6 col-md-6">
												<div class="input-group">
													<input type="radio" name="ttype" required="required"
														value="Corn"> Corn
												</div>
												<div class="input-group">
													<input type="radio" name="ttype" required="required"
														value="Flour"> Flour
												</div>
												<div class="input-group">
													<input type="radio" name="ttype" required="required"
														value="Half Corn & Half Flour"> Half Corn & Half
													Flour
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Choose
											servings<span style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-6">
												<div class="input-group">
													<input type="radio" name="tmeat" required="required"
														value="Chicken"> Chicken
												</div>
												<div class="input-group">
													<input type="radio" name="tmeat" required="required"
														value="Steak"> Steak
												</div>
												<div class="input-group">
													<input type="radio" name="tmeat" required="required"
														value="Grilled Shrimp"> Grilled Shrimp
												</div>
												<div class="input-group">
													<input type="radio" name="tmeat" required="required"
														value="Grilled Mahi Mahi"> Grilled Mahi Mahi
												</div>
												<div class="input-group">
													<input type="radio" name="tmeat" required="required"
														value="Grilled Salmon"> Grilled Salmon
												</div>
												<div class="input-group">
													<input type="radio" name="tmeat" required="required"
														value="Grilled Tilapia"> Grilled Tilapia
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Choose
											sides<span style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-6">
												<div class="input-group">
													<input type="radio" name="tsides" required="required"
														value="Black Beans"> Black Beans
												</div>
												<div class="input-group">
													<input type="radio" name="tsides" required="required"
														value="Citrus rice"> Citrus rice
												</div>
												<div class="input-group">
													<input type="radio" name="tsides" required="required"
														value="Mexican rice"> Mexican rice
												</div>
												<div class="input-group">
													<input type="radio" name="tsides" required="required"
														value="Pinto Beans"> Pinto Beans
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Choose
											salsa<span style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-6">
												<div class="input-group">
													<input type="radio" name="tsalsa" required="required"
														value="Mild salsa"> Mild salsa
												</div>
												<div class="input-group">
													<input type="radio" name="tsalsa" required="required"
														value="Chipotle Salsa"> Chipotle Salsa
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Choose
											Cheese<span style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-6">
												<div class="input-group">
													<input type="radio" name="tcheese" required="required"
														value="Light"> Light
												</div>
												<div class="input-group">
													<input type="radio" name="tcheese" required="required"
														value="Regular"> Regular
												</div>
												<div class="input-group">
													<input type="radio" name="tcheese" required="required"
														value="No cheese"> No cheese
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Toppings<span
											style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-6">
												<div class="input-group">
													<input type="radio" name="ttop" required="required"
														value="Lettuce"> Lettuce
												</div>
												<div class="input-group">
													<input type="radio" name="ttop" required="required"
														value="Sour Cream"> Sour Cream
												</div>
												<div class="input-group">
													<input type="radio" name="ttop" required="required"
														value="Guacamole"> Guacamole
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-4 control-label"></label>
										<div class="col-sm-2">
											<button type="submit"
												class="btn btn-default popup-modal-dismiss">Add</button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!--/.row-->
					</section>

					<section class="col-md-6 col-xs-12">
						<div class="col-md-12 col-sm-12">
							<section>
								<!-- /.block -->
								<article class="block">
									<header>
										<h2>Menu Summary</h2>
									</header>
									<div class="list-slider owl-carousel owl-theme owl-loaded">

										<!-- /.slide -->
										<div class="slide">
											<header>
												<h3>
													<i class="fa fa-calendar"></i>Selected Items
												</h3>
											</header>
											<c:forEach items="${mexican_items}" var="m" varStatus="loop">
												<div class="list-item" id="m_${loop.index}">
													<div class="left">
														<h4>${m.key}</h4>
														<figure>${m.value}</figure>
													</div>
													<span class="mexican-item-close remove-item"
														onclick="remove_mexican_item('m_${loop.index}');">X</span>
													<div class="right "></div>
												</div>
											</c:forEach>
										</div>
									</div>
									<!-- /.list-slider -->
								</article>
								<!-- /.block -->

							</section>
						</div>
						<div class="col-md-12 col-sm-12">
							<section>
								<div class="center">
									<figure class="note butnote">ONCE THE DESIRED MENU IS
										SELECTED, CLICK ON THE BUTTON BELOW TO SELECT THE RESTAURANTS
										TO REQUEST QUOTE FROM
									</figure>
								</div>
								<div class="form-group clearfix" style="text-align: center;">
									<form action="${pageContext.request.contextPath}/menu/saveMenu"
										id="mexicantarget" method="post">
										<input type="hidden" name="mexican_menu_items"
											id="mexican-menu-items"> <input type="hidden"
											name="cuisineType" value="${menu.cuisine}">
										<textarea rows="4" cols="50" name="comments"
											placeholder="Enter you comments to restaurant here"
											class="form-control">${menu.comments}</textarea>
										<br />
										<button type="button" onclick="mexican_menu_submit();"
											class="btn btn-default">Select Restaurants</button>
									</form>
								</div>

							</section>
						</div>
					</section>
					<!--end Listing Grid-->
				</div>
			</div>
		</section>
	</div>
	<!-- end Page Content-->
</div>
<!-- end Page Canvas-->

<script>
	$(window).load(function() {
		var rtl = false; // Use RTL
		initializeOwl(rtl);
		//Show only the first category when the window loads.
		//$('#C0').click();
		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
		//When the user clicks back button, force reload page.
		/*var e = document.getElementById("refreshed");
		if (e.value == "no")
			e.value = "yes";
		else {
			e.value = "no";
			location.reload();
		}*/
	});

	$('document').ready(function() {
		$('.slide .list-item .left').each(function() {
			var mexicanName = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			console.log("Title: " + mexicanName);
			console.log("Desc: " + desc);
			mexican_menu_items.push(mexicanName + "+" + desc); //mexican_menu_items is in cater-mexican.js
		});

		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
	});
</script>
