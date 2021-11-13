/* eslint-disable */
import $ from 'jquery';
import 'owl.carousel';
import 'jquery-ui-bundle';

export default function () {
  $(document).ready(function ()
  {
    initializeDocument();
  });

  function initializeDocument()
  {
    headerSettings();

    //Sections
    sectionFilterBar();
    sectionFeaturedListings();

    //Page
    listingPage();
    signUpPage();
    createListingPage();

    //Actions
    addToFavourites();
    //testAjax();
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

  function sectionFilterBar()
  {
    let sectionFilterBar = $('.sectionFilterBar');
    if (sectionFilterBar.length > 0) {
      sectionFilterBar.each(function () {
        let tab = $(this).find('.tab .tablinks');
        tab.click(function(){
          let id = $(this).attr('data-id');
          let icon = $(this).find('i');
          let tabContent = $('#tabcontent-'+id);
          if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            icon.attr('class', 'fal fa-plus');
            //hide tab content
            tabContent.removeClass('active');
          } else {
            //reset tab siblings
            tab.each(function (){
              let tabID = $(this).attr('data-id');
              $(this).removeClass('active');
              $(this).find('i').attr('class', 'fal fa-plus');
              // hide siblings tab content
              $('#tabcontent-'+tabID).removeClass('active');
            });
            $(this).addClass('active');
            icon.attr('class', 'fal fa-minus');
            //show tab content
            tabContent.addClass('active');
          }
        });
      });

      //dropdown
      sectionFilterBar.find('.dropdown').each(function() {
        $(this).on('show.bs.dropdown', function () {
          let btnToggle = $(this).find('.dropdown-toggle');
          let dataType  = btnToggle.attr('data-type');
          let dropdownItem = $(this).find('.dropdown-menu .dropdown-item');
          dropdownItem.click(function(e) {
            let selectedDropdownItem = $(this).text();
            dropdownItem.each(function(){
              $(this).removeClass('active');
            });
            $(this).addClass('active');
            btnToggle.find('span').text(selectedDropdownItem);
          });
          if (dataType === 'Date') {
            let dataID = btnToggle.attr('data-id');
            $('#datepicker'+dataID).datepicker({
              showOtherMonths: true,
              dayNamesMin: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
            });
            $('.ui-corner-all').click(function (e){
              e.preventDefault();
              e.stopPropagation();
            });
          }
        });
      });
    }
  }

  function sectionFeaturedListings()
  {
    let sectionFeaturedListing = $('.sectionFeaturedListing');
    if (sectionFeaturedListing.length > 0)
    {
      let featuredListingItem = sectionFeaturedListing.find('.owl-carousel');
      featuredListingItem.owlCarousel({
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

  function listingPage()
  {
    let listingPage = $('.ListingPage');
    if (listingPage.length > 0)
    {
      let listingPageGallery = listingPage.find('.owl-carousel');
      listingPageGallery.owlCarousel({
        items:2,
        loop:true,
        margin:26,
        nav: true,
        dots:true,
        navText: ['<span class="nav-left"><img src="_resources/themes/starter/images/prev-arrow.svg"> </span>', '<span class="nav-right"><img src="_resources/themes/starter/images/next-arrow.svg"></span>'],
        responsiveClass:true,
        responsive:{
          0:{
            items:1,
            nav:true
          },
          900:{
            items:2,
            nav:true,
          },
          1921:{
            items:3,
            nav:true,
          }
        }
      });
    }
  }

  function signUpPage()
  {
    let signUpForm = $('#RegistrationForm_RegistrationForm');
    if (signUpForm.length > 0)
    {
      let input, categories, passwordField, passwordConfirmField, emailField, emailConfirmField, errorField, modal;
      emailField           = $('#RegistrationForm_RegistrationForm_Email');
      emailConfirmField    = $('#RegistrationForm_RegistrationForm_ConfirmEmail');

      passwordField        = $('#RegistrationForm_RegistrationForm_Password_Holder');
      passwordConfirmField = $('#RegistrationForm_RegistrationForm_ConfirmPassword_Holder');

      categories = $('.field.category');

      errorField = $('.error-field').find('span');

      modal = $('#successRegistration');

      passwordField.append('<a href="#" class="btn-reveal-password password-field"><span>Show</span></a>');
      passwordConfirmField.append('<a href="#" class="btn-reveal-password passwordConfirm-field"><span>Show</span></a>');
      passwordConfirmField.find('#Password_ConfirmPassword').attr('placeholder', 'Confirm Password*');

      passwordField.on('click', '.password-field', function (e) {
        e.preventDefault();
        input = passwordField.find('input');
        inputType(input, $(this));
      });
      passwordConfirmField.on('click', '.passwordConfirm-field', function (e) {
        e.preventDefault();
        input = passwordConfirmField.find('input');
        inputType(input, $(this));
      });

      //Form Validation
      signUpForm.on('submit', function(event){

        if (emailField.val() !== emailConfirmField.val()) {
          $('#message-RegistrationForm_RegistrationForm_ConfirmEmail').remove();
          emailConfirmField.addClass('holder-validation is-invalid');
          emailConfirmField.parent().addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_ConfirmEmail" class="invalid-feedback" role="alert" aria-atomic="true">The email confirmation does not match your email address.</div>');
          event.preventDefault();
        }

        if (passwordField.find('input[type=password]').val() !== passwordConfirmField.find('input[type=password]').val()) {
          $('#message-RegistrationForm_RegistrationForm_ConfirmPassword').remove();
          passwordConfirmField.find('input[type=password]').addClass('holder-validation is-invalid')
          passwordConfirmField.addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_ConfirmPassword" class="invalid-feedback position-absolute" role="alert" aria-atomic="true">The password confirmation does not match your password.</div>');
          event.preventDefault();
        }

        if (categories.length > 0) {
          let countFilledInputs = 0;
          categories.each(function () {
            let field = $(this).find('.form-control').val();
            if ($.trim(field).length > 0) {
              countFilledInputs = parseInt(countFilledInputs) + 1;
            }
          });

          if (countFilledInputs < 1) {
            errorField.text('Select at least 1 category.')
            event.preventDefault();
          }
        }
      });

      //ModalClose
      modal.find('button.close').click(function () {
        modal.removeClass('show');
      });
    }
  }

  function inputType(input, _this) {
    if (input.attr('type') === 'password') {
      input.attr('type', 'text');
      _this.find('span').text('Hide');
    } else {
      input.attr('type', 'password');
      _this.find('span').text('Show');
    }
  }

  function createListingPage()
  {
    let createListingForm = $('#ListingForm_ListingForm');
    if (createListingForm.length > 0)
    {

      let ListingFormCategory, ListingFormTags, ListingIsEventFree, currencyField;

      ListingIsEventFree = $('#ListingForm_ListingForm_isEventFree');
      ListingFormCategory = $('#ListingForm_ListingForm_Category_Holder');
      ListingFormTags = $('#ListingForm_ListingForm_Tags_Holder');

      currencyField = $('.currency-field');
      ListingIsEventFree.find('input[type="radio"]').on('change', function() {
        if ($(this).val() === '1') {
          currencyField.removeClass('d-none');
        } else {
          currencyField.addClass('d-none');
        }
      });


      createListingForm.find('select').each(function () {
        // Cache the number of options
        let dataType = $(this).attr('data-type');
        let $this = $(this),
            numberOfOptions = $(this).children('option').length;

        // Hides the select element
        $this.addClass('s-hidden');

        // Wrap the select element in a div
        $this.wrap('<div class="select"></div>');

        // Insert a styled div to sit over the top of the hidden select element
        $this.after('<div class="styledSelect"></div>');

        // Cache the styled div
        let $styledSelect = $this.next('div.styledSelect');

        // Show the first select option in the styled div
        $styledSelect.text($this.children('option').eq(0).text());

        // Insert an unordered list after the styled div and also cache the list
        let $list = $('<ul />', {
          'class': 'options'
        }).insertAfter($styledSelect);

        // Insert a list item into the unordered list for each select option
        for (let i = 0; i < numberOfOptions; i++) {
          $('<li />', {
            text: $this.children('option').eq(i).text(),
            rel: $this.children('option').eq(i).val()
          }).appendTo($list);
        }

        // Cache the list items
        let $listItems = $list.children('li');

        // Show the unordered list when the styled div is clicked (also hides it if the div is clicked again)
        $styledSelect.click(function (e) {
          e.stopPropagation();
          $('div.styledSelect.active').each(function () {
            $(this).removeClass('active').next('ul.options').hide();
          });
          $(this).toggleClass('active').next('ul.options').toggle();
        });

        // Hides the unordered list when a list item is clicked and updates the styled div to show the selected list item
        // Updates the select element to have the value of the equivalent option
        $listItems.click(function (e) {
          e.stopPropagation();
          $styledSelect.text($(this).text()).removeClass('active');
          $this.val($(this).attr('rel'));
          $list.hide();

          let selectedItem = $(this);
          if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            if (dataType === 'category') {
              $('.category-item').each(function () {
                  if ($(this).attr('data-id') === selectedItem.text()) {
                    $(this).remove();
                  }
              });
            }
            if (dataType === 'tag') {
              $('.tag-item').each(function () {
                if ($(this).attr('data-id') === selectedItem.text()) {
                  $(this).remove();
                }
              });
            }
          } else {
            if (dataType === 'category') {
              $('.selected-categories').removeClass('d-none').append('<a class="category-item" data-id="'+ $(this).text() +'"><span>'+ $(this).text() +'</span><span class="remove-item">X</span></a>');
            }

            if (dataType === 'tag') {
              $('.selected-tags').removeClass('d-none').append('<a class="tag-item" data-id="'+ $(this).text() +'"><span>'+ $(this).text() +'</span><span class="remove-item">X</span></a>');
            }
            $(this).addClass('active');
          }

          $('.remove-item').click(function () {
              $(this).parent().remove();
          });
          /* alert($this.val()); Uncomment this for demonstration! */
        });

        // Hides the unordered list when clicking outside of it
        $(document).click(function () {
          $styledSelect.removeClass('active');
          $list.hide();
        });
      });
    }
  }

  function addToFavourites()
  {
    let btn = $('.addtofavourites');
    btn.click(function () {
      let id = $(this).attr('data-id');
      let member = $(this).attr('data-member');
      //redirect if not member
      let favCounter = $('.fav-counter');
      let newCount = '';
      if ($(this).hasClass('active')) {
        $(this).removeClass('active');
        $(this).find('i').removeClass('fas').addClass('far');
        newCount = (parseInt(favCounter.attr('data-count')) - 1);
        callAPIEndpoint('ajax/removeListingFromFavourites', 'POST', 'id=' + id, function (result) {
          favCounter.text(newCount);
          favCounter.attr('data-count', newCount)
          resetFavCounter(favCounter);
          console.log(result);
        });
      } else {
        $(this).addClass('active');
        $(this).find('i').removeClass('far').addClass('fas');
        newCount = (parseInt(favCounter.attr('data-count')) + 1);
        callAPIEndpoint('ajax/addListingFromFavourites', 'POST', 'id=' + id, function (result) {
          favCounter.html(newCount);
          favCounter.attr('data-count', newCount)
          resetFavCounter(favCounter);

        });
      }
    });
  }

  function resetFavCounter(favCounter)
  {
    if (parseInt(favCounter.attr('data-count')) > 0) {
      favCounter.addClass('filled');
    } else {
      favCounter.removeClass('filled');
    }
  }

  function testAjax()
  {
    $('.tester').each(function() {
      $(this).click(function () {
        let listingid = $(this).attr('data-id');
        console.log('clicked');
        $.ajax({
          type: "POST",
          url: "favourites/deleteListingFromFavourites",
          data: { id : listingid },
          success: function (data) {
            $('.listings-content').html(data);
          }
        })
          .done(function( msg ) {
            alert( "Data Saved: " + msg );
          });
      });



      // $.ajax('favourites/FavouriteListings',{
      //   success: function(data) {
      //     $('.listings-content').html(data);
      //     console.log()
      //   }
      // });
    });
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
