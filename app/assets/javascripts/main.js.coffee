# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "turbolinks:load", ->
  time = 4000
  i = 0
  imgs = $('#slideshow1').find("img")

  setInterval ->
    nextSlide(imgs)
  , time
  console.log('setInterval running')


  $('#btn-profile').click ->
    toggleVis()    #  if statements don't work in this area.
    imgs = $('#slideshow1').find("img")
    # img.css('visibility','hidden')
    prev = null

    #debug doesn't work, odd $('#slideshow1').children( ".portfolio").css('visibility','hidden')

  nextSlide = (imgs) ->
    #console.log('at first i is ' + i.toString())
    if( i < (imgs.length)-1 )
      $(imgs[i]).fadeOut()
      $(imgs[i+1]).fadeIn()
      console.log("an img")
    else
      $(imgs[i]).fadeOut()
      $(imgs[0]).fadeIn()
    if (i < (imgs.length)-1 )
      i+=1
      console.log("incremented, imgs.length is " + (imgs.length))
      console.log('and i is ' + i.toString())
    else
      i=0
      console.log "i reset"
      console.log('and i is ' + i.toString())
      console.log("and imgs.length is " + (imgs.length))


  #leaving coffee script
`function toggleVis(){
      if ( $('#moustache').css('visibility')=='hidden'){
          $('#moustache').css('visibility','visible')
        } else {
            $('#moustache').css('visibility','hidden')
          }
  }
`
