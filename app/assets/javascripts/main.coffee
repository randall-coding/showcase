# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "turbolinks:load", ->
  $('#btn-profile').click ->
    toggleVis()    #  if statements don't work in this area.

   # $('#test').fadeToggle(10000)
    # $('#test').css('border','20px solid')
    # $('#img').fadeToggle(1000)

`function toggleVis(){
    if ( $('#moustache').css('visibility')=='hidden'){
        $('#moustache').css('visibility','visible')
      } else {
          $('#moustache').css('visibility','hidden')
        }
}
`
