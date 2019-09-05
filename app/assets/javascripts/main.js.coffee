# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->

  # contemplating fade in.
  # $li = $('div.left li')
  # $h1 = $('div.left h1')
  #
  # #offsets
  # $li_offsets = $li.map ->
  #   $(this).offset().top
  # $h1_offsets = $h1.map ->
  #   $(this).offset().top
  #
  # $(window).on 'scroll', ->
  #   scrollTop = $(window).scrollTop();
  #   window_height = $(window).height();
  #   my_view = scrollTop + window_height;
  #
  #   console.info $li_offsets
  #   console.info $h1_offsets
  #
  #   i = 0;
  #   #cycle through offsets and compare
  #   $li_offsets.each ->
  #     if this > (my_view + 20)  #if offset > my_view + 10  then animate
  #       $li = $( $li[i] )
  #       console.info "my li is " + $li
  #       $($li).animate(
  #         {opacity:1.0;}
  #       )
  #     i += 1


  #hide profile up top
  #$('div.right').css('overflow','visible')
  #$('div.main').css('overflow','visible')
  #$('img.profile').css('margin-top','-430px').css('opacity',1.0).css('z-index',4)

  #intro animation
  $('div.header').children().css('opacity',0)
  $('div.header').animate(
    #fade in blank bar
    {opacity: 1.0}    #meh with the pluggin  {backgroundColor: org_color}
    700
    ->#fade titles
      $('div.header').children().animate(
        {opacity:1.0},
        1000
      )
  )

  #run slideshow 1
  # time = 4500
  # i = 0
  # imgs = $('#slideshow1').find("img")
  # setInterval ->
  #   nextSlide(imgs)
  # , time
  #
  # #run slideshow 4
  # setInterval ->
  #   a = $('#slideshow4').find("a")
  #   nextSlide2(a)
  # , time

  ##CALLBACKS
  #moustache toggle
  $('#btn-profile').on 'click', ->
    toggleMoustache()

  #open contact window / contact form
  $('#contact').on 'click' , ->
    #clear inputs
    $('textarea').val('')
    $('input:text').val('')
    scroll = $(window).scrollTop()   #track window scroll for modal
    pos = scroll + 30
    #open contact window (modal)
    contact_window = $('div.contact_window')
    contact_window.css('top',pos + 'px')
    contact_window.css('display','block')
    #set up screen div / blocker
    $('div.mask').css('display','block')
    #focus
    $('textarea').focus()

  #close contact form
  $('#cancel').on 'click' , (e) ->
    $('div.contact_window').css('display','none')
    $('div.mask').css('display','none')
    e.preventDefault()

  # last article button
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
       content.fadeOut(700, ->
         $(this).html(data).fadeIn(700)
      );
    );
  )

  # About me tab
  $('#portfolio').on('click', (e) ->
    console.log('Portfolio  called')
    $.get('portfolio', (data, status) ->
       console.log('Portfolio  AJAX status')
       console.log(status)

       content = $('div.content')
       content.fadeOut(700, ->
         $(this).html(data).fadeIn(700)
      );
    );
  )

  ##FUNCTIONS
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
