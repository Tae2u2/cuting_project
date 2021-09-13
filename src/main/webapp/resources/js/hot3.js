
$(function(){

  var slider2_initialized = false;
     var slider3_initialized = false;
     
     $( ".best" ).tabs({
         activate: function( event, ui ) {
            //console.log("ui = ");console.log(ui);
            var tab_id = $(ui.newPanel).attr('id');//alert(tab_id);
             
            if(tab_id == "tabs-2" && slider2_initialized == false)
            {    
                $('.basic_slider2').bxSlider({
                  //controls:false
	
 				 nextText : '<i class="fas fa-chevron-right"></i>',
				 prevText : '<i class="fas fa-chevron-left"></i>',
				pager:false,
	 			minSlides:2,
	 			maxSlides:3,
	 			slideWidth:300,
	 			slideMargin:30
                }); 
                //update initialization flag to true
                slider2_initialized = true;
            }
            else if(tab_id == "tabs-3" && slider3_initialized == false)
            {    
                $('.basic_slider3').bxSlider({
                 //controls:false
	
 				 nextText : '<i class="fas fa-chevron-right"></i>',
				 prevText : '<i class="fas fa-chevron-left"></i>',
				 pager:false,
				 minSlides:2,
				 maxSlides:3,
				 slideWidth:300,
				 slideMargin:30
                }); 
                //update initialization flag to true
                slider3_initialized = true;
            }
         }
     });
	 $('.basic_slider1').bxSlider({
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


