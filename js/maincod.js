$(function () {
    $('[data-toggle="tooltip"]').tooltip()
});

$(document).ready(function(){
    $(".hidemenu").click(function(){
        if ($('.menuleft').is(':visible')) {
        	$('.menuleft').css("display","none");
  			$('.main_data').animate({marginLeft: "+=-300px"});
		}else{
			$('.main_data').animate({marginLeft: "+=300px"}); 
  			$('.menuleft').animate({marginLeft: "+=-100px"});
        $('.menuleft').animate({marginLeft: "+=100px"});
        $('.menuleft').css("display","block");
		};
    });
});

