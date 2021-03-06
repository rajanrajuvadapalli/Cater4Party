$('document').ready(function() {
	$('.popup-with-form').magnificPopup({
		type : 'inline',
		fixedContentPos : false,
		fixedBgPos : true,
		overflowY : 'auto',
		closeBtnInside : true,
		midClick : true,
		preloader : false,
		removalDelay : 300,
		mainClass : 'my-mfp-zoom-in'
	});
	$('.popup-with-form-modal').magnificPopup({
		type : 'inline',
		fixedContentPos : false,
		fixedBgPos : true,
		overflowY : 'auto',
		modal : true,
		midClick : true,
		preloader : false,
		removalDelay : 300,
		mainClass : 'my-mfp-zoom-in'
	});
});

function populateCuisineTypesDrowpdown() {
	$("span[id=cuisineType]")
			.replaceWith(
					"<select class=\"form-control inputs\" name=\"cuisineType\" id=\"cuisineType\">"
							+ " <option value=\"\" disabled selected>Select Cuisine Type</option> "
							+ "	<option value=\"INDIAN_SOUTH\">	INDIAN (SOUTH) </option>"
							+ "	<option value=\"INDIAN_NORTH\">	INDIAN (NORTH) </option>"
							+ "	<option value=\"PIZZA\"> PIZZA </option>"
							+ " <option value=\"MEXICAN\"> MEXICAN </option>"
							+ " <option value=\"THAI\"> THAI </option> "
							+ " <option value=\"SANDWICH\"> SANDWICH </option> "
							+ " <option value=\"MIDDLE_EASTERN\"> MIDDLE EASTERN </option> "
							+ "</select>");
}

function populateCuisineTypesCheckbox() {
	$("span[id=cuisineType_sec]")
			.replaceWith(
					"<label style=\"cursor:hand;\"><input type=\"checkbox\" name=\"cuisineType_sec\" value=\"INDIAN_SOUTH\"> INDIAN (SOUTH) </label>"
							+ "<label style=\"cursor:hand;\"><input type=\"checkbox\" name=\"cuisineType_sec\" value=\"INDIAN_NORTH\"> INDIAN (NORTH) </label>"
							+ "<label style=\"cursor:hand;\"><input type=\"checkbox\" name=\"cuisineType_sec\" value=\"PIZZA\"> PIZZA </label>"
							+ "<label style=\"cursor:hand;\"><input type=\"checkbox\" name=\"cuisineType_sec\" value=\"MEXICAN\"> MEXICAN </label>"
							+ "<label style=\"cursor:hand;\"><input type=\"checkbox\" name=\"cuisineType_sec\" value=\"THAI\"> THAI </label>"
							+ "<label style=\"cursor:hand;\"><input type=\"checkbox\" name=\"cuisineType_sec\" value=\"SANDWICH\"> SANDWICH </label>"
							+ "<label style=\"cursor:hand;\"><input type=\"checkbox\" name=\"cuisineType_sec\" value=\"MIDDLE_EASTERN\"> MIDDLE EASTERN </label>");
}

function populateHearAboutUs() {
	$("span[id=hearAboutUs]")
			.replaceWith(
					"<select class=\"form-control inputs\" name=\"hearAboutUs\""
							+ "id=\"hearAboutUs\" required=\"required\">"
							+ "<option value=\"\" selected=\"selected\">Choose one...</option>"
							+ "<option value=\"family_friend\">Family or Friend</option>"
							+ "<option value=\"google\">Google Search</option>"
							+ "<option value=\"online_ad\">Online advertisement</option>"
							+ "<option value=\"ad\">Advertisement</option>"
							+ "<option value=\"fb\">Facebook</option>"
							+ "<option value=\"twitter\">Twitter</option>"
							+ "<option value=\"yt\">Youtube</option>"
							+ "<option value=\"social_media\">Social Media</option>"
							+ "<option value=\"restaurant\">Restaurant</option>"
							+ "</select>");
}

