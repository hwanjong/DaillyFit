var isEdit = false;
var preX = null, preY = null, curX = null, curY = null;
var moveRate;
var curDeg = 30;
// var userId = '<%= session.getAttribute("userId")%>';
function rotate(angle, elem, callback_fn, gap) {
	var $elem = $(elem);
	callback_fn(angle, $elem, gap);

}
function initRotate(angle, target) {
	$({
		deg : 0
	}).animate({
		deg : angle
	}, {
		duration : 1000,
		step : function(now) {
			// in the step-callback (that is fired each step of the animation),
			// you can use the `now` paramter which contains the current
			// animation-position (`0` up to `angle`)
			target.css({
				transform : 'rotate(' + now + 'deg)'
			});
		}
	});
}

function changeWeight(elm, callback_fn, gap) {
	var $elem = $(elm);
	var weight = parseFloat($(elm).html().replace(" kg", ""));
	callback_fn($elem, weight, gap);
}

function initChanveWeightCallback(target, weight) {
	$({
		no : parseFloat(target.html().replace(" kg", "")) - 1.9
	}).animate({
		no : weight
	}, {
		duration : 1000,
		step : function(now) {
			now = now.toFixed(1);
			// in the step-callback (that is fired each step of the animation),
			// you can use the `now` paramter which contains the current
			// animation-position (`0` up to `angle`)
			target.text(now + " kg");
		}
	});
}

function editTouchStartHandler(e) {
	preX = e.originalEvent.touches[0].pageX;
	preY = e.originalEvent.touches[0].pageY;
	moveRate = 50 / $(".weightBG").width();
}

function editMoveEventHandler(e) {
	var curRate;
	if (preX == null || preY == null) {
		return;
	}

	curX = e.originalEvent.touches[0].pageX;
	curY = e.originalEvent.touches[0].pageX;

	curRate = (preX - curX) * moveRate;

	if (e.target.getAttribute("id") == "currentWeightBG") {
		changeWeight('#currentWeigth', editChanveWeightCallback, curRate);
		rotate(curDeg, '#currentNungum', editRotate, curRate);
	} else {
		changeWeight('#goalWeight', editChanveWeightCallback, curRate);
		rotate(curDeg, '#goalNungum', editRotate, curRate);
	}
	preX = curX;
	preY = curY;
}

function editRotate(angle, target, gap) {
	target.css({
		transform : 'rotate(' + curDeg + 'deg)'
	});
	curDeg -= gap;
	// console.log("curDeg : " + curDeg);
	// console.log("angle : " + angle);
	// console.log("gap : " + gap);
	// console.log("========================");
}

function editChanveWeightCallback(target, weight, gap) {
	weight = (weight + gap).toFixed(1);
	if (weight < 0)
		weight = 0.0;
	if (weight > 200)
		weight = 200.0;
	target.text(weight + " kg");
}

function editTouchEndHandler(e) {
	preX = null;
	preY = null;
}

function editBtnClickHandler(e) {
	if (isEdit) {
		$(".weightBG").attr("src", "../img/bg.png");
		$("#editBtn").text("수정");
		$(".weightBG").off('touchstart', editTouchStartHandler);
		$(".weightBG").off('touchmove', editMoveEventHandler);
		$(".weightBG").off('touchend', editTouchEndHandler);
		$('#userHeight').replaceWith(
				'<span class="goalsItem" id="userHeight">'
						+ $('#userHeight').val() + '</span>');
		$('#userPower').replaceWith(
				'<span class="goalsItem" id="userPower">'
						+ $('#userPower').val() + '</span>');
		isEdit = false;
		var curWeight, goalWeight, height, power;
		curWeight = parseFloat($("#currentWeigth").text().replace(" kg", ""));
		goalWeight = parseFloat($("#goalWeight").text().replace(" kg", ""));
		height = parseFloat($("#userHeight").text());
		power = $("#userPower").text();
		editRequest(curWeight, goalWeight, height, power);
	} else {
		$(".weightBG").attr("src", "../img/bg2.png");
		$("#editBtn").text("완료");
		$(".weightBG").on('touchstart', editTouchStartHandler);
		$(".weightBG").on('touchmove', editMoveEventHandler);
		$(".weightBG").on('touchend', editTouchEndHandler);
		$('#userHeight').replaceWith(
				'<input type="number" class="goalsItem" id="userHeight" value="'
						+ $('#userHeight').html() + '">');
		$('#userPower').replaceWith(
				'<select class="goalsItem" id="userPower">'
						+ selectOptionReturnToString($('#userPower').text())
						+ '</select>');
		isEdit = true;		
	}
}
function selectOptionReturnToString(val) {
	if (val == "강") {
		return '<option selected>강</option>' + '<option>중</option>'
				+ '<option>하</option>';
	} else if (val == "중") {
		return '<option>강</option>' + '<option selected>중</option>'
				+ '<option>하</option>';
	} else {
		if (val == "하") {
			return '<option>강</option>' + '<option>중</option>'
					+ '<option selected>하</option>';
		}
	}
}
function spectrumDate(day) {
	switch (day) {
	case 1:
		return "월"
	case 2:
		return "화"
	case 3:
		return "수"
	case 4:
		return "목"
	case 5:
		return "금"
	case 6:
		return "토"
	default:
		return "일"
	}
}
function setDate() {
	var date = new Date();
	$("#dates").text(
			date.getMonth() + 1 + "월 " + date.getDate() + "일 (" + spectrumDate(date.getDay()) + ") "+date.getHours() + ":" + date.getMinutes());
}
function init() {
	rotate(30, ".weightNungum", initRotate);
	changeWeight('#currentWeigth', initChanveWeightCallback);
	changeWeight('#goalWeight', initChanveWeightCallback);
	$("#editBtn").click(editBtnClickHandler);
	setDate();
}

function editRequest(currentWeight, goalWeight, height, power) {
	$.ajax({
		url : "/dailyfit/user/userInfoChange.ap",
		type : "POST",
		data : {
			"height" : height,
			"targetPower" : power,
			"targetWeight" : goalWeight,
			"weight" : currentWeight,
		}	
	});
	console.log("currentWeight : " + currentWeight);
	console.log("typeof(currentWeight) : " + typeof (currentWeight));
	console.log("goalWeight : " + goalWeight);
	console.log("typeof(goalWeight) : " + typeof (goalWeight));
	console.log("height : " + height);
	console.log("typeof(height) : " + typeof (height));
	console.log("power : " + power);
	console.log("typeof(power) : " + typeof (power));
}
$(window).load(init);