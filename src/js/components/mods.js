/* eslint-disable */
import $ from 'jquery';
import 'owl.carousel';

export default function () {
  $(document).ready(function ()
  {
    initializeDocument();
  });

  function initializeDocument()
  {
    headerSettings();

    //Sections
    searchItemTabs()
    featuredListings()
  }

  function headerSettings()
  {
    //for pre header
    $('.close').click(function (){
     $('.alert').fadeOut();
    });

    //hamburger menu
    $('.hamburger').click(function () {
        if ($(this).hasClass('is-active')) {
          $(this).removeClass('is-active')
        } else {
          $(this).addClass('is-active');
        }
    });

    //Scroll
    window.addEventListener("scroll", function () {
      let topPos = $(window).scrollTop();
      let siteHeader = $('.site-header.scrolled');
      if (topPos > 550) {
        siteHeader.addClass('open');
      } else {
        siteHeader.removeClass('open');
      }
    });
  }

  function searchItemTabs()
  {
    let sectionSearchTabElement = $('.sectionSearchTabElement');
    if (sectionSearchTabElement.length > 0) {
      sectionSearchTabElement.each(function () {
        let tab = $(this).find('.tab .tablinks');
        tab.click(function(){
          let dataID = $(this).attr('data-id');
          let icon = $(this).find('i');
          if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            icon.attr('class', 'fal fa-plus');
            //hide tab content
            $('#'+dataID).removeClass('active');
          } else {
            //reset tab siblings
            tab.each(function (){
              let tabID = $(this).attr('data-id');
              $(this).removeClass('active');
              $(this).find('i').attr('class', 'fal fa-plus');
              // hide siblings tab content
              $('#'+tabID).removeClass('active');
            });
            $(this).addClass('active');
            icon.attr('class', 'fal fa-minus');
            //show tab content
            $('#'+dataID).addClass('active');
          }
        });
      });

      //dropdown
      sectionSearchTabElement.find('.dropdown').each(function() {
        $(this).on('show.bs.dropdown', function () {
          let btnToggle = $(this).find('.dropdown-toggle span');
          let dropdownItem = $(this).find('.dropdown-menu .dropdown-item');
          dropdownItem.click(function() {
            let selectedDropdownItem = $(this).text();
            dropdownItem.each(function(){
              $(this).removeClass('active');
            });
            $(this).addClass('active');
            btnToggle.text(selectedDropdownItem);
          });
        });
      });
    }
  }

  function featuredListings()
  {
    let sectionFeaturedEvents = $('.sectionFeaturedEvents');
    if (sectionFeaturedEvents.length > 0)
    {
      let featuredEventsItem = sectionFeaturedEvents.find('.owl-carousel');
      featuredEventsItem.owlCarousel({
        items:1,
        loop:true,
        center: true,
        stagePadding: 330,
        margin:100,
        nav: true,
        dots:true,
        navText: ['<span class="nav-left"><img src="_resources/themes/starter/dist/images/arrow-left.svg"> </span>', '<span class="nav-right"><img src="_resources/themes/starter/dist/images/arrow-right.svg"></span>']
      });
    }
  }

  function callAPIEndpoint(endpoint, method, postData, callback)
  {
    let test = true;
    let httpRequest =  new XMLHttpRequest();
    httpRequest.open(method, endpoint, true);
    httpRequest.onreadystatechange = function() {
      if(httpRequest.readyState === 4) {
        if(httpRequest.status === 200) {
          if(callback) {
            callback(JSON.parse(httpRequest.response));
          }
        }
      }
    };
    if(postData) {
      if(test) {
        postData += '&test=1';
      }
      httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      httpRequest.send(postData);
    } else {
      httpRequest.send(null);
    }
  }
}
/* eslint-enable */
