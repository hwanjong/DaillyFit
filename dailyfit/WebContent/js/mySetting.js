$(document).ready(function(){
	$("#generalInfoEdit").click(function(e){
		$("#editInfoPopup").popup("open");
		
		
		
		
	});
});

function fill_popup(){
	$(".nick")[1].text($(".nick")[0].text());
	$(".region")[1].text($(".region")[0].text());
	$(".gender")[1].text($(".gender")[0].text());
	$(".birth")[1].text($(".birth")[0].text());
	$(".height")[1].text($(".height")[0].text());
	$(".width")[1].text($(".width")[0].text());
}