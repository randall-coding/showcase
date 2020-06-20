
$(document).on "turbolinks:load", ->
  #intro animation
  $('nav.header').children().css('opacity',0)
  $('nav.header').animate(
    #fade in blank bar
    {opacity: 1.0}    #meh with the pluggin  {backgroundColor: org_color}
    700
    ->#fade titles
      $('nav.header').children().animate(
        {opacity:1.0},
        1000
      )
  )

  ##CALLBACKS
  # Moustache toggle
  $('#btn-profile').on 'click', ->
    toggleMoustache()

  # Open contact window / contact form
  $('#contact').on 'click' , ->
    # Clear inputs
    $('textarea').val('')
    $('input:text').val('')
    scroll = $(window).scrollTop()   #track window scroll for modal
    pos = scroll + 30
    # Set up screen div / blocker
    $('div.mask').css('display','block')
    # Open contact window (modal)
    contact_window = $('div.contact_window')
    contact_window.css('top',pos + 'px')
    contact_window.css('display','block')
    contact_window.animate({opacity:1},325)
    # Focus
    $('textarea').focus()

  # Close contact form
  $('#cancel').on 'click' , (e) ->
    $('div.contact_window').css('display','none')
    $('div.contact_window').css('opacity',0)
    $('div.mask').css('display','none')
    e.preventDefault()

  # Last article button
  $('a.last').on('click', (e) ->
    e.preventDefault()
    pos = $('#last').offset().top - 20
    `window.scroll({
        top:pos,
        left:0,
        behavior:'smooth'
    })`
  )

  # About me tab
  $('#about-me').on('click', (e) ->
    console.log('About me called')
    $.get('aboutme', (data, status) ->
       console.log('About me AJAX status')
       console.log(status)

       content = $('div.content')
       changeTabColor($('#about-me'))
       content.fadeOut(700, ->
         $(this).html(data).fadeIn(700)
      );
    );
  )

  # Portfolio tab
  $('#portfolio').on('click', (e) ->
    console.log('Portfolio  called')
    $.get('portfolio', (data, status) ->
       console.log('Portfolio  AJAX status')
       console.log(status)

       content = $('div.content')
       changeTabColor($('#portfolio'))
       content.fadeOut(700, ->
         $(this).html(data).fadeIn(700)
      );
    );
  )

  ##FUNCTIONS
  # Change tab colors
  changeTabColor = (newTab) ->
    oldTab = $('.nav-item-active')
    oldTab.removeClass('nav-item-active')
    console.log(newTab)
    newTab.addClass('nav-item-active')

  # Change slides
  nextSlide = (imgs) ->
    #move both by moving padding right (or left)
    $next = 0
    $nextnext = 0
    speed = 750
    if( i < (imgs.length)-1 )  #regular case
      $next = $(imgs[i+1])
      $nextnext = $(imgs[i+2])
    else                        #rlast image
      $next = $(imgs[0])
      $nextnext = $(imgs[1])

    if( i + 1 ==  (imgs.length - 1) )  #second to last
      $nextnext = $(imgs[0])

    $(imgs[i]).animate(
      {left: "-=100%"}
      speed
      ->
        $(this).removeClass('active').addClass('inactive')
    )
    $next.animate(
      {left: "-=100%"}
      speed
    )
    increment()
    $nextnext.addClass('active').removeClass('inactive').css('left','100%')
    #end nextSlide

  nextSlide_old = (imgs) ->
    if( i < (imgs.length)-1 )
      $(imgs[i]).animate(
        {left:"-610px"}
        ->
          $(imgs[i]).css('display','none').css('left','0')
          $(imgs[i+1]).css('left','610px').css('display','inline')
          $(imgs[i+1]).animate({left:"0px"})
          increment()
      )
    else
      $(imgs[i]).animate(
        {left:"-610px"}
        ->
          $(imgs[i]).css('display','none').css('left','0')
          $(imgs[0]).css('left','610px').css('display','inline')
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
        {left: "-400px"}
        ->
          img_current.removeClass('portfolio_active').addClass('portfolio')
          a.next().find("img").css('left','400px').removeClass('portfolio').addClass('portfolio_active')
          a.next().find("img").animate({left:"0px"})
      )
    else #next is empty, back to first
      img_current = a.find('img')
      img_current.animate(
        {left: "-400px"}
        ->
          img_current.removeClass('portfolio_active').addClass('portfolio')
          $(as[0]).find("img").css('left','400px').removeClass('portfolio').addClass('portfolio_active')
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
