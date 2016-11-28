$(document).ready(function() {
  // $('.practice-form').first().css("visibility", "visible")
  var $current = $('.practice-form').first()

  $('.add-practice').click(function(){
    $current = $current.next();
    $current.css("visibility", "visible");
  })

  $('.recurring').click(function(){
    $('.end-date').toggle()
  })

})
