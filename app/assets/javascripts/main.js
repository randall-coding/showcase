$(document).on("turbolinks:load", function() {
    var changeTabColor, increment, nextSlide, nextSlide2, nextSlide_old;
    $('nav.header').children().css('opacity', 0);
    $('nav.header').animate({
      opacity: 1.0
    }, 700, function() {
      return $('nav.header').children().animate({
        opacity: 1.0
      }, 1000);
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
      $.get(e.target.dataset.name, function(data, status) {
        var content;
        content = $('div.content');
        changeTabColor($(e.target));
        console.log(content[0]);
        content.fadeOut(700, function() {
          $(this).html(data).fadeIn(700, function(){
            $('html').animate({
                scrollTop: content[0].offsetTop - 40,
            })
          })
        })
      });
    });

    changeTabColor = function(newTab) {
      var oldTab;
      oldTab = $('.nav-item-active');
      oldTab.removeClass('nav-item-active');
      return newTab.addClass('nav-item-active');
    };
    nextSlide = function(imgs) {
      var $next, $nextnext, speed;
      $next = 0;
      $nextnext = 0;
      speed = 750;
      if (i < imgs.length - 1) {
        $next = $(imgs[i + 1]);
        $nextnext = $(imgs[i + 2]);
      } else {
        $next = $(imgs[0]);
        $nextnext = $(imgs[1]);
      }
      if (i + 1 === (imgs.length - 1)) {
        $nextnext = $(imgs[0]);
      }
      $(imgs[i]).animate({
        left: "-=100%"
      }, speed, function() {
        return $(this).removeClass('active').addClass('inactive');
      });
      $next.animate({
        left: "-=100%"
      }, speed);
      increment();
      return $nextnext.addClass('active').removeClass('inactive').css('left', '100%');
    };
    nextSlide_old = function(imgs) {
      if (i < imgs.length - 1) {
        return $(imgs[i]).animate({
          left: "-610px"
        }, function() {
          $(imgs[i]).css('display', 'none').css('left', '0');
          $(imgs[i + 1]).css('left', '610px').css('display', 'inline');
          $(imgs[i + 1]).animate({
            left: "0px"
          });
          return increment();
        });
      } else {
        return $(imgs[i]).animate({
          left: "-610px"
        }, function() {
          $(imgs[i]).css('display', 'none').css('left', '0');
          $(imgs[0]).css('left', '610px').css('display', 'inline');
          $(imgs[0]).animate({
            left: "0px"
          });
          return increment();
        });
      }
    };
    increment = function() {
      var i;
      if (i < imgs.length - 1) {
        return i += 1;
      } else {
        return i = 0;
      }
    };
    return nextSlide2 = function(as) {
      var a, img_current;
      a = as.find("img.portfolio_active").parent();
      if (a.next().length !== 0) {
        img_current = a.find('img');
        return img_current.animate({
          left: "-400px"
        }, function() {
          img_current.removeClass('portfolio_active').addClass('portfolio');
          a.next().find("img").css('left', '400px').removeClass('portfolio').addClass('portfolio_active');
          return a.next().find("img").animate({
            left: "0px"
          });
        });
      } else {
        img_current = a.find('img');
        return img_current.animate({
          left: "-400px"
        }, function() {
          img_current.removeClass('portfolio_active').addClass('portfolio');
          $(as[0]).find("img").css('left', '400px').removeClass('portfolio').addClass('portfolio_active');
          return $(as[0]).find("img").animate({
            left: "0px"
          });
        });
      }
    };
  });

  function toggleMoustache(){
      if ( $('#moustache').css('visibility')=='hidden'){
          $('#moustache').css('visibility','visible')
        } else {
            $('#moustache').css('visibility','hidden')
          }
  }
;
