$(document).on("turbolinks:load", function() {
    var changeTabColor, increment, nextSlide, nextSlide2, nextSlide_old;

    // Fade in header
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
    
    // Show contact widget
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

    // Close contact widget
    $('#cancel').on('click', function(e) {
      $('div.contact_window').css('display', 'none');
      $('div.contact_window').css('opacity', 0);
      $('div.mask').css('display', 'none');
      return e.preventDefault();
    });

    // Change tabs
    $('.my-tabs').on('click', function(e) {
      changeTabColor($(e.target));
        content = $('div.content');
        content.fadeOut(250, function() {
          $(this).children().css({'display':'none','opacity':0})
          $('#' + e.target.dataset.name + '-container').css({'display':'block','opacity':1})
          $(this).fadeIn(250, function(){
            $('html').animate({
              scrollTop: content[0].offsetTop - 40,
            },700
            )
          })
        })
    });

    // Zoom in portfolio item
    $('.portfolio-container .portfolio_item').click(function(e){
      var id = e.currentTarget.dataset.id;
      $('#zoomed-portfolio-item .zoom-content').html('')
      $('#zoomed-portfolio-item').modal('toggle')
      $('#zoomed-portfolio-item .loading').show()

      $.get( "portfolio_items/zoomed_item?id=" + id, function(response) {
        $('#zoomed-portfolio-item .zoom-content').hide();
        $('#zoomed-portfolio-item .zoom-content').html(response)
        $('#zoomed-portfolio-item .zoom-content img').on('load', function() {
          $('#zoomed-portfolio-item .loading').hide();
          $('#zoomed-portfolio-item .zoom-content').show();
        });
      })
        .fail(function() {
          console.log("Javascript error on portfolio-item click");
        })
    })

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