function populateAptSuite() {
	$("span[id=apt_classifier]").replaceWith(
			"<select class=\"form-control inputs\" name=\"apt_classifier\""
					+ "id=\"apt_classifier\">" + "<option value=\"\"></option>"
					+ "<option value=\"Apt\">Apartment</option>"
					+ "<option value=\"Building\">Building</option>"
					+ "<option value=\"Suite\">Suite</option>" + "</select>");
}

function populateDeliveryOption() {
	$("span[id=deliveryOption]")
			.replaceWith(
					"<select class=\"form-control inputs\" name=\"deliveryOption\""
							+ "id=\"deliveryOption\">"
							+ "<option value=\"\" selected=\"selected\">Choose one...</option>"
							+ "<option value=\"1\">Pick Up</option>"
							+ "<option value=\"2\">Delivered</option>"
							+ "</select>");
}

function populateStateDropDown() {
	var json_states = '[{"name": "Alabama","abbreviation": "AL"},{"name": "Alaska","abbreviation": "AK"},{"name": "American Samoa","abbreviation": "AS"},{"name": "Arizona","abbreviation": "AZ"},{"name": "Arkansas","abbreviation": "AR"},{"name": "California","abbreviation": "CA"},{"name": "Colorado","abbreviation": "CO"},{"name": "Connecticut","abbreviation": "CT"},{"name": "Delaware","abbreviation": "DE"},{"name": "District Of Columbia","abbreviation": "DC"},{"name": "Federated States Of Micronesia","abbreviation": "FM"},{"name": "Florida","abbreviation": "FL"},{"name": "Georgia","abbreviation": "GA"},{"name": "Guam","abbreviation": "GU"},{"name": "Hawaii","abbreviation": "HI"},{"name": "Idaho","abbreviation": "ID"},{"name": "Illinois","abbreviation": "IL"},{"name": "Indiana","abbreviation": "IN"},{"name": "Iowa","abbreviation": "IA"},{"name": "Kansas","abbreviation": "KS"},{"name": "Kentucky","abbreviation": "KY"},{"name": "Louisiana","abbreviation": "LA"},{"name": "Maine","abbreviation": "ME"},{"name": "Marshall Islands","abbreviation": "MH"},{"name": "Maryland","abbreviation": "MD"},{"name": "Massachusetts","abbreviation": "MA"},{"name": "Michigan","abbreviation": "MI"},{"name": "Minnesota","abbreviation": "MN"},{"name": "Mississippi","abbreviation": "MS"},{"name": "Missouri","abbreviation": "MO"},{"name": "Montana","abbreviation": "MT"},{"name": "Nebraska","abbreviation": "NE"},{"name": "Nevada","abbreviation": "NV"},{"name": "New Hampshire","abbreviation": "NH"},{"name": "New Jersey","abbreviation": "NJ"},{"name": "New Mexico","abbreviation": "NM"},{"name": "New York","abbreviation": "NY"},{"name": "North Carolina","abbreviation": "NC"},{"name": "North Dakota","abbreviation": "ND"},{"name": "Northern Mariana Islands","abbreviation": "MP"},{"name": "Ohio","abbreviation": "OH"},{"name": "Oklahoma","abbreviation": "OK"},{"name": "Oregon","abbreviation": "OR"},{"name": "Palau","abbreviation": "PW"},{"name": "Pennsylvania","abbreviation": "PA"},{"name": "Puerto Rico","abbreviation": "PR"},{"name": "Rhode Island","abbreviation": "RI"},{"name": "South Carolina","abbreviation": "SC"},{"name": "South Dakota","abbreviation": "SD"},{"name": "Tennessee","abbreviation": "TN"},{"name": "Texas","abbreviation": "TX"},{"name": "Utah","abbreviation": "UT"},{"name": "Vermont","abbreviation": "VT"},{"name": "Virgin Islands","abbreviation": "VI"},{"name": "Virginia","abbreviation": "VA"},{"name": "Washington","abbreviation": "WA"},{"name": "West Virginia","abbreviation": "WV"},{"name": "Wisconsin","abbreviation": "WI"},{"name": "Wyoming","abbreviation": "WY"}]';
	obj = $.parseJSON(json_states);
	var stateDiv = $("span[id=stateArea]");
	var selectNode = $("<select/>").attr('name', 'state').attr('id', 'state')
			.attr('required', 'true').attr('class', 'form-control inputs')
			.appendTo(stateDiv);
	$("<option />", {
		value : '',
		text : ''
	}).appendTo(selectNode);
	for (var i = 0; i < obj.length; i++) {
		$("<option />", {
			value : obj[i].abbreviation,
			text : obj[i].name
		}).appendTo(selectNode);
	}
}

