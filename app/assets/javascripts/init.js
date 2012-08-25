$(window).load(function() {
  $('#slider').nivoSlider({
    effect: 'fade',
    controlNavThumbs:true,
    manualAdvance: true,
    prevText: '',
    nextText: ''
  });
});
      
      
$(document).ready(function(){
$('#tabs div').hide();
$('#tabs div:first').show();
$('#tabs ul li:first').addClass('active');
 
$('#tabs ul li a').click(function(){
$('#tabs ul li').removeClass('active');
$(this).parent().addClass('active');
var currentTab = $(this).attr('href');
$('#tabs div').hide();
$(currentTab).show();
return false;
});
});

