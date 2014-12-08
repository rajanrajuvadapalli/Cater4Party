$('document')
		.ready(
				function() {
					$("td[id=customerDashboardData]")
							.html(
									"<div class=\"sideMenuItemsDetail\">Please select from options to your left.</div>");
				});

function listCustomerEvents() {
	// Make an ajax call and get list of events
	var element = $("td[id=customerDashboardData]");
	element.html("<div class=\"sideMenuItemsDetail\">Fetching data...</div>");
	$.ajax({
		url : "/cater4party/customer/listEvents",
		type : "GET",
		context : document.body,
		success : function(response) {
			//console.log(response);
			element.html(response);
		},
		error : function(xhr, status, error) {
			element.html("<div class=\"sideMenuItemsDetail\">Status:" + status
					+ ", <br>Error:" + error + "</div>");
		}
	});
}