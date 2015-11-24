<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_pizza_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var pizzaName = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = pizzaName + "+" + desc;
		console.log("Removing " + data);
		pizza_menu_items.splice($.inArray(data, pizza_menu_items), 1);
		divToRemove.remove();
	}

	function pizza_menu_submit() {
		if (pizza_menu_items.length == 0) {
			alert("Please select at least 1 pizza to proceed.");
			return false;
		}
		console.log(pizza_menu_items);
		//console.log(JSON.stringify(pizza_menu_items));
		$("#pizza-menu-items").val(JSON.stringify(pizza_menu_items));
		$("#pizzatarget").submit();
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
					<h3>Click on the image below to customize your pizza.</h3>
					<!--Listing Grid-->
					<section class="block equal-height col-md-6 col-xs-12">
						<div class="row">
							<c:forEach items="${menu.categories}" var="category">
								<c:forEach items="${category.items}" var="item" varStatus="loop">

									<div class="col-md-4 col-sm-3 col-xs-6">
										<div class="item" id="C${loop.index}">
											<div class="image">
												<a class="popup-with-form" id="put-pizza-title"
													href="#popup_${loop.index}">
													<div class="item-specific">
														<span class="name">${item.name}</span>
													</div>
													<div>
														<span hidden="hidden">${item.code}</span>
													</div> <img
													src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-s3bucket/images_menu/PIZZA/${item.code}.jpg"
													alt="">
												</a>
											</div>
										</div>
										<!-- /.item-->
									</div>
								</c:forEach>
							</c:forEach>
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
											<c:forEach items="${pizza_items}" var="pi" varStatus="loop">
												<div class="list-item" id="p_${loop.index}">
													<div class="left">
														<c:choose>
															<c:when test="${pi.key.contains('#')}">
																<h4>${fn:substringBefore(pi.key, ' #')}</h4>
															</c:when>
															<c:otherwise>
																<h4>${pi.key}</h4>
															</c:otherwise>
														</c:choose>
														<figure>${pi.value}</figure>
													</div>
													<span class="pizza-item-close remove-item"
														onclick="remove_pizza_item('p_${loop.index}');">X</span>
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
										id="pizzatarget" method="post">
										<input type="hidden" name="pizza_menu_items"
											id="pizza-menu-items"> <input type="hidden"
											name="cuisineType" value="${menu.cuisine}">
										<textarea rows="4" cols="50" name="comments"
											placeholder="Enter you comments to restaurant here"
											class="form-control">${menu.comments}</textarea>
										<br />
										<button type="button" onclick="pizza_menu_submit();"
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

<div id="popup_0"
	class="mfp-hide white-popup-block pizzaPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="cpoptions" class="form-horizontal"
		onsubmit="return populateChickenPizzaSelectedItems();">
		<span id="pizza-popup-title"><h2>Chicken Pizza</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Pizza size<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<div class="input-group">
					<input type="radio" name="cpsize" required="required" value="Large">
					Large &nbsp;&nbsp;
				</div>
				<div class="input-group">
					<input type="radio" name="cpsize" required="required"
						value="Medium"> Medium &nbsp;&nbsp;
				</div>
				<div class="input-group">
					<input type="radio" name="cpsize" required="required" value="Small">
					Small
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Number of pizzas<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-2">
				<input type="text" size="5" name="cpcount" maxlength="5"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Sause<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="radio" name="cpsause" required="required"
							value="Tomato"> Tomato sauce
					</div>
					<div class="input-group">
						<input type="radio" name="cpsause" required="required"
							value="Garlic parmesan white sause"> Garlic Parmesan
						White Sauce
					</div>
					<div class="input-group">
						<input type="radio" name="cpsause" required="required" value="BBQ">
						BBQ Sauce
					</div>
					<div class="input-group">
						<input type="radio" name="cpsause" required="required"
							value="Buffalo"> Buffalo Sauce
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="cpcheese" required="required" value="No">
						No Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="cpcheese" required="required"
							value="Regular"> Regular
					</div>
					<div class="input-group">
						<input type="radio" name="cpcheese" required="required"
							value="Extra cheese"> Extra cheese
					</div>
				</div>
			</div>
		</div>
		<div class="form-group" id="toppings">
			<label for="" class="col-sm-4 control-label">Toppings:</label>
			<!-- Column #1 START-->
			<div class="col-xs-6 col-sm-4 col-md-6">
				<div>
					&nbsp;&nbsp;&nbsp;<u>Meat</u>
				</div>
				<div class="input-group">
					&nbsp;&nbsp;&nbsp;<img alt="L"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="R"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="A"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">
				</div>
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Pepporoni</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Bacon</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Italian&nbsp;Sausage</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Beef</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-L" class="cptoppings"
							disabled="disabled">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-R" class="cptoppings"
							disabled="disabled">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-A" class="cptoppings"
							checked="checked" disabled="disabled">
					</div>
					<div class="col-xs-1">Chicken</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Salami</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<br />
				<div>
					&nbsp;&nbsp;&nbsp;<u>Veggies</u>
				</div>
				<div class="input-group">
					&nbsp;&nbsp;&nbsp;<img alt="L"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="R"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="A"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">

				</div>
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Mushrooms</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Onions</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-L"
							class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-R"
							class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-A"
							class="cptoppings">
					</div>
					<div class="col-xs-1">Jalepeno&nbsp;Peppers</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Green&nbsp;Peppers</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Pineapple</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Spinach</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Diced&nbsp;Tomatoes</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Olives</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-L" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-R" class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-A" class="cptoppings">
					</div>
					<div class="col-xs-1">Garlic</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-L"
							class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-R"
							class="cptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-A"
							class="cptoppings">
					</div>
					<div class="col-xs-1">Artichoke&nbsp;Hearts</div>
					<br />
				</div>
				<!-- Ingredient END -->
			</div>

		</div>
		<!-- Ingredients Form group END -->

		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="cpspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add
					this pizza</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_1"
	class="mfp-hide white-popup-block pizzaPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="ppoptions" class="form-horizontal"
		onsubmit="return populatePepperoniPizzaSelectedItems();">
		<span id="pizza-popup-title"><h2>Pepperoni Pizza</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Pizza size<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<div class="input-group">
					<input type="radio" name="ppsize" required="required" value="Large">
					Large &nbsp;&nbsp;
				</div>
				<div class="input-group">
					<input type="radio" name="ppsize" required="required"
						value="Medium"> Medium &nbsp;&nbsp;
				</div>
				<div class="input-group">
					<input type="radio" name="ppsize" required="required" value="Small">
					Small
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Number of pizzas<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-2">
				<input type="text" size="5" name="ppcount" maxlength="5"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Sause<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="radio" name="ppsause" required="required"
							value="Tomato"> Tomato sauce
					</div>
					<div class="input-group">
						<input type="radio" name="ppsause" required="required"
							value="Garlic parmesan white sause"> Garlic Parmesan
						White Sauce
					</div>
					<div class="input-group">
						<input type="radio" name="ppsause" required="required" value="BBQ">
						BBQ Sauce
					</div>
					<div class="input-group">
						<input type="radio" name="ppsause" required="required"
							value="Buffalo"> Buffalo Sauce
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ppcheese" required="required" value="No">
						No Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="ppcheese" required="required"
							value="Regular"> Regular
					</div>
					<div class="input-group">
						<input type="radio" name="ppcheese" required="required"
							value="Extra cheese"> Extra cheese
					</div>
				</div>
			</div>
		</div>
		<div class="form-group" id="toppings">
			<label for="" class="col-sm-4 control-label">Toppings:</label>
			<!-- Column #1 START-->
			<div class="col-xs-6 col-sm-4 col-md-6">
				<div>
					&nbsp;&nbsp;&nbsp;<u>Meat</u>
				</div>
				<div class="input-group">
					&nbsp;&nbsp;&nbsp;<img alt="L"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="R"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="A"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">
				</div>
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-L" class="pptoppings"
							disabled="disabled">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-R" class="pptoppings"
							disabled="disabled">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-A" class="pptoppings"
							checked="checked" disabled="disabled">
					</div>
					<div class="col-xs-1">Pepporoni</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Bacon</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Italian&nbsp;Sausage</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Beef</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Chicken</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Salami</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<br />
				<div>
					&nbsp;&nbsp;&nbsp;<u>Veggies</u>
				</div>
				<div class="input-group">
					&nbsp;&nbsp;&nbsp;<img alt="L"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="R"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="A"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">

				</div>
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Mushrooms</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Onions</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-L"
							class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-R"
							class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-A"
							class="pptoppings">
					</div>
					<div class="col-xs-1">Jalepeno&nbsp;Peppers</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Green&nbsp;Peppers</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Pineapple</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Spinach</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Diced&nbsp;Tomatoes</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Olives</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-L" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-R" class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-A" class="pptoppings">
					</div>
					<div class="col-xs-1">Garlic</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-L"
							class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-R"
							class="pptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-A"
							class="pptoppings">
					</div>
					<div class="col-xs-1">Artichoke&nbsp;Hearts</div>
					<br />
				</div>
				<!-- Ingredient END -->
			</div>

		</div>
		<!-- Ingredients Form group END -->

		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="ppspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add
					this pizza</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_2"
	class="mfp-hide white-popup-block pizzaPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="vpoptions" class="form-horizontal"
		onsubmit="return populateVeggiePizzaSelectedItems();">
		<span id="pizza-popup-title"><h2>Veggie Pizza</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Pizza size<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<div class="input-group">
					<input type="radio" name="vpsize" required="required" value="Large">
					Large &nbsp;&nbsp;
				</div>
				<div class="input-group">
					<input type="radio" name="vpsize" required="required"
						value="Medium"> Medium &nbsp;&nbsp;
				</div>
				<div class="input-group">
					<input type="radio" name="vpsize" required="required" value="Small">
					Small
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Number of pizzas<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-2">
				<input type="text" size="5" name="vpcount" maxlength="5"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Sause<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="radio" name="vpsause" required="required"
							value="Tomato"> Tomato sauce
					</div>
					<div class="input-group">
						<input type="radio" name="vpsause" required="required"
							value="Garlic parmesan white sause"> Garlic Parmesan
						White Sauce
					</div>
					<div class="input-group">
						<input type="radio" name="vpsause" required="required" value="BBQ">
						BBQ Sauce
					</div>
					<div class="input-group">
						<input type="radio" name="vpsause" required="required"
							value="Buffalo"> Buffalo Sauce
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="vpcheese" required="required" value="No">
						No Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="vpcheese" required="required"
							value="Regular"> Regular
					</div>
					<div class="input-group">
						<input type="radio" name="vpcheese" required="required"
							value="Extra cheese"> Extra cheese
					</div>
				</div>
			</div>
		</div>
		<div class="form-group" id="toppings">
			<label for="" class="col-sm-4 control-label">Toppings:</label>
			<!-- Column #1 START-->
			<div class="col-xs-6 col-sm-4 col-md-6">
				<div class="input-group">
					&nbsp;&nbsp;&nbsp;<img alt="L"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="R"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="A"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">

				</div>
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-L" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-R" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-A" class="vptoppings">
					</div>
					<div class="col-xs-1">Mushrooms</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-L" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-R" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-A" class="vptoppings">
					</div>
					<div class="col-xs-1">Onions</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-L"
							class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-R"
							class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-A"
							class="vptoppings">
					</div>
					<div class="col-xs-1">Jalepeno&nbsp;Peppers</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-L" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-R" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-A" class="vptoppings">
					</div>
					<div class="col-xs-1">Green&nbsp;Peppers</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-L" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-R" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-A" class="vptoppings">
					</div>
					<div class="col-xs-1">Pineapple</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-L" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-R" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-A" class="vptoppings">
					</div>
					<div class="col-xs-1">Spinach</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-L" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-R" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-A" class="vptoppings">
					</div>
					<div class="col-xs-1">Diced&nbsp;Tomatoes</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-L" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-R" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-A" class="vptoppings">
					</div>
					<div class="col-xs-1">Olives</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-L" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-R" class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-A" class="vptoppings">
					</div>
					<div class="col-xs-1">Garlic</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-L"
							class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-R"
							class="vptoppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-A"
							class="vptoppings">
					</div>
					<div class="col-xs-1">Artichoke&nbsp;Hearts</div>
					<br />
				</div>
				<!-- Ingredient END -->
			</div>

		</div>
		<!-- Ingredients Form group END -->

		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="ppspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add
					this pizza</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_3"
	class="mfp-hide white-popup-block pizzaPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="options" class="form-horizontal"
		onsubmit="return populatePizzaSelectedItems();">
		<!-- <span id="pizza-popup-title"> </span> <input type="hidden"
										id="pizzaName" val=""> -->
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Pizza name<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="pname" maxlength="20"
					required="required" class="form-control"
					style="text-transform: uppercase;">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Pizza size<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<div class="input-group">
					<input type="radio" name="psize" required="required" value="Large">
					Large &nbsp;&nbsp;
				</div>
				<div class="input-group">
					<input type="radio" name="psize" required="required" value="Medium">
					Medium &nbsp;&nbsp;
				</div>
				<div class="input-group">
					<input type="radio" name="psize" required="required" value="Small">
					Small
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Number of pizzas<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-2">
				<input type="text" size="5" name="pcount" maxlength="5"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Sause<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="radio" name="psause" required="required"
							value="Tomato"> Tomato sauce
					</div>
					<div class="input-group">
						<input type="radio" name="psause" required="required"
							value="Garlic parmesan white sause"> Garlic Parmesan
						White Sauce
					</div>
					<div class="input-group">
						<input type="radio" name="psause" required="required" value="BBQ">
						BBQ Sauce
					</div>
					<div class="input-group">
						<input type="radio" name="psause" required="required"
							value="Buffalo"> Buffalo Sauce
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="pcheese" required="required" value="No">
						No Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="pcheese" required="required"
							value="Regular"> Regular
					</div>
					<div class="input-group">
						<input type="radio" name="pcheese" required="required"
							value="Extra cheese"> Extra cheese
					</div>
				</div>
			</div>
		</div>
		<div class="form-group" id="toppings">
			<label for="" class="col-sm-4 control-label">Toppings:</label>
			<!-- Column #1 START-->
			<div class="col-xs-6 col-sm-4 col-md-6">
				<div>
					&nbsp;&nbsp;&nbsp;<u>Meat</u>
				</div>
				<div class="input-group">
					&nbsp;&nbsp;&nbsp;<img alt="L"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="R"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="A"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">
				</div>
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pepperoni-A" class="toppings">
					</div>
					<div class="col-xs-1">Pepporoni</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Bacon-A" class="toppings">
					</div>
					<div class="col-xs-1">Bacon</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ItalianSausage-A" class="toppings">
					</div>
					<div class="col-xs-1">Italian&nbsp;Sausage</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Beef-A" class="toppings">
					</div>
					<div class="col-xs-1">Beef</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Chicken-A" class="toppings">
					</div>
					<div class="col-xs-1">Chicken</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Salami-A" class="toppings">
					</div>
					<div class="col-xs-1">Salami</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<br />
				<div>
					&nbsp;&nbsp;&nbsp;<u>Veggies</u>
				</div>
				<div class="input-group">
					&nbsp;&nbsp;&nbsp;<img alt="L"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="R"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
					&nbsp;&nbsp;&nbsp;<img alt="A"
						src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">

				</div>
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Mushrooms-A" class="toppings">
					</div>
					<div class="col-xs-1">Mushrooms</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Onions-A" class="toppings">
					</div>
					<div class="col-xs-1">Onions</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="JalepenoPeppers-A" class="toppings">
					</div>
					<div class="col-xs-1">Jalepeno&nbsp;Peppers</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="GreenPeppers-A" class="toppings">
					</div>
					<div class="col-xs-1">Green&nbsp;Peppers</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Pineapple-A" class="toppings">
					</div>
					<div class="col-xs-1">Pineapple</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Spinach-A" class="toppings">
					</div>
					<div class="col-xs-1">Spinach</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="DicedTomatoes-A" class="toppings">
					</div>
					<div class="col-xs-1">Diced&nbsp;Tomatoes</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Olives-A" class="toppings">
					</div>
					<div class="col-xs-1">Olives</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="Garlic-A" class="toppings">
					</div>
					<div class="col-xs-1">Garlic</div>
					<br />
				</div>
				<!-- Ingredient END -->
				<!-- Ingredient START -->
				<div class="input-group">
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-L" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-R" class="toppings">
					</div>
					<div class="col-xs-1">
						<input type="checkbox" value="ArtichokeHearts-A" class="toppings">
					</div>
					<div class="col-xs-1">Artichoke&nbsp;Hearts</div>
					<br />
				</div>
				<!-- Ingredient END -->
			</div>

		</div>
		<!-- Ingredients Form group END -->

		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="spl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add
					this pizza</button>
			</div>
		</div>
	</form>
</div>

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
			var pizzaName = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			//console.log("Title: "+ pizzaName);
			//console.log("Desc: "+ desc);
			pizza_menu_items.push(pizzaName + "+" + desc); //pizza_menu_items is in cater-request.js
		});

		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
	});
</script>
