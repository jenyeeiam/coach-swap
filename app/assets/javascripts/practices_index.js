$(document).ready(function() {
  $('.practice-entry').click(function(){
    $('.swap-modal').addClass("is-active")
  })

  $('.modal-close').click(function() {
    $('.swap-modal').removeClass("is-active")
  })

  var $counter = 1

  if ($counter === 0) {
    $('.next-week').click(function(){
      $counter += 1;
      console.log($counter)
    })
  } else if ($counter > 0 ) {
    $('.prev-week').click(function(){
      $counter -= 1;
      console.log($counter)
    })
    $('.next-week').click(function(){
      $counter += 1;
      console.log($counter)
    })
  }


})
