# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "turbolinks:load", ->
  console.log('Javascript is running')

  #fade titles
  $('div.header').children().css('opacity',0)
  $('div.header').animate(
    {opacity: 1.0}    #meh with the pluggin  {backgroundColor: org_color}
    1000
    ->
      $('div.header').children().animate(
        {opacity:1.0},
        3000
      )

  )
  $('img.profile').animate(
    {opacity:1.0},
    2000
  )

  #run slideshow 1
  time = 4000
  i = 0
  imgs = $('#slideshow1').find("img")
  setInterval ->
    nextSlide(imgs)
  , time

  #run slideshow 3
  setInterval ->
    a = $('#slideshow3').find("a")
    nextSlide2(a)
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

  nextSlide2 = (as) ->
    a = as.find("img.portfolio_active").parent()
    #if next exists, slide old out, new in
    if a.next().length != 0
      img_current = a.find('img')
      img_current.animate(
        {left: "-600px"}
        ->
          img_current.removeClass('portfolio_active').addClass('portfolio')
          a.next().find("img").css('left','600px').removeClass('portfolio').addClass('portfolio_active')
          a.next().find("img").animate({left:"0px"})
      )
    else #next is null, back to first
      img_current = a.find('img')
      img_current.animate(
        {left: "-910px"}
        ->
          img_current.removeClass('portfolio_active').addClass('portfolio')
          $(as[0]).find("img").css('left','910px').removeClass('portfolio').addClass('portfolio_active')
          $(as[0]).find("img").animate({left:"0px"})
      )


#leaving coffee script
`function toggleMoustache(){
      if ( $('#moustache').css('visibility')=='hidden'){
          $('#moustache').css('visibility','visible')
        } else {
            $('#moustache').css('visibility','hidden')
          }
  }
`
