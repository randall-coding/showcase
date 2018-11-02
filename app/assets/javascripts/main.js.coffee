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
  $('#btn-profile').on 'click', ->
    if confirm('Are you sure?')
      toggleMoustache()
    else
      return
    #debug doesn't work, odd $('#slideshow1').children( ".portfolio").css('visibility','hidden')

  #open contact form
  $('a.contact').on 'click' , ->
    #open contact window
    $('textarea').textContent = ''
    contact_window = $('div.contact_window')
    contact_window.css('display','block')

    #set up screen div / blocker
    $('div.mask').css('display','block')
    console.log 'async called'


  #close contact form
  $('#cancel').on 'click' , ->
    $('div.contact_window').css('display','none')
    $('div.mask').css('display','none')


  ##functions
  nextSlide = (imgs) ->
    #debug console.log('at first i is ' + i.toString())
    #debug console.log("an img")

    if( i < (imgs.length)-1 )
      $(imgs[i]).animate(
        {left:"-910px"}
        ->
          $(imgs[i]).css('display','none').css('left','0')
          $(imgs[i+1]).css('left','910px').css('display','inline')
          $(imgs[i+1]).animate({left:"0px"})
          increment()
      )
    else
      $(imgs[i]).animate(
        {left:"-910px"}
        ->
          $(imgs[i]).css('display','none').css('left','0')
          $(imgs[0]).css('left','910px').css('display','inline')
          $(imgs[0]).animate({left:"0px"})
          increment()
      )


  increment = ->
    if (i < (imgs.length)-1 )
      i+=1
    else
      i=0

#leaving coffee script
`function toggleMoustache(){
      if ( $('#moustache').css('visibility')=='hidden'){
          $('#moustache').css('visibility','visible')
        } else {
            $('#moustache').css('visibility','hidden')
          }
  }
`
