# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  console.log('Javascript is running')
  time = 4000
  i = 0
  imgs = $('#slideshow1').find("img")

  #run slide show
  setInterval ->
    nextSlide(imgs)
  , time

  #moustache toggle
  $('#btn-profile').click ->
    toggleMoustache()
    #debug doesn't work, odd $('#slideshow1').children( ".portfolio").css('visibility','hidden')

  ##functions
  nextSlide = (imgs) ->
    #console.log('at first i is ' + i.toString())
    if( i < (imgs.length)-1 )
      $(imgs[i]).fadeOut()
      $(imgs[i+1]).fadeIn()
      #debug console.log("an img")
    else
      $(imgs[i]).fadeOut()
      $(imgs[0]).fadeIn()
    if (i < (imgs.length)-1 )
      i+=1
      #debug console.log("incremented, imgs.length is " + (imgs.length))
      #debug console.log('and i is ' + i.toString())
    else
      i=0
      #debug console.log "i reset"
      #debug console.log('and i is ' + i.toString())
      #debug console.log("and imgs.length is " + (imgs.length))


#leaving coffee script
`function toggleMoustache(){
      if ( $('#moustache').css('visibility')=='hidden'){
          $('#moustache').css('visibility','visible')
        } else {
            $('#moustache').css('visibility','hidden')
          }
  }
`
