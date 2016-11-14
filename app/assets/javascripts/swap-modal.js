$(document).ready(function() {
  $('.practice-entry').click(function(){
    $('.swap-modal').addClass("is-active")
  })

  $('.modal-close').click(function() {
    $('.swap-modal').removeClass("is-active")
  })
})
