$(function(){
	$('.homeNavBar .level').on('mouseenter',function(){
		$(this).addClass('paper');
	}).on('mouseleave',function(){
		$(this).removeClass('paper')
	});
});