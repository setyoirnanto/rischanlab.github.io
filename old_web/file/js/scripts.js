/* - MASONRY FOR THE BLOG
---------------------------------------------- */
$(document).ready(function(){
	$(function(){
		$('.blog-posts').masonry({
			// options
			itemSelector : 'li',
			gutterWidth : 30
		}).imagesLoaded(function() {
			$('.blog-posts').masonry('reload');
 		});
	});
	

	$('.work-single .browser').each(function(){
		$(this).prepend('<div class="chrome"><span class="address-bar"></span><div class="buttons"><span class="b-button"></span><span class="b-button"></span><span class="b-button"></span></div></div>');		
	});
	
});
			

/* - PORTFOLIO HOVER EFFECTS
---------------------------------------------- */	
$(document).ready(function(){
	Shadowbox.init();
});


/* - TWITTER FEED
---------------------------------------------- */	
$(document).ready(function(){
	$('.tweet-speech').hide();
	
	$('.avatar').on('mouseenter',function(){
		$('.tweet-speech').show();
		$('.tweet-speech li:nth-child(1)').fadeIn(300,function(){
			$('.tweet-speech li:nth-child(2)').fadeIn(300,function(){
				$('.tweet-speech li:nth-child(3)').fadeIn(300,function(){
				});
			});
		});
	});
	$('.avatar').on('mouseleave',function(){
		$('.tweet-speech').fadeOut(100,function(){
			$('.tweet-speech li').hide();
		});
	});
});


/* - INSTAGRAM
---------------------------------------------- */
$(document).ready(function(){

	var feedCount = $('.instagram').find('.feed li').length;
	var itemWidth = 114;
	var calcWidth = feedCount * itemWidth;
	var feedLength = calcWidth;
	var windowWidth = $(window).width();
	
	$(window).resize(function(){
		windowWidth = $(window).width();
	});
	
	$('.instagram').find('.feed').css({'width':calcWidth});
	
	$('.instagram-button').on('click',function(e){
		e.preventDefault();
		$(this).toggleClass('open')
	
		if($('.instagram').hasClass('open')){
			$('.instagram').animate({
				'width':0
			},function(){
				$('.instagram-button').animate({'bottom':0});	
			});	
			$('.instagram').removeClass('open');
		}
		else{
			$('.instagram-button').animate({'bottom':150},function(){
				$('.instagram').animate({
					'width':'100%'
				});	
			});
			$('.instagram').addClass('open');
		}
	});
	
	$('.instagram').on('mousemove',function(e){
		var parentOffset = $(this).offset(); 
		var mouseX = e.pageX - parentOffset.left;
		var mouseY = e.pageY - parentOffset.top;	   
		var containerLength = parseInt($('.instagram').width());
		var bitingPoint = (e.pageX - parentOffset.left) - (containerLength / 2);
		var calcDiff = -bitingPoint * (feedLength / (containerLength/2));
		var curPos = parseInt($(this).find('.feed').css('left'));
		
		if(feedLength > windowWidth){
			if(calcDiff < 1){
				$(this).find('.feed').css({
					'left':calcDiff
				},50);
			}
			else{
				$(this).find('.feed').css({
					'left':0
				});
			}
			if(calcDiff < (-feedLength + containerLength) - 40){
				$(this).find('.feed').css({
					'left':(-feedLength + containerLength) - 40
				});
			}
		}
	});
	
});


/* - SOCIAL ICONS SLIDER
---------------------------------------------- */
$(document).ready(function(){
	var top = 20;
	var left = 15;
	$('.social-icons.floating').css({
		'left':left,
		'top':top
	});
		
	$(window).scroll(function(){
		var iconsPosition =	parseInt($('.social-icons.floating').css('top'));
		var offset = $(document).scrollTop();

		$('.social-icons.floating').animate({
			top: (top + offset),
		},{duration:500,queue:false});
	});
});


/* - AVATAR EMOTIONS
---------------------------------------------- */
$(document).ready(function() {		
	$(".avatar-wink").hover(
		function(){hover=true;},
		function(){hover=false}
	);
	$('.avatar-happy').hover(
		function(){$('.avatar').css('background-position','-422px 0px')},
		function(){$('.avatar').css('background-position','0px 0px')}
	);
	$('.avatar-surprised').hover(
		function(){$('.avatar').css('background-position','-633px 0px')},
		function(){$('.avatar').css('background-position','0px 0px')}
	);
	$('.avatar-wink').hover(
		function(){$('.avatar').css('background-position','-844px 0px')},
		function(){$('.avatar').css('background-position','0px 0px')}
	);
	$('.avatar-brow').hover(
		function(){$('.avatar').css('background-position','-1055px 0px')},
		function(){$('.avatar').css('background-position','0px 0px')}
	);
	$('.avatar-cross').hover(
		function(){$('.avatar').css('background-position','-1266px 0px')},
		function(){$('.avatar').css('background-position','0px 0px')}
	);
	// Make the avatar blink
	hover = false;
	closeEyes();
});
function closeEyes(){
	if(hover == false){
		$('.avatar').css('background-position','-211px 0px');
	}
	setTimeout('openEyes()',500);
}
function openEyes(){
	if(hover == false){
		$('.avatar').css('background-position','0px 0px');
	}
	setTimeout('closeEyes()',6000);
}


/* - INPUT HANDLERS
---------------------------------------------- */
$(document).ready(function(){	
	$('input, textarea').focus(function(){
	    var elm = $(this),
	        value = elm.val(),
	        old = elm.data("placeholder");       
	    if (typeof old === "undefined"){
	        elm.data("placeholder", value);
	        old = value;
	    }
	    if (old == value){
	        elm.val("");
	    }
	}).blur(function() {
	    var elm = $(this);
	    if(elm.val() == ""){
	        elm.val(elm.data("placeholder"));
	    }
	});
});