function validateRegistrationFormOnSubmit() {
	var customerName = $("input[name=name]");
	if (customerName.val() != null && customerName.val().length > 0
			&& customerName.val().length < 4) {
		alert("Name must at least be 4 characters");
		customerName.focus();
		return false;
	}
	var restaurantName = $("input[name=restaurantName]");
	if (restaurantName.val() != null && restaurantName.val().length > 0
			&& restaurantName.val().length < 4) {
		alert("Restaurant name must at least be 4 characters");
		restaurantName.focus();
		return false;
	}
	var pwd1 = $("input[name=pwd1]");
	if (pwd1.val().length < 5) {
		alert("Your password must be at least 5 characters long");
		pwd1.focus();
		return false;
	}
	var pwd2 = $("input[name=pwd2]");
	if (pwd2.val().length < 5) {
		alert("Your other password must be at least 5 characters long");
		pwd2.focus();
		return false;
	}
	if (pwd1.val() != pwd2.val()) {
		alert("Your passwords do not match");
		pwd2.focus();
		return false;
	}
	var stateElement = $("select[name=state]");
	var state = stateElement.val();
	if (state != null && state.length != 2) {
		alert("State code should be 2 characters");
		stateElement.focus();
		return false;
	}
	// 2015-11-22: Address validation is not required, because we are populating
	// the address from google.
	// var st1 = $("input[name=street1]").val();
	// var city = $("input[name=city]").val();
	// var zip = $("input[name=zip]").val();
	// var CurrentAddress = st1 + ", " + city + ", " + state + ", " + zip;
	// var LastAddressValidated = $("input[name=LastAddressValidated]").val();
	// console.log("LastAddressValidated: " + LastAddressValidated);
	// console.log("CurrentAddress: " + CurrentAddress);
	/*
	 * if (LastAddressValidated != CurrentAddress) {
	 * $("input[name=LastAddressValidated]").val(CurrentAddress); var geocoder =
	 * new google.maps.Geocoder(); geocoder.geocode({ 'address' : CurrentAddress },
	 * addressCallbackFunction); return false; }
	 */
	var hash = md5($("#pwd1").val());
	$("#pwd1").val(hash);
	$("#pwd2").val(hash);
	return true;
}

/*
 * function addressCallbackFunction(results, status) {
 * $("div[id=addressnotok]").addClass('hidden'); if (status ==
 * google.maps.GeocoderStatus.OK) { var address = results[0].formatted_address;
 * console.log("Validated address: " + address); numCommas =
 * address.match(/,/g).length; if (numCommas >= 3) { // Address is valid,
 * Continue to submit form var st1 = $("input[name=street1]").val(); var city =
 * $("input[name=city]").val(); var state = $("select[name=state]").val(); var
 * zip = $("input[name=zip]").val(); var CurrentAddress = st1 + ", " + city + ", " +
 * state + ", " + zip; var values = address.split(', '); var validatedStreet =
 * values[0]; var validatedCity = values[1]; var state_zip = values[2].split('
 * '); var validatedState = state_zip[0]; var validatedZip = state_zip[1]; var
 * LastAddressValidated = validatedStreet + ", " + validatedCity + ", " +
 * validatedState + ", " + validatedZip;
 * $("input[name=LastAddressValidated]").val(LastAddressValidated);
 * $("input[name=street1]").val(validatedStreet);
 * $("input[name=city]").val(validatedCity);
 * $("input[name=state]").val(validatedState);
 * $("input[name=zip]").val(validatedZip); if (LastAddressValidated !=
 * CurrentAddress) { alert("\nAddress you entered: " + CurrentAddress + "\nWe
 * updated it to: " + LastAddressValidated + "\nPlease verify and make changes
 * if necessary."); } else { alert("Address is verified and accepted."); }
 * 
 * var customerName = $("input[name=name]").val(); if (customerName != null) {
 * $("form[id=customer-register-form]").submit(); } else {
 * $("form[id=restaurant-register-form]").submit(); }
 * 
 * return; } } // Address is invalid
 * $("input[name=LastAddressValidated]").val("");
 * $("div[id=addressnotok]").removeClass('hidden'); }
 */

