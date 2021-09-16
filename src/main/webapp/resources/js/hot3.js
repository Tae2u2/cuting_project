 
$(function(){

	 $('.basic_slider').bxSlider({
	 //controls:false
	
 	 nextText : '<i class="fas fa-chevron-right"></i>',
	 prevText : '<i class="fas fa-chevron-left"></i>',
	pager:false,
	 minSlides:2,
	 maxSlides:3,
	 slideWidth:300,
	 
	 slideMargin:30

	 });
	 
	
});
/* Demo purposes only */
$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);


