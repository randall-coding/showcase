$(document).on("turbolinks:load", function() {
    var changeTabColor, increment, nextSlide, nextSlide2, nextSlide_old;
    $('nav.header').children().css('opacity', 0);
    $('nav.header').animate({
      opacity: 1.0
    }, 700, function() {
      $('nav.header').children().animate({
        opacity: 1.0
      }, 1000, function(){
        $('.intro-image , #main-content').animate({
          opacity: 1.0
        }, 1000)
      });
    });

    $('#btn-profile').on('click', function() {
      return toggleMoustache();
    });

    $('#contact').on('click', function() {
      var contact_window, pos, scroll;
      $('textarea').val('');
      $('input:text').val('');
      scroll = $(window).scrollTop();
      pos = scroll + 100;
      $('div.mask').css('display', 'block');
      contact_window = $('div.contact_window');
      contact_window.css('top', pos + 'px');
      contact_window.css('display', 'block');
      contact_window.animate({
        opacity: 1
      }, 325);
      return $('textarea').focus();
    });

    $('#cancel').on('click', function(e) {
      $('div.contact_window').css('display', 'none');
      $('div.contact_window').css('opacity', 0);
      $('div.mask').css('display', 'none');
      return e.preventDefault();
    });

    $('.my-tabs').on('click', function(e) {
      changeTabColor($(e.target));
        content = $('div.content');
        content.fadeOut(500, function() {
          $(this).children().css({'display':'none','opacity':0})
          $('#' + e.target.dataset.name + '-container').css({'display':'block','opacity':1})
          $(this).fadeIn(500, function(){
            $('html').animate({
              scrollTop: content[0].offsetTop - 40,
            },700
            )
          })
        })
    });

    function changeTabColor(newTab) {
      var oldTab;
      oldTab = $('.nav-item-active');
      oldTab.removeClass('nav-item-active');
      return newTab.addClass('nav-item-active');
    };

    function toggleMoustache(){
        if ( $('#moustache').css('visibility')=='hidden'){
            $('#moustache').css('visibility','visible')
          } else {
              $('#moustache').css('visibility','hidden')
            }
    }
}) //end document.ready()
