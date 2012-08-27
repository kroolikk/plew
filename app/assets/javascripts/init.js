$(window).load(function() {
  $('#slider').nivoSlider({
    effect: 'fade',
    controlNavThumbs:true,
    manualAdvance: true,
    prevText: '',
    nextText: ''
  });
});

$(document).ready(function () {
      var timer;
    
      $('.hoverli').mouseenter(function () {
        if(timer) {
          clearTimeout(timer);
          timer = null
        }
        timer = setTimeout(function() {
          $('ul.file_menu').slideDown('medium');
        }, 500);
      });

      $('.hoverli').mouseleave(function () {
        $('ul.file_menu').delay(200).slideUp('medium');
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