function validateLoginForm() {
	var pwd = $("input[name=pwd]");
	if (pwd.val() != null && pwd.val().length > 0 && pwd.val().length < 5) {
		alert("Your password must be at least 5 characters long");
		pwd.focus();
		return false;
	}
	var hash = md5($("#pwd").val());
	$("#pwd").val(hash);
	return true;
}

function validateEventForm() {
	// Validate that the date is in the future.
	var dateTimePickerElement = $('input[id=datetimepicker_date]');
	var dateObject = dateTimePickerElement.val();
	// console.log("User entered: " + dateObject);
	var now = moment().format("YYYY/MM/DD HH:mm");
	// console.log("Now: " + now);
	if (dateObject < now) {
		alert("Please enter a date in the future." + "\nEntered date: "
				+ dateObject);
		dateTimePickerElement.focus();
		return false;
	}
	var seventy_two_hours_from_now = moment().add(72, "hours").format(
			"YYYY/MM/DD");
	// console.log("72 hours from now: " + seventy_two_hours_from_now);
	// console.log("within 72 hr window? "+ (dateObject <
	// seventy_two_hours_from_now));
	if (dateObject < seventy_two_hours_from_now) {
		alert("Event cannot be in the next 72 hours." + "\nEntered date: "
				+ dateObject + "\nPlease enter date/time after "
				+ seventy_two_hours_from_now);
		dateTimePickerElement.focus();
		return false;
	}
	var numberOfPeopleElement = $('input[id=person_count]');
	var numberOfPeople = numberOfPeopleElement.val();
	if (!numberOfPeople.match(/[0-9]+/)) {
		alert("Number of people should be only numeric.\n" + numberOfPeople
				+ " is not a valid value.");
		numberOfPeopleElement.focus();
		return false;
	}
	if (numberOfPeople <= 1) {
		alert("Number of people should be 2 or more.");
		numberOfPeopleElement.focus();
		return false;
	}
	var deliveryOption = $('select[id=deliveryOption]');
	if (deliveryOption.val() == '') {
		alert("Please select the delivery option.");
		deliveryOption.focus();
		return false;
	}
	var stateElement = $("select[name=state]");
	var state = stateElement.val();
	if (state != null && state.length != 2) {
		alert("State code should be 2 characters");
		stateElement.focus();
		return false;
	}
	// 2015-11-22: Address validation is not required, because we are populating
	// the address from google.
	// var st1 = $("input[name=street1]").val();
	// var city = $("input[name=city]").val();
	// var zip = $("input[name=zip]").val();
	// var CurrentAddress = st1 + ", " + city + ", " + state + ", " + zip;
	// var LastAddressValidated = $("input[name=LastAddressValidated]").val();
	// console.log("LastAddressValidated: " + LastAddressValidated);
	// console.log("CurrentAddress: " + CurrentAddress);
	/*
	 * if (LastAddressValidated != CurrentAddress) {
	 * $("input[name=LastAddressValidated]").val(CurrentAddress); var geocoder =
	 * new google.maps.Geocoder(); geocoder.geocode({ 'address' : CurrentAddress },
	 * addressCallbackFunction); return false; }
	 */
	return true;
}

function validateSelectRestaurantForm() {
	var atLeast1Selected = false;
	$(":checkbox").each(function() {
		if (this.checked == true) {
			atLeast1Selected = true;
		}
	});
	if (atLeast1Selected) {
		return true;
	} else {
		alert("Please select at least 1 restaurant.");
		return false;
	}
}
