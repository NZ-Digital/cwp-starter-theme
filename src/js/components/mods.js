/* eslint-disable */
import $ from 'jquery';
import 'owl.carousel';
import Moment from 'moment';
import { extendMoment } from 'moment-range';
const moment = extendMoment(Moment);
import 'pg-calendar/dist/js/pignose.calendar';
import 'jquery-ui-bundle';
import 'stickyfilljs';

export default function () {
  $(document).ready(function () {
    initializeDocument();
  });

  function initializeDocument() {
    headerSettings();
    closeSearchForm();

    //Sections
    sectionFilterBar();
    sectionFeaturedListings();
    sectionVideoSlider();

    //Page
    listingPage();
    signUpPage();
    contributorPage();
    createListingPage();
    articlePage();

    //Actions
    addToFavourites();
    showTags();
    showMoreNews();
    showShareSocials();
    sliderTags();
    newsletter();

    accountSettings();

    closeModal();

    otherSettings();
  }

  function headerSettings() {
    let hamburger = $('.hamburger');
    let mobileNav = $('.mobile-nav');
    //for pre header
    $('.close').click(function () {
      $('.alert').fadeOut();
    });

    //hamburger menu
    hamburger.click(function () {
      if (hamburger.hasClass('is-active')) {
        hamburger.removeClass('is-active')
        mobileNav.fadeOut();
      } else {
        hamburger.addClass('is-active');
        mobileNav.fadeIn();
      }
    });

    //search
    let searchBtn = $('.nav-search');
    let searchForm = $('.site-header-search');
    searchBtn.click(function () {
      if (searchForm.hasClass('active')) {
        searchForm.removeClass('active');
        searchForm.fadeOut();
      } else {
        searchForm.addClass('active');
        searchForm.fadeIn();
        searchForm.find('#SearchForm_SearchForm_Search').focus();
      }
    });

    //Scroll
    window.addEventListener("scroll", function () {
      let topPos = $(window).scrollTop();
      let siteHeader = $('.site-header.scrolled');
      if (topPos > 250) {
        siteHeader.addClass('open');
      } else {
        siteHeader.removeClass('open');
      }
    });
  }

  function closeSearchForm() {
    let searchForm = $('.site-header-search');
    let closeBtn = searchForm.find('.btn-close');

    closeBtn.click(function () {
      if (searchForm.hasClass('active')) {
        searchForm.removeClass('active');
        searchForm.fadeOut();
      }
    });
  }

  function sectionFilterBar() {
    let sectionFilterBar = $('.sectionFilterBar');
    if (sectionFilterBar.length > 0) {
      sectionFilterBar.each(function () {
        let tab = $(this).find('.tab .tablinks');
        tab.click(function () {
          let id = $(this).attr('data-id');
          let icon = $(this).find('i');
          let tabContent = $('#tabcontent-' + id);
          let tabContentMob = $('#tabcontent-mob-' + id);
          if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            icon.attr('class', 'fal fa-plus');
            //hide tab content
            tabContent.removeClass('active');
            tabContentMob.removeClass('active');
          } else {
            //reset tab siblings
            tab.each(function () {
              let tabID = $(this).attr('data-id');
              $(this).removeClass('active');
              $(this).find('i').attr('class', 'fal fa-plus');
              // hide siblings tab content
              $('#tabcontent-' + tabID).removeClass('active');
              $('#tabcontent-mob-' + tabID).removeClass('active');
            });
            $(this).addClass('active');
            icon.attr('class', 'fal fa-minus');
            //show tab content
            tabContent.addClass('active');
            tabContentMob.addClass('active');
          }
        });
      });

      //dropdown
      sectionFilterBar.find('.dropdown').each(function () {
        $(this).on('show.bs.dropdown', function (e) {
          let _this = $(this);
          let btnToggle = _this.find('.dropdown-toggle');
          let dataType = btnToggle.attr('data-type');
          let dropdownItem = _this.find('.dropdown-menu .dropdown-item');
          dropdownItem.click(function (e) {
            let selectedDropdownItem = $(this);
            dropdownItem.each(function () {
              $(this).removeClass('active');
            });
            $(this).addClass('active');
            btnToggle.find('span').text(selectedDropdownItem.text());
            btnToggle.find('span').attr('data-keyword', selectedDropdownItem.attr('data-keyword'));
          });
          if (dataType === 'Date') {
            let filterDate = $(this).find('.calendar-datepicker--dropdown');
            filterDate.pignoseCalendar({
              multiple: true,
              initialize: false,
              week: 1,
              weeks: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
              select: function (dates, context) { //date selection
                let selectedDateRange, datesArray, formattedDate, rangeOfDatesArray = [];
                if (dates[1] !== null) {
                  selectedDateRange = moment.range(moment(dates[0]), moment(dates[1]));
                  datesArray = Array.from(selectedDateRange.by("days"));
                  $.map(datesArray, function (date, i) {
                    formattedDate = date.format("YYYY-MM-DD");
                    rangeOfDatesArray.push(formattedDate);
                  });
                  //btnToggle.find('span').text(rangeOfDatesArray.toString());
                  btnToggle.find('span').text(moment(dates[0]).format("DD MMM YYYY") + ' to ' + moment(dates[1]).format("DD MMM YYYY"));
                  btnToggle.find('span').attr('data-keyword', rangeOfDatesArray.toString());
                } else {
                  if (dates[0] === null) {
                    btnToggle.find('span').text('Any date');
                  } else {
                    formattedDate = moment(dates[0]).format("YYYY-MM-DD");
                    btnToggle.find('span').text(moment(dates[0]).format('DD MMM YYYY'));
                    btnToggle.find('span').attr('data-keyword', formattedDate);
                  }
                }
              }
            });
            // let dataID = btnToggle.attr('data-id');
            // $('#datepicker' + dataID).datepicker({
            //   showOtherMonths: true,
            //   dayNamesMin: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
            // });
            // $('.ui-corner-all').click(function (e) {
            //   e.preventDefault();
            //   e.stopPropagation();
            // });
          }
        });
      });

      let action = $('.filter-action .action');
      action.click(function () {
        let url = $(this).attr('data-url');
        let params = "?";
        let filters = $(this).parent().parent('.filters').find('.filter-item');
        filters.each(function () {
          let date = $(this).find('.filterDate .dropdown-toggle span').attr('data-keyword');
          let dateRange = $(this).find('.filterDate .dropdown-toggle span').text();
          let location = $(this).find('.filterLocation .dropdown-toggle span').attr('data-keyword');
          let type = $(this).find('.filterType .dropdown-toggle span').attr('data-keyword');
          let size = $(this).find('.filterCapacity .dropdown-toggle span').attr('data-keyword');
          let category = $(this).find('.filterCategory .dropdown-toggle span').attr('data-keyword');
          let keywords = $(this).find('.filterKeywords input').val();
          if (date) {
            params += "date=" + date + "&daterange=" + dateRange + "&";
          }
          if (location) {
            params += "location=" + location + "&";
          }
          if (type) {
            params += "type=" + type + "&";
          }
          if (size) {
            params += "size=" + size + "&";
          }
          if (category) {
            params += "category=" + category + "&";
          }
          if (keywords) {
            params += "keywords=" + keywords + "&";
          }
          if (keywords === "") {
            params += "keywords=";
          }
        });
        if (params) {
          window.location = url + params + '#sortable-listings';
        }
      });
    }
  }

  function sectionFeaturedListings() {
    let sectionFeaturedListing = $('.sectionFeaturedListing');
    if (sectionFeaturedListing.length > 0) {
      let featuredListingItem = sectionFeaturedListing.find('.owl-carousel');
      featuredListingItem.owlCarousel({
        items: 1,
        loop: true,
        center: true,
        nav: true,
        dots: true,
        dotsEach: true,
        navText: ['<span class="nav-left"><img src="_resources/themes/starter/dist/images/arrow-left.svg"> </span>', '<span class="nav-right"><img src="_resources/themes/starter/dist/images/arrow-right.svg"></span>'],
        responsive: {
          0: {
            nav: true,
            stagePadding: 0,
            margin: 10,
          },
          669: {
            stagePadding: 10,
            margin: 10,
          },
          992: {
            stagePadding: 20,
            margin: 20,
          },
          1590: {
            stagePadding: 330,
            margin: 100,
          }
        }
      });
    }
  }

  function sectionVideoSlider() {
    let sectionVideoSlider = $('.sectionVideoSlider');
    if (sectionVideoSlider.length > 0) {
      let video = sectionVideoSlider.find('video');
      let playBtn = $('.btn--video-play');
      playBtn.click(function () {
        if ($(this).hasClass('play')) {
          $(this).removeClass('play');
          $(this).find('i').removeClass('fa-pause-circle').addClass('fa-play-circle');
          video.get(0).pause();
        } else {
          $(this).addClass('play');
          $(this).find('i').removeClass('fa-play-circle').addClass('fa-pause-circle');
          video.get(0).play();
        }
      });
    }
  }

  function listingPage() {
    let listingPage = $('.ListingPage');
    if (listingPage.length > 0) {

      let copyLinkModal = $('.copy-link--modal');
      let copyLinkClose = $('.copy-link--close');
      let copyLink = $('.copy-link');

      copyLink.click(function () {
        copyLinkModal.addClass('active');
        copyToClipboard(copyLinkModal.find('input').val());
      });

      copyLinkClose.click(function () {
        copyLinkModal.removeClass('active');
      });

      let listingPageGallery = listingPage.find('.owl-carousel');
      listingPageGallery.owlCarousel({
        items: 2,
        loop: true,
        margin: 26,
        nav: true,
        dots: true,
        dotsEach: true,
        navText: ['<span class="nav-left"><img src="_resources/themes/starter/images/prev-arrow.svg"> </span>', '<span class="nav-right"><img src="_resources/themes/starter/images/next-arrow.svg"></span>'],
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: true
          },
          900: {
            items: 2,
            nav: true,
          },
          1921: {
            items: 3,
            nav: true,
          }
        }
      });

      let acc = $(".accordion-btn");
      acc.each(function() {
        $(this).click(function () {
          let panel = $(this).parent().parent().next().find('.accordion-panel');
          $(this).toggleClass('active');
          panel.toggleClass('active');
        });
      })
    }
  }

  function copyToClipboard(text) {
    let textArea = document.createElement("textarea");
    document.body.appendChild(textArea);
    textArea.value = text; //save main text in it
    textArea.select(); //select textarea contenrs
    document.execCommand("copy");
    document.body.removeChild(textArea);
  }

  function articlePage() {
    let articleGallery = $('.article-gallery');
    if (articleGallery.length > 0) {
      let gallery = articleGallery.find('.owl-carousel');
      gallery.owlCarousel({
        items: 2,
        loop: true,
        margin: 26,
        nav: true,
        dots: true,
        dotsEach: true,
        navText: ['<span class="nav-left"><img src="_resources/themes/starter/images/prev-arrow.svg"> </span>', '<span class="nav-right"><img src="_resources/themes/starter/images/next-arrow.svg"></span>'],
        responsiveClass: true,
        responsive: {
          0: {
            items: 1,
            nav: true
          },
          900: {
            items: 2,
            nav: true,
          },
          1921: {
            items: 3,
            nav: true,
          }
        }
      });
    }
  }

  function signUpPage() {
    let signUpForm = $('#RegistrationForm_RegistrationForm');
    if (signUpForm.length > 0) {
      let input, categorySelectorWhatsOn, categorySelectorCreativeDirectory, selectedCategoriesWhatsOn = [],
        selectedCategoriesCreativeDirectory = [], passwordField, passwordConfirmField,
        emailField, emailConfirmField, selectedCategoryWhatsOnField, selectedCategoryCreativeDirectoryField;

      let requiredPassword = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()+=-\?;,./{}|\":<>\[\]\\\' ~_]).{10,20}/;///^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{10,20}$/;

      emailField = $('#RegistrationForm_RegistrationForm_Email');
      emailConfirmField = $('#RegistrationForm_RegistrationForm_ConfirmEmail');

      passwordField = $('#RegistrationForm_RegistrationForm_Password_Holder');
      passwordConfirmField = $('#RegistrationForm_RegistrationForm_ConfirmPassword_Holder');

      selectedCategoryWhatsOnField = $('#RegistrationForm_RegistrationForm_SelectedCategoriesWhatsOn');
      selectedCategoryCreativeDirectoryField = $('#RegistrationForm_RegistrationForm_SelectedCategoriesCreativeDirectory');
      categorySelectorWhatsOn = $('.category-selector.whatsOn-category');
      categorySelectorCreativeDirectory = $('.category-selector.creativeDirectory-category')

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

      //Email and Password Validation
      signUpForm.on('submit', function (event) {
        let _this = $(this);
        let error = false;

        let errorField = $('.error-field');
        if (selectedCategoryWhatsOnField.length > 0) {
          if (!selectedCategoryWhatsOnField.val()) {
            event.preventDefault();
            errorField.addClass('d-block').find('span').text('Please select at least 1 category');
            error = true;
          }
        }

        if (passwordField.length > 0) {
          if (passwordField.find('.password').val() !== passwordConfirmField.find('.password').val()) {
            $('#message-RegistrationForm_RegistrationForm_ConfirmPassword').remove();
            passwordConfirmField.find('.password').addClass('holder-validation is-invalid')
            passwordConfirmField.addClass('holder-validation has-error').parent().append('<div id="message-RegistrationForm_RegistrationForm_ConfirmPassword" class="invalid-feedback d-block pl-2 pr-2 mb-3 mt-0" role="alert" aria-atomic="true">The password confirmation does not match your password.</div>');
            event.preventDefault();
            error = true;
          }
          if (!requiredPassword.test(passwordField.find('.password').val())) {
            $('#message-RegistrationForm_RegistrationForm_Password').remove();
            passwordField.find('.password').addClass('holder-validation is-invalid')
            passwordField.addClass('holder-validation has-error').parent().append('<div id="message-RegistrationForm_RegistrationForm_Password" class="invalid-feedback d-block pl-2 pr-2 mb-3 mt-0" role="alert" aria-atomic="true">Must be at least 10 and not longer than 20 characters. Contain 1 uppercase & 1 lowercase, 1 number and 1 special character.</div>');
            event.preventDefault();
            error = true;
          }
        }

        if (emailField.length > 0) {
          event.preventDefault();
          callAPIEndpoint('ajax/validateEmail', 'POST', 'email=' + $.trim(emailField.val()), function (result) {
            if (result.data.count > 0) {
              $('#message-RegistrationForm_RegistrationForm_Email').remove();
              emailField.addClass('holder-validation is-invalid');
              emailField.parent().addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_Email" class="invalid-feedback" role="alert" aria-atomic="true">An account with email ' + $.trim(emailField.val()) + ' already exists.</div>');
              error = true;
            }
          });

          if (emailField.val() !== emailConfirmField.val()) {
            $('#message-RegistrationForm_RegistrationForm_ConfirmEmail').remove();
            emailConfirmField.addClass('holder-validation is-invalid');
            emailConfirmField.parent().addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_ConfirmEmail" class="invalid-feedback" role="alert" aria-atomic="true">The email confirmation does not match your email address.</div>');
            error = true;
          }
          setTimeout(function () {
            if (error === false) {
              event.currentTarget.submit();
            }
          }, 1000);
        }
      });

      let dropdownToggle = $('.location-selector .dropdown-toggle');
      let selectedLocation = $('.selected-location');
      let locationField = $('#RegistrationForm_RegistrationForm_Location');
      $('.location-selector .dropdown-item').click(function (e) {
        let _this = $(this);
        let selectedDropdownItem = _this.text();
        if (_this.hasClass('active')) {
          _this.removeClass('active');
          dropdownToggle.text('Select location');
          selectedLocation.find('.item-holder').empty()
          selectedLocation.removeClass('has-item');
          locationField.val('');
        } else {
          _this.addClass('active').siblings().removeClass('active');
          dropdownToggle.text(selectedDropdownItem);
          selectedLocation.addClass('has-item');
          selectedLocation.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedDropdownItem + '</span><span class="remove-item" id="' + _this.attr('data-id') + '">X</span></div>');
          locationField.val(_this.attr('data-id'));

          selectedLocation.find('.remove-item').click(function () {
            let selectedDropdownItem = $('.location-selector .dropdown-item[data-id=' + $(this).attr('id') + ']');
            selectedDropdownItem.removeClass('active');
            dropdownToggle.text('Select location');
            selectedLocation.removeClass('has-item')
            selectedLocation.find('.item-holder').empty();
            locationField.val('');
          });
        }
      });

      if (locationField.val()) {
        let selectedDropdownItem = $('.location-selector .dropdown-item[data-id=' + locationField.val() + ']');
        dropdownToggle.text(selectedDropdownItem.text());
        selectedDropdownItem.addClass('active');
        selectedLocation.addClass('has-item');
        selectedLocation.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedDropdownItem.text() + '</span><span class="remove-item"  id="' + locationField.val() + '">X</span></div>');

        selectedLocation.find('.remove-item').click(function () {
          let selectedDropdownItem = $('.location-selector .dropdown-item[data-id=' + $(this).attr('id') + ']');
          selectedDropdownItem.removeClass('active');
          dropdownToggle.text('Select location');
          selectedLocation.removeClass('has-item')
          selectedLocation.find('.item-holder').empty();
          locationField.val('');
        });
      }

      //Category whats On
      if (categorySelectorWhatsOn.length > 0) {
        categorySelectorWhatsOn.find('.form-check-input').each(function () {
          if (this.checked) {
            selectedCategoriesWhatsOn.push($(this).attr('name'));
          } else {
            if (selectedCategoryWhatsOnField.val()) {
              let currentSelectedCategories = selectedCategoryWhatsOnField.val().split(",");
              console.log(currentSelectedCategories);
              if ($.inArray($(this).attr('name'), currentSelectedCategories) !== -1) {
                $(this).prop('checked', true);
                $(this).parent().addClass('selected');
              }
            }
          }
        });
        categorySelectorWhatsOn.on('change', '.form-check-input', function () {
          let parent = $(this).parent('.form-check');
          if (this.checked) {
            parent.addClass('selected');
            selectedCategoriesWhatsOn.push($(this).attr('name'));
          } else {
            parent.removeClass('selected');
            selectedCategoriesWhatsOn.splice($.inArray($(this).attr('name'), selectedCategoriesWhatsOn), 1);
          }
          selectedCategoryWhatsOnField.val(selectedCategoriesWhatsOn.toString());
        });
      }

      //Category creative directory
      if (categorySelectorCreativeDirectory.length > 0) {
        categorySelectorCreativeDirectory.find('.form-check-input').each(function () {
          if (this.checked) {
            selectedCategoriesCreativeDirectory.push($(this).attr('name'));
          } else {
            if (selectedCategoryCreativeDirectoryField.val()) {
              let currentSelectedCategories = selectedCategoryCreativeDirectoryField.val().split(",");
              if ($.inArray($(this).attr('name'), currentSelectedCategories) !== -1) {
                $(this).prop('checked', true);
                $(this).parent().addClass('selected');
              }
            }
          }
        });
        categorySelectorCreativeDirectory.on('change', '.form-check-input', function () {
          let parent = $(this).parent('.form-check');
          if (this.checked) {
            parent.addClass('selected');
            selectedCategoriesCreativeDirectory.push($(this).attr('name'));
          } else {
            parent.removeClass('selected');
            selectedCategoriesCreativeDirectory.splice($.inArray($(this).attr('name'), selectedCategoriesCreativeDirectory), 1);
          }
          selectedCategoryCreativeDirectoryField.val(selectedCategoriesCreativeDirectory.toString());
        });
      }
    }
  }

  function contributorPage() {
    let contributorForm = $('#ContributorForm_ContributorForm');
    if (contributorForm.length > 0) {
      let emailField, emailConfirmField;
      emailField = $('#ContributorForm_ContributorForm_Email');
      emailConfirmField = $('#ContributorForm_ContributorForm_ConfirmEmail');

      contributorForm.on('submit', function (event) {
        let _this = $(this);
        let error = false;
        if (emailField.length > 0) {
          event.preventDefault();
          if (emailField.val() !== emailConfirmField.val()) {
            $('#message-RegistrationForm_RegistrationForm_ConfirmEmail').remove();
            emailConfirmField.addClass('holder-validation is-invalid');
            emailConfirmField.parent().addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_ConfirmEmail" class="invalid-feedback" role="alert" aria-atomic="true">The email confirmation does not match your email address.</div>');
            error = true;
          }
          setTimeout(function () {
            if (error === false) {
              event.currentTarget.submit();
            }
          }, 1000);
        }
      });

      let dropdownToggle = $('.location-selector .dropdown-toggle');
      let locationField = $('#ContributorForm_ContributorForm_Location');
      $('.location-selector .dropdown-item').click(function (e) {
        let _this = $(this);
        let selectedDropdownItem = _this.text();
        if (_this.hasClass('active')) {
          _this.removeClass('active');
          dropdownToggle.text('Region*');
          locationField.val('');
        } else {
          _this.addClass('active').siblings().removeClass('active');
          dropdownToggle.text(selectedDropdownItem);
          locationField.val(_this.attr('data-id'));
        }
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

  function closeModal() {
    let modal = $('.modal');
    modal.find('button.close').click(function () {
      modal.removeClass('show');
      modal.css('display', 'none');
    });

    if (modal.hasClass('contributor-modal')) {
      modal.find('.close').click(function () {
        let url= document.location.href;
        window.history.pushState({}, "", url.split("?")[0]);
        window.history.replaceState({}, '', url.split("?")[0]);
      });
    }
  }

  function createListingPage() {
    let createListingForm = $('#ListingForm_ListingForm');
    if (createListingForm.length > 0) {
      //ListingDetailsStep
      ListingDetailsStep();

      //ListingCategoryStep
      ListingCategoryStep(createListingForm);

      //ListingDateAndTimeStep
      ListingDateAndTimeStep();

      //Listing Location
      ListingLocation();

      //ListingPriceStep
      ListingPriceStep()

      //ListingUploadImages
      ListingUploadImages()

      // let actionBtnSubmit, isDraftTextbox;
      //
      // isDraftTextbox  = $('#ListingForm_ListingForm_IsDraft');
      // actionBtnSubmit = $('#ListingForm_ListingForm_action_finish');
      // actionBtnSubmit.click(function (e) {
      //   if ($(this).attr('data-draft') === '1') {
      //     isDraftTextbox.val('1');
      //   }
      // });
      $('.create-listing--modal .close').click(function () {
        let url= document.location.href;
        window.history.pushState({}, "", url.split("&")[0]);
        window.history.replaceState({}, '', url.split("&")[0]);
      });
    }
  }

  function ListingDetailsStep() {
    let locationSelector, typeSelector, sizeSelector, locationField, locationIDField, typeField, sizeField;
    let locationDropdownToggle, typeDropdownToggle, sizeDropdownToggle;
    let selectedLocation, selectedType, selectedSize;

    locationSelector = $('.location-selector .dropdown-item');
    typeSelector = $('.type-selector .dropdown-item');
    sizeSelector = $('.size-selector .dropdown-item');

    locationDropdownToggle = $('.location-selector .dropdown-toggle');
    typeDropdownToggle = $('.type-selector .dropdown-toggle');
    sizeDropdownToggle = $('.size-selector .dropdown-toggle');

    locationField   = $('#ListingForm_ListingForm_Location');
    locationIDField = $('#ListingForm_ListingForm_LocationID');
    typeField = $('#ListingForm_ListingForm_Type');
    sizeField = $('#ListingForm_ListingForm_Size');

    selectedLocation = $('.selected-location');
    selectedType = $('.selected-type');
    selectedSize = $('.selected-size');

    locationSelector.click(function (e) {
      let _this = $(this);
      let selectedDropdownItem = _this.text();
      if (_this.hasClass('active')) {
        _this.removeClass('active');
        locationDropdownToggle.text('Location*');
        selectedLocation.find('.item-holder').empty()
        selectedLocation.removeClass('has-item');
        locationIDField.val('');
        locationField.val('');
      } else {
        _this.addClass('active').siblings().removeClass('active');
        locationDropdownToggle.text(selectedDropdownItem);
        selectedLocation.addClass('has-item');
        selectedLocation.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedDropdownItem + '</span><span class="remove-item" id="' + _this.attr('data-id') + '">X</span></div>');
        locationIDField.val(_this.attr('data-id'));
        locationField.val(_this.text());

        selectedLocation.find('.remove-item').click(function () {
          let selectedDropdownItem = $('.location-selector .dropdown-item[data-id=' + $(this).attr('id') + ']');
          selectedDropdownItem.removeClass('active');
          locationDropdownToggle.text('Location*');
          selectedLocation.removeClass('has-item')
          selectedLocation.find('.item-holder').empty();
          locationIDField.val('');
          locationField.val('');
        });
      }
    });

    if (locationField.val()) {
      let selectedDropdownItem = $('.location-selector .dropdown-item[data-id=' + locationIDField.val() + ']');
      locationDropdownToggle.text(selectedDropdownItem.text());
      selectedDropdownItem.addClass('active');
      selectedLocation.addClass('has-item');
      selectedLocation.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedDropdownItem.text() + '</span><span class="remove-item"  id="' + locationIDField.val() + '">X</span></div>');

      selectedLocation.find('.remove-item').click(function () {
        let selectedDropdownItem = $('.location-selector .dropdown-item[data-id=' + $(this).attr('id') + ']');
        selectedDropdownItem.removeClass('active');
        locationDropdownToggle.text('Select location');
        selectedLocation.removeClass('has-item')
        selectedLocation.find('.item-holder').empty();
        locationIDField.val('');
        locationField.val('');
      });
    } else {
      //locationDropdownToggle.text('Location*');
    }

    typeSelector.click(function (e) {
      let _this = $(this);
      let selectedDropdownItem = _this.text();
      if (_this.hasClass('active')) {
        _this.removeClass('active');
        typeDropdownToggle.text('Type of Listing');
        selectedType.find('.item-holder').empty()
        selectedType.removeClass('has-item');
        typeField.val('');
      } else {
        _this.addClass('active').siblings().removeClass('active');
        typeDropdownToggle.text(selectedDropdownItem);
        selectedType.addClass('has-item');
        selectedType.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedDropdownItem + '</span><span class="remove-item" id="' + _this.attr('data-id') + '">X</span></div>');
        typeField.val(_this.attr('data-id'));

        selectedType.find('.remove-item').click(function () {
          let selectedDropdownItem = $('.type-selector .dropdown-item[data-id=' + $(this).attr('id') + ']');
          selectedDropdownItem.removeClass('active');
          typeDropdownToggle.text('Type of Listing');
          selectedType.removeClass('has-item')
          selectedType.find('.item-holder').empty();
          typeField.val('');
        });
      }
    });

    if (typeField.val()) {
      let selectedDropdownItem = $('.type-selector .dropdown-item[data-id=' + typeField.val() + ']');
      typeDropdownToggle.text(selectedDropdownItem.text());
      selectedDropdownItem.addClass('active');
      selectedType.addClass('has-item');
      selectedType.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedDropdownItem.text() + '</span><span class="remove-item"  id="' + typeField.val() + '">X</span></div>');

      selectedType.find('.remove-item').click(function () {
        let selectedDropdownItem = $('.type-selector .dropdown-item[data-id=' + $(this).attr('id') + ']');
        selectedDropdownItem.removeClass('active');
        typeDropdownToggle.text('Type of Listing');
        selectedType.removeClass('has-item')
        selectedType.find('.item-holder').empty();
        typeField.val('');
      });
    } else {
      typeDropdownToggle.text('Type of Listing');
    }

    sizeSelector.click(function (e) {
      let _this = $(this);
      let selectedDropdownItem = _this.text();
      if (_this.hasClass('active')) {
        _this.removeClass('active');
        sizeDropdownToggle.text('Type of Space');
        selectedSize.find('.item-holder').empty()
        selectedSize.removeClass('has-item');
        sizeField.val('');
      } else {
        _this.addClass('active').siblings().removeClass('active');
        sizeDropdownToggle.text(selectedDropdownItem);
        selectedSize.addClass('has-item');
        selectedSize.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedDropdownItem + '</span><span class="remove-item" id="' + _this.attr('data-id') + '">X</span></div>');
        sizeField.val(_this.attr('data-id'));

        selectedType.find('.remove-item').click(function () {
          let selectedDropdownItem = $('.size-selector .dropdown-item[data-id=' + $(this).attr('id') + ']');
          selectedDropdownItem.removeClass('active');
          sizeDropdownToggle.text('Type of Space');
          selectedSize.removeClass('has-item')
          selectedSize.find('.item-holder').empty();
          sizeField.val('');
        });
      }
    });

    if (sizeField.val()) {
      let selectedDropdownItem = $('.size-selector .dropdown-item[data-id=' + typeField.val() + ']');
      sizeDropdownToggle.text(selectedDropdownItem.text());
      selectedDropdownItem.addClass('active');
      selectedSize.addClass('has-item');
      selectedSize.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedDropdownItem.text() + '</span><span class="remove-item"  id="' + typeField.val() + '">X</span></div>');

      selectedSize.find('.remove-item').click(function () {
        let selectedDropdownItem = $('.size-selector .dropdown-item[data-id=' + $(this).attr('id') + ']');
        selectedDropdownItem.removeClass('active');
        sizeDropdownToggle.text('Type of Space');
        selectedSize.removeClass('has-item')
        selectedSize.find('.item-holder').empty();
        sizeField.val('');
      });
    } else {
      sizeDropdownToggle.text('Type of Space');
    }

    //Step navigation naming
    if ($('.group-wo li.ListingPricingStep').find('a')) {
      $('.group-wo li.ListingPricingStep a').text("Ticketing");
    } else {
      $('.group-wo li.ListingPricingStep').text("Ticketing");
    }

    if ($('.group-cd li.ListingPricingStep').find('a')) {
      $('.group-cd li.ListingPricingStep a').text("Pricing");
    } else {
      $('.group-cd li.ListingPricingStep').text("Pricing");
    }

    if ($('.group-cs li.ListingPricingStep').find('a')) {
      $('.group-cs li.ListingPricingStep a').text("Pricing");
    } else {
      $('.group-cs li.ListingPricingStep').text("Pricing");
    }

    if ($('.group-cs li.ListingInfoStep').find('a')) {
      $('.group-cs li.ListingInfoStep a').text("Space Details");
    } else {
      $('.group-cs li.ListingInfoStep').text("Space Details");
    }
  }

  function ListingCategoryStep(form) {
    let selectedCategoryHolder, selectedCategoryText,
      selectedSubCategoryHolder, selectedSubCategoryText,
      selectedTagsHolder, selectedTagsText,
      selectedTagsArray = [];
    let categoryError, tagError, locationError, actionBtnNext;
    let selectedLocationText;
    let isDraftTextbox = $('#ListingForm_ListingForm_IsDraft');

    locationError = $('.location-error');
    categoryError = $('.category-error');
    tagError = $('.tag-error');

    actionBtnNext = $('#ListingForm_ListingForm_action_next');

    selectedCategoryText = $('input[name="Categories"]');
    selectedSubCategoryText = $('input[name="SubCategories"]');
    selectedTagsText = $('input[name="Tags"]');

    selectedLocationText = $('#ListingForm_ListingForm_Location');

    form.find('select').each(function () {
      let $this = $(this),
        dataType = $(this).attr('data-type'),
        firstData = $(this).attr('data-first'),
        numberOfOptions = $(this).children('option').length,
        $styledSelect;

      $this.addClass('s-hidden');
      $this.wrap('<div class="select"></div>');
      $this.after('<div class="styledSelect"></div>');
      $styledSelect = $this.next('div.styledSelect');
      $styledSelect.text(firstData);

      let $list = $('<ul />', {
        'class': 'options'
      }).insertAfter($styledSelect);

      // $('<li />', {
      //   text: firstData,
      //   rel: 0
      // }).appendTo($list);

      for (let i = 0; i < numberOfOptions; i++) {
        $('<li />', {
          text: $this.children('option').eq(i).text(),
          rel: $this.children('option').eq(i).val()
        }).appendTo($list);
      }

      let $listItems = $list.children('li');

      $styledSelect.click(function (e) {
        e.stopPropagation();
        $('div.styledSelect.active').each(function () {
          $(this).removeClass('active').next('ul.options').hide();
        });
        $(this).toggleClass('active').next('ul.options').toggle();
      });

      $listItems.click(function (e) {
        let selectedItem = $(this);
        e.stopPropagation();
        $styledSelect.text($(this).text()).removeClass('active');
        $this.val($(this).attr('rel'));
        $list.hide();

        selectedCategoryHolder = $('.selected-category');
        selectedSubCategoryHolder = $('.selected-subcategory');
        selectedTagsHolder = $('.selected-tags');

        if (selectedItem.hasClass('selected')) {
          selectedItem.removeClass('selected');
          if (dataType === 'category') {
            selectedCategoryHolder.removeClass('has-item');
            selectedCategoryHolder.find('.item-holder').empty();
            selectedCategoryText.val('');
          }
          if (dataType === 'subcategory') {
            selectedSubCategoryHolder.removeClass('has-item');
            selectedSubCategoryHolder.find('.item-holder').empty();
            selectedSubCategoryText.val('');
          }
          if (dataType === 'tag') {
            let item = selectedTagsHolder.find('.item-holder .text:contains(' + selectedItem.text() + ')');
            item.parent().remove();
            selectedTagsArray.splice($.inArray(selectedItem.text(), selectedTagsArray), 1);
            selectedTagsText.val(selectedTagsArray);
            if (selectedTagsArray.length < 1) {
              selectedTagsHolder.removeClass('has-item');
              selectedTagsHolder.find('.item-holder').empty();
              selectedTagsText.val('');
            }
          }
        } else {
          if (dataType === 'category' || dataType === 'subcategory') {
            selectedItem.addClass('selected').siblings().removeClass('selected');
            if (dataType === 'category') {
              selectedCategoryHolder.addClass('has-item');
              selectedCategoryHolder.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedItem.text() + '</span><span class="remove-item">X</span></div>');
              selectedCategoryText.val($.trim(selectedItem.text()));
              callAPIEndpoint('ajax/getTagsByCategory', 'POST', 'id=' + $.trim(selectedItem.attr('rel')), function (result) {
                if (result.data) {
                  let liShown = [];
                  let dropdownTags = $('.dropdown-tags');
                  let selectedStyle = dropdownTags.find('.styledSelect');
                  let list = dropdownTags.find('ul.options');
                  let data = result.data;

                  list.find('li').removeClass('show selected');
                  selectedStyle.text('Please select tags');
                  selectedTagsHolder.removeClass('has-item');
                  selectedTagsHolder.find('.item-holder').empty();
                  selectedTagsText.val('');

                  for (let i = 0; i < data.length; i++) {
                    list.find('li[rel="' + data[i].id + '"]').addClass('show');
                    // list.each(function () {
                    //   $(this).removeClass('selected');
                    //   // console.log('data-id '+  data[i].id);
                    //   // console.log('rel-id ' + $(this).attr('rel'));
                    //   if ($(this).attr('rel') === data[i].id) {
                    //     console.log($(this).attr('rel'));
                    //     // if(jQuery.inArray($.trim($(this).text()), liShown) === -1) {
                    //     //   liShown.push($.trim($(this).text()));
                    //       if (!$(this).hasClass('show')) {
                    //         $(this).addClass('show');
                    //       }
                    //     // }
                    //   }
                    // })
                  }
                }
              });
            }
            if (dataType === 'subcategory') {
              selectedSubCategoryHolder.addClass('has-item');
              selectedSubCategoryHolder.find('.item-holder').empty().append('<div class="item"><span class="text">' + selectedItem.text() + '</span><span class="remove-item">X</span></div>');
              selectedSubCategoryText.val($.trim(selectedItem.text()));
            }
          }
          if (dataType === 'tag') {
            if (!selectedTagsText.val()) {
              selectedTagsArray = [];
            } else {
              selectedTagsArray = selectedTagsText.val().split(",");
            }
            selectedItem.addClass('selected');
            selectedTagsHolder.addClass('has-item');
            selectedTagsArray.push($.trim(selectedItem.text()));
            selectedTagsHolder.find('.item-holder').append('<div class="item"><span class="text">' + selectedItem.text() + '</span><span class="remove-item">X</span></div>');
            selectedTagsText.val(selectedTagsArray.toString());
          }
        }
        removeSelectedItem(selectedCategoryText, selectedSubCategoryText, selectedTagsText);
      });

      // Hides the unordered list when clicking outside of it
      $(document).click(function () {
        $styledSelect.removeClass('active');
        $list.hide();
      });
    });


    let btnAddSubCategory, subCategoryWrapper;
    /**
     * Will show sub category options when toggled
     */
    btnAddSubCategory = $('.add-subcategory-btn');
    subCategoryWrapper = $('.sub-category-wrapper');

    btnAddSubCategory.click(function () {
      let i = $(this).find('i');
      if ($(this).hasClass('active')) {
        $(this).removeClass('active');
        i.removeClass('fa-minus-circle');
        i.addClass('fa-plus-circle');
        subCategoryWrapper.removeClass('active');
      } else {
        $(this).addClass('active');
        i.addClass('fa-minus-circle');
        i.removeClass('fa-plus-circle');
        subCategoryWrapper.addClass('active');
      }
    });

    actionBtnNext.click(function (e) {
      let attr = $(this).attr('data-step');
      if (attr === 'category-tag') {
        if (!selectedCategoryText.val()) {
          e.preventDefault();
          categoryError.empty().append('<span>Please select a category.</span>');
        } else {
          categoryError.empty().append('<span>&nbsp;</span>');
        }
        if (!selectedTagsText.val()) {
          e.preventDefault();
          tagError.empty().append('<span>Please select at least one tag.</span>');
        } else {
          tagError.empty().append('<span>&nbsp;</span>');
        }
      }

      if (attr === 'listing-details') {
        if (!selectedLocationText.val()) {
          e.preventDefault();
          locationError.empty().append('<span>Please select a location.</span>');
        } else {
          locationError.empty().append('<span>&nbsp;</span>');
        }
      }
      isDraftTextbox.val('');
    });
    loadSelectedCategoriesAndTags(selectedCategoryText, selectedSubCategoryText, selectedTagsText);
  }

  function removeSelectedItem(category, subcategory, tags) {
    let dataType;
    let _this, parentDiv, btnRemove = $('.remove-item'),
      categorySelectorHolder, subcategorySelectorHolder, tagSelectorHolder;

    let tagArrays = [];

    categorySelectorHolder = $('#ListingForm_ListingForm_CategorySelector_Holder');
    subcategorySelectorHolder = $('#ListingForm_ListingForm_SubCategorySelector_Holder');
    tagSelectorHolder = $('#ListingForm_ListingForm_TagsSelector_Holder');

    btnRemove.click(function () {
      _this = $(this);
      parentDiv = _this.parent().parent().parent();
      dataType = parentDiv.attr('data-type');
      if (dataType === 'category' || dataType === 'subcategory') {
        parentDiv.removeClass('has-item');
        parentDiv.find('item-holder').empty();
        if (dataType === 'category') {
          category.val('');
          //resets dropdown value
          categorySelectorHolder.find('.styledSelect').text('Please select one category');
          categorySelectorHolder.find('.options li').removeClass('selected');

          tags.val('');
          $('.selected-tags').removeClass('has-item');
          $('.selected-tags .item-holder').empty();
          tagSelectorHolder.find('.styledSelect').text('Please select tags');
          tagSelectorHolder.find('.options li').removeClass('show').removeClass('selected');
        }
        if (dataType === 'subcategory') {
          subcategory.val('');
          //resets dropdown value
          subcategorySelectorHolder.find('.styledSelect').text('Please select one subcategory');
          subcategorySelectorHolder.find('.options li').removeClass('selected');
        }
      }
      if (dataType === 'tag') {
        if (tags.val().includes(',')) {
          _this.parent().remove();
          tagArrays = tags.val().split(",");
          tagArrays.splice($.inArray($.trim(_this.siblings().text()), tagArrays), 1);
          tags.val(tagArrays);
          console.log('sasa');
        } else {
          parentDiv.removeClass('has-item');
          parentDiv.find('.item-holder').empty();
          tags.val('');
          //resets dropdown value
          tagSelectorHolder.find('.styledSelect').text('Please select tags');
          tagSelectorHolder.find('.options li').removeClass('selected');
        }
        tagSelectorHolder.find('.options li:contains(' + _this.siblings().text() + ')').removeClass('selected');
      }
    });
  }

  function loadSelectedCategoriesAndTags(category, subcategory, tags) {
    let selectedCategoryHolder, selectedSubCategoryHolder, selectedTagsHolder,
      categorySelectorHolder, subcategorySelectorHolder, tagSelectorHolder;

    let btnAddSubCategory = $('.add-subcategory-btn');

    let tagArrays = [];

    selectedCategoryHolder = $('.selected-category');
    selectedSubCategoryHolder = $('.selected-subcategory');
    selectedTagsHolder = $('.selected-tags');

    categorySelectorHolder = $('#ListingForm_ListingForm_CategorySelector_Holder');
    subcategorySelectorHolder = $('#ListingForm_ListingForm_SubCategorySelector_Holder');
    tagSelectorHolder = $('#ListingForm_ListingForm_TagsSelector_Holder');

    if (category.val()) {
      categorySelectorHolder.find('.styledSelect').text(category.val());
      categorySelectorHolder.find('.options li:contains(' + category.val() + ')').addClass('selected');
      selectedCategoryHolder.addClass('has-item');
      selectedCategoryHolder.find('.item-holder').append('<div class="item"><span class="text">' + category.val() + '</span><span class="remove-item">X</span></div>');
    }

    if (subcategory.val()) {
      btnAddSubCategory.addClass('active').find('i').removeClass('fa-plus-circle').addClass('fa-minus-circle');
      subcategorySelectorHolder.parent().addClass('active');
      subcategorySelectorHolder.find('.styledSelect').text(subcategory.val());
      subcategorySelectorHolder.find('.options li:contains(' + subcategory.val() + ')').addClass('selected');
      selectedSubCategoryHolder.addClass('has-item');
      selectedSubCategoryHolder.find('.item-holder').append('<div class="item"><span class="text">' + subcategory.val() + '</span><span class="remove-item">X</span></div>');
    }

    if (tags.val()) {
      callAPIEndpoint('ajax/getTagByCategoryName', 'POST', 'name=' + category.val(), function (result) {
        if (result.data) {
          let liShown = [];
          let dropdownTags = $('.dropdown-tags');
          let list = dropdownTags.find('ul.options li');
          let data = result.data;
          for (let i = 0; i < data.length; i++) {
            list.each(function () {
              if ($.trim($(this).text()) === data[i].name) {
                if (jQuery.inArray($.trim($(this).text()), liShown) === -1) {
                  liShown.push($.trim($(this).text()));
                  if (!$(this).hasClass('show')) {
                    $(this).addClass('show');
                  }
                }
              }
            });
          }
        }
      })
      let listTag = tagSelectorHolder.find('ul.options li');
      let liTagShown = [];
      if (tags.val().includes(',')) {
        tagArrays = tags.val().split(",");
        selectedTagsHolder.addClass('has-item');
        for (let i = 0; i < tagArrays.length; i++) {
          tagSelectorHolder.find('.styledSelect').text(tagArrays[i]);
          listTag.each(function () {
            if ($.trim($(this).text()) === tagArrays[i]) {
              if (jQuery.inArray($.trim($(this).text()), liTagShown) === -1) {
                liTagShown.push($.trim($(this).text()));
                $(this).addClass('selected');
              }
            }
          });
          selectedTagsHolder.find('.item-holder').append('<div class="item"><span class="text">' + tagArrays[i] + '</span><span class="remove-item">X</span></div>');
        }
      } else {
        tagSelectorHolder.find('.styledSelect').text(tags.val());
        listTag.each(function () {
          if ($.trim($(this).text()) === tagArrays[i]) {
            if (jQuery.inArray($.trim($(this).text()), liTagShown) === -1) {
              liTagShown.push($.trim($(this).text()));
              $(this).addClass('selected');
            }
          }
        });
        selectedTagsHolder.addClass('has-item');
        selectedTagsHolder.find('.item-holder').append('<div class="item"><span class="text">' + tags.val() + '</span><span class="remove-item">X</span></div>');
      }
    }
    removeSelectedItem(category, subcategory, tags);
  }

  function ListingDateAndTimeStep() {
    let calendar, selectedDateRange, datesArray, formattedDate,
      listingDateTimeContainer, listingSelectedDatesTextBox,
      listingSelectedStartTimeTextBox, listingSelectedEndTimeTextBox;
    let dateToday = new Date();

    listingDateTimeContainer = $('.listingDateTimes');
    listingSelectedDatesTextBox     = $('input[name="SelectedDates"]');
    listingSelectedStartTimeTextBox = $('input[name="SelectedStartTimes"]');
    listingSelectedEndTimeTextBox   = $('input[name="SelectedEndTimes"]');
    calendar = $('.calendar-datepicker');

    let ListingForm_ListingForm_ByAppointment = $('#ListingForm_ListingForm_ByAppointment');
    let isByAppointment = ListingForm_ListingForm_ByAppointment.find('input[name="ByAppointment"]:checked').val();

    if (isByAppointment === '1') {
      calendar.addClass('disabled');
      listingSelectedDatesTextBox.val('');
      listingDateTimeContainer.empty();
    }

    ListingForm_ListingForm_ByAppointment.find('input[type="radio"]').on('change', function () {
      if ($(this).val() === '1') {
        calendar.addClass('disabled');
        listingSelectedDatesTextBox.val('');
        listingSelectedStartTimeTextBox.val('');
        listingSelectedEndTimeTextBox.val('');
        listingDateTimeContainer.empty();
      } else {
        calendar.removeClass('disabled');
      }
    });

    calendar.pignoseCalendar({
      minDate: moment(dateToday).format("YYYY-MM-DD"),
      multiple: true,
      initialize: false,
      week: 1,
      weeks: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
      select: function (dates, context) { //date selection
        let selectedDates = [];
        //removing selected date values textbox
        listingSelectedDatesTextBox.val('');
        listingSelectedStartTimeTextBox.val('');
        listingSelectedEndTimeTextBox.val('');
        if (dates.length > 0) {
          listingDateTimeContainer.find('.date-time-item').remove();
          for (let i = 0; i < dates.length; i++) {
            if (dates[i] !== null) {
              selectedDates.push(dates[i].format("DD MMMM YYYY"));
              if (selectedDates.length > 1) {
                let rangeOfDatesArray = [];
                listingDateTimeContainer.empty();
                selectedDateRange = moment.range(moment(dates[0]), moment(dates[1]));
                datesArray = Array.from(selectedDateRange.by("days"));
                $.map(datesArray, function (date, i) {
                  formattedDate = date.format("DD MMMM YYYY");
                  rangeOfDatesArray.push(formattedDate);
                  appendDateTimeItem(listingDateTimeContainer, formattedDate, '', '', i);
                });
                listingSelectedDatesTextBox.val(rangeOfDatesArray);
              } else {
                formattedDate = dates[i].format("DD MMMM YYYY");
                appendDateTimeItem(listingDateTimeContainer, formattedDate, '', '', i);
                listingSelectedDatesTextBox.val(selectedDates);
              }

              //dropdown time selector functions
              DropdownTimeSelector(listingDateTimeContainer);
            }
          }
        }
      },
      prev: function (info, context) {
        setTimeout(function () {
          PopulateDateTimes(listingDateTimeContainer);
        }, 50);
      },
      next: function (info, context) {
        setTimeout(function () {
          PopulateDateTimes(listingDateTimeContainer);
        }, 50);
      }
    });

    DayPickerSettings();
    PopulateDateTimes(listingDateTimeContainer);
    validateDateTimes();
  }

  function DropdownTimeSelector(listingDateTimeContainer) {
    let btnToggle, dropdownItem, selectedDropdownItem;
    let dateTimeItem;

    dateTimeItem = listingDateTimeContainer.find('.date-time-item');
    dateTimeItem.find('.dropdown').each(function () {
      let dropdownStartTime = $(this).hasClass('selectedStartTime');
      $(this).on('show.bs.dropdown', function () {
        btnToggle = $(this).find('.dropdown-toggle');
        dropdownItem = $(this).find('.dropdown-menu .dropdown-item');
        btnToggle.removeClass('text-danger').parent().removeClass('has-error');
        dropdownItem.click(function (e) {
          selectedDropdownItem = $(this).text();
          if (dropdownStartTime) {
            btnToggle.attr('data-start-time', selectedDropdownItem);
          } else {
            btnToggle.attr('data-end-time', selectedDropdownItem);
          }
          btnToggle.find('.text').text(selectedDropdownItem);
          e.preventDefault();
        });
      })
    });
  }

  function DayPickerSettings() {
    let DayPickerContainer = $('.optionset-day');
    DayPickerContainer.each(function () {
      let _this = $(this);
      let checkbox, startTimePicker, endTimePicker;

      checkbox = _this.find('input[type="checkbox"]');
      startTimePicker =  _this.find('.selectedStartTime');
      endTimePicker   =  _this.find('.selectedEndTime');
      if (checkbox.prop('checked')) {
        startTimePicker.removeClass('disabled');
      }
      checkbox.change(function() {
        if(this.checked) {
          startTimePicker.removeClass('disabled');
          endTimePicker.removeClass('disabled');
        } else {
          startTimePicker.addClass('disabled');
          endTimePicker.addClass('disabled');
        }
      });
    });
  }

  function PopulateDateTimes(listingDateTimeContainer) {
    let listingSelectedStartTimeTextBox, listingSelectedEndTimeTextBox, listingSelectedDatesTextBox;

    let selectedDates, selectedStartTime, selectedEndTime;

    listingSelectedDatesTextBox = $('input[name="SelectedDates"]').val();
    listingSelectedStartTimeTextBox = $('input[name="SelectedStartTimes"]').val();
    listingSelectedEndTimeTextBox = $('input[name="SelectedEndTimes"]').val();

    if (listingSelectedDatesTextBox) {

      selectedDates = listingSelectedDatesTextBox.split(",");
      selectedStartTime = listingSelectedStartTimeTextBox.split(",");
      selectedEndTime = listingSelectedEndTimeTextBox.split(",");

      for (let i = 0; i < selectedDates.length; i++) {
        //populate Calendar
        let CalendarDateFormat = moment(selectedDates[i]).format('YYYY-MM-DD');
        let EventDateFormat = moment(selectedDates[i]).format("DD MMMM YYYY");

        let unit = $('.pignose-calendar-unit[data-date=' + CalendarDateFormat + ']');
        if (i === 0) {
          unit.addClass('pignose-calendar-unit-active pignose-calendar-unit-first-active');
        } else if (i !== 0 && i === selectedDates.length - 2) {
          if (selectedDates.length < 4) {
            unit.addClass('pignose-calendar-unit-range pignose-calendar-unit-range-first pignose-calendar-unit-range-last');
          } else {
            unit.addClass('pignose-calendar-unit-range pignose-calendar-unit-range-last');
          }
        } else if (i === selectedDates.length - 1) {
          unit.addClass('pignose-calendar-unit-active pignose-calendar-unit-second-active');
        } else {
          if (selectedDates.length > 3) {
            if (i === 1) {
              unit.addClass('pignose-calendar-unit-range pignose-calendar-unit-range-first');
            } else {
              unit.addClass('pignose-calendar-unit-range');
            }
          }
        }

        //populate event dates
        appendDateTimeItem(listingDateTimeContainer, EventDateFormat, selectedStartTime[i], selectedEndTime[i], i);

        //dropdown time selector functions
        DropdownTimeSelector(listingDateTimeContainer);
      }
    }
  }

  function validateDateTimes() {
    const errorTimeMessage = 'Please add specific time.', errorDateMessage = 'Please select specific dates above.';

    let endTime, startTime;
    let form, dropdownBtnAttr;
    let actionBtnNext, errorField, errorMessage, errorFlag;
    let listingDateTimeContainer, listingDateTimeItem;

    let listingSelectedStartTimeTextBox, listingSelectedEndTimeTextBox;
    let startTimeArray, endTimeArray;

    let ListingForm_ListingForm_ByAppointment = $('#ListingForm_ListingForm_ByAppointment');
    let isByAppointment = ListingForm_ListingForm_ByAppointment.find('input[name="ByAppointment"]:checked').val();

    form = $('#ListingForm_ListingForm');
    listingSelectedStartTimeTextBox = $('input[name="SelectedStartTimes"]');
    listingSelectedEndTimeTextBox = $('input[name="SelectedEndTimes"]');

    actionBtnNext = $('#ListingForm_ListingForm_action_next');
    errorField = $('.error-field');

    form.on('click', actionBtnNext, function (e) {
      errorFlag = false;
      startTimeArray = [];
      endTimeArray = [];
      listingDateTimeContainer = $('.listingDateTimes');
      dropdownBtnAttr = $(e.target).attr('data-step')
      if (isByAppointment.val() !== '1') {
        if (dropdownBtnAttr === 'date-time') {
          listingDateTimeItem = listingDateTimeContainer.find('.date-time-item');
          if (listingDateTimeItem.length > 0) { //check if user selected date from calendar
            listingDateTimeItem.each(function () {
              let appointmentIsChecked = $(this).find('input[name="appointment_only"]').prop('checked');
              // if (!appointmentIsChecked) {
              // validate if all dropdown start time is selected
              $(this).find('.dropdown').each(function () {
                if ($(this).hasClass('selectedStartTime')) {
                  startTime = $(this).find('button').attr('data-start-time');
                  if (startTime === null || startTime === "undefined" || !startTime) {
                    $(this).addClass('has-error text-danger');
                    errorFlag = true;
                    errorMessage = errorTimeMessage;
                  } else {
                    startTimeArray.push(startTime);
                  }
                }
                if ($(this).hasClass('selectedEndTime')) {
                  endTime = $(this).find('button').attr('data-end-time');
                  if (endTime === null || endTime === "undefined" || !endTime) {
                    $(this).addClass('has-error text-danger');
                    errorFlag = true;
                    errorMessage = errorTimeMessage;
                  } else {
                    endTimeArray.push(endTime);
                  }
                }
              });
              // } else {
              //   const appointment = 'Appointment Only';
              //
              //   $(this).find('.dropdown').removeClass('has-error text-danger');
              //   startTimeArray.push(appointment);
              //   endTimeArray.push(appointment);
              // }
            })
          } else {
            errorFlag = true;
            errorMessage = errorDateMessage;
          }
          if (startTimeArray.length > 0) {
            listingSelectedStartTimeTextBox.val(startTimeArray.toString());
          }
          if (endTimeArray.length > 0) {
            listingSelectedEndTimeTextBox.val(endTimeArray.toString());
          }
          if (errorFlag) {
            showError(errorMessage, errorField);
            e.preventDefault();
          }
        }
      }
    });
  }

  function appendDateTimeItem(elem, date, startTime, endTime, id) {
    let startTimeText = startTime;
    let endTimeText = endTime;

    let startTimeDisabled = '';
    let endTimeDisabled = '';

    let appointment = '';

    if (!startTime || startTime === 'Appointment Only') {
      startTimeText = 'Select start time';
      if (startTime === 'Appointment Only') {
        startTimeDisabled = 'disabled';
        appointment = 'checked';
      }
    }

    if (!endTime || endTime === 'Appointment Only') {
      endTimeText = 'Select end time';
      if (endTime === 'Appointment Only') {
        endTimeDisabled = 'disabled';
        appointment = 'checked';
      }
    }

    elem.append('' +
      '<div class="date-time-item row pb-lg-0 pb-4 d-flex align-items-end">' +
      '<div class="col-lg-4 pb-4"><div class="selectedDate"><span class="text text-tundora">' + date + '</span></div></div>' + //<span class="btn-remove"><i class="fal fa-times"></i>
      '<div class="col-lg-4 col-6 pb-4">' +
      '<div class="selectedStartTime dropdown">' +
      '<button class="dropdown-toggle" ' + startTimeDisabled + ' type="button" id="startDate' + id + '" data-start-time="' + startTime + '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="text">' + startTimeText + '</span><span class="btn-arrowdown"><i class="fal fa-angle-down"></i></button>' +
      '<div class="dropdown-menu" aria-labelledby="startDate' + id + '">' + timeOptions(0) + '</div>' +
      '</div>' +
      '</div>' +
      '<div class="col-lg-4 col-6 pb-4">' +
      '<div class="selectedEndTime dropdown">' +
      '<button class="dropdown-toggle" ' + endTimeDisabled + ' type="button" id="endDate' + id + '" data-end-time="' + endTime + '" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="text">' + endTimeText + '</span><span class="btn-arrowdown"><i class="fal fa-angle-down"></i></button>' +
      '<div class="dropdown-menu" aria-labelledby="endDate' + id + '"></div>' +
      '</div>' +
      '</div>' +
      // '<div class="col-lg-3 pb-4">' +
      //   '<div class="appointment d-flex align-items-center">' +
      //     '<input type="checkbox" name="appointment_only" id="appointmentOnly'+id+'" ' + appointment + '> ' +
      //     '<label class="ml-2 mb-0" for="appointmentOnly'+id+'"><span class="font-weight-normal">Appointment only</span></label>' +
      //   '</div>' +
      // '</div>' +
      '</div>');

    //Disable time selector when toggled
    let inputAppointment = elem.find('input[name="appointment_only"]');
    inputAppointment.change(function () {
      let dropdown = $(this).parent().parent().siblings();
      if (this.checked) {
        dropdown.find('.selectedStartTime').removeClass('has-error text-danger');
        dropdown.find('.selectedStartTime button').find('.text').text('Select start time');
        dropdown.find('.selectedStartTime button').prop("disabled", true);
        dropdown.find('.selectedEndTime').removeClass('has-error text-danger');
        dropdown.find('.selectedEndTime button').find('.text').text('Select end time');
        dropdown.find('.selectedEndTime button').prop("disabled", true);
      } else {
        dropdown.find('button').prop("disabled", false);
        dropdown.find('.selectedStartTime button').attr('data-start-time', '');
        dropdown.find('.selectedEndTime button').attr('data-end-time', '');
      }
    });

    elem.find('.selectedStartTime.dropdown').on('show.bs.dropdown', function () {
      let _this = $(this);
      let dropdownItem = _this.find('.dropdown-menu .dropdown-item');
      dropdownItem.click(function (e) {
        let index = parseInt($(this).attr('data-index')) + 1;
        _this.parent().siblings().find('.dropdown-toggle .text').text('Select end time');
        _this.parent().siblings().find('.dropdown-menu').empty().append(timeOptions(index));
      });
    });
  }

  function timeOptions(index) {
    let options = '';
    const arrayTimes =
      ['6:00 am', '7:00 am', '8:00 am', '9:00 am', '10:00 am',
        '11:00 am', '10:00 am', '11:00 am', '12:00 pm', '1:00 pm',
        '2:00 pm', '3:00 pm', '4:00 pm', '5:00 pm', '6:00 pm',
        '7:00 pm', '8:00 pm', '9:00 pm', '10:00 pm', '11:00 pm',
        '12:00 am', '1:00 am', '2:00 am',
      ];

    for (let i = index; i < arrayTimes.length; i++) {
      options += '<a class="dropdown-item" href="#" data-index="' + i + '"><span class="text-tundora">' + arrayTimes[i] + '</span></a>';
    }
    return options;
  }

  function showError(err, elem) {
    elem.find('.text-danger').remove();
    return elem.addClass('show').append('<span class="text-danger">' + err + '</span>');
  }

  function ListingLocation() {
    let BuildingName, Town, Address, PostCode;

    BuildingName = $('#ListingForm_ListingForm_BuildingName');
    Town         = $('#ListingForm_ListingForm_Town');
    Address      = $('#ListingForm_ListingForm_Address');
    PostCode     = $('#ListingForm_ListingForm_Postcode');

    let isEventOnline = $('#ListingForm_ListingForm_IsOnline');
    let checkedRadio = isEventOnline.find('input[name="IsOnline"]:checked').val();
    if (checkedRadio === '1') {
      BuildingName.prop("disabled", true);
      Town.prop("disabled", true);
      Address.prop("disabled", true);
      PostCode.prop("disabled", true);
    } else {
      BuildingName.prop("disabled", false);
      Town.prop("disabled", false);
      Address.prop("disabled", false);
      PostCode.prop("disabled", false);
    }
    isEventOnline.find('input[type="radio"]').on('change', function () {
      if ($(this).val() === '1') {
        BuildingName.prop("disabled", true);
        Town.prop("disabled", true);
        Address.prop("disabled", true);
        PostCode.prop("disabled", true);;
      } else {
        BuildingName.prop("disabled", false);
        Town.prop("disabled", false);
        Address.prop("disabled", false);
        PostCode.prop("disabled", false);
      }
    });
  }

  function ListingPriceStep() {
    let GeneralAdmission, Student, Child, Senior, Other;
    GeneralAdmission = $('#ListingForm_ListingForm_GeneralAdmissionPrice');
    Student          = $('#ListingForm_ListingForm_StudentPrice');
    Child            = $('#ListingForm_ListingForm_ChildPrice');
    Senior           = $('#ListingForm_ListingForm_SeniorPrice');
    Other            = $('#ListingForm_ListingForm_OtherPrice');

    let isEventFreeRadio = $('#ListingForm_ListingForm_IsEventFree');
    let pricesInputTextContainer = $('.price-inputs');
    let checkedRadio = isEventFreeRadio.find('input[name="IsEventFree"]:checked').val();
    console.log(checkedRadio);
    if (checkedRadio === '1') {
      pricesInputTextContainer.addClass('d-none');
      GeneralAdmission.prop("disabled", true);
      Student.prop("disabled", true);
      Child.prop("disabled", true);
      Senior.prop("disabled", true);
      Other.prop("disabled", true);
    } else {
      pricesInputTextContainer.removeClass('d-none');
      GeneralAdmission.prop("disabled", false);
      Student.prop("disabled", false);
      Child.prop("disabled", false);
      Senior.prop("disabled", false);
      Other.prop("disabled", false);
    }
    isEventFreeRadio.find('input[type="radio"]').on('change', function () {
      if ($(this).val() === '1') {
        pricesInputTextContainer.addClass('d-none');
        GeneralAdmission.prop("disabled", true);
        Student.prop("disabled", true);
        Child.prop("disabled", true);
        Senior.prop("disabled", true);
        Other.prop("disabled", true);
      } else {
        pricesInputTextContainer.removeClass('d-none');
        GeneralAdmission.prop("disabled", false);
        Student.prop("disabled", false);
        Child.prop("disabled", false);
        Senior.prop("disabled", false);
        Other.prop("disabled", false);
      }
    });
  }

  function ListingUploadImages() {
    let featuredImageDropZone, galleryImagesDropzone, listingLogoDropzone;
    let featuredImageLi, galleryImagesLi, listingLogoImageLi;
    let featuredImageLiFileLink, listingLogoLiFileLink;

    featuredImageDropZone = $('#FeaturedImageDropzone');
    galleryImagesDropzone = $('#GalleryImagesDropzone');
    listingLogoDropzone = $('#ListingLogoDropzone');

    featuredImageLi = featuredImageDropZone.find('ul.file-attachment-field-previews li');
    featuredImageLiFileLink = featuredImageLi.attr('data-file-link');
    featuredImageLi.find('span.file-icon img').attr('src', featuredImageLiFileLink);

    galleryImagesLi = galleryImagesDropzone.find('ul.file-attachment-field-previews li');
    galleryImagesLi.each(function () {
      let galleryImagesLiFileLink = $(this).attr('data-file-link');
      $(this).find('span.file-icon img').attr('src', galleryImagesLiFileLink);
    });

    listingLogoImageLi = listingLogoDropzone.find('ul.file-attachment-field-previews li');
    listingLogoLiFileLink = listingLogoImageLi.attr('data-file-link');
    listingLogoImageLi.find('span.file-icon img').attr('src', listingLogoLiFileLink);
  }

  function addToFavourites() {
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

  function showTags() {
    $('.see-more').click(function () {
      if ($(this).hasClass('toggled')) {
        $(this).removeClass('toggled');
        $(this).parent().siblings('.more-tags').removeClass('show');
      } else {
        $(this).addClass('toggled');
        $(this).parent().siblings('.more-tags').addClass('show');
      }
    });
  }

  function showMoreNews() {
    let sectionLatestNews = $('.sectionLatestNews');
    let sectionFilteredNews = $('.sectionFilteredNews');
    if (sectionLatestNews.length > 0 || sectionFilteredNews.length > 0) {
      $(".news-item").slice(0, 4).show();
      $(".loadmore-news").on('click', function (e) {
        e.preventDefault();
        $(".news-item:hidden").slice(0, 4).slideDown();
        if ($(".news-item:hidden").length === 0) {
          $(".loadmore-news").hide;
        }
      });
    }
  }

  function showShareSocials() {
    $('.sharelisting').click(function () {
      let _this = $(this);
      if (_this.hasClass('active')) {
        _this.removeClass('active');
        $('.share-socials--dropdown').removeClass('active');
      } else {
        _this.addClass('active');
        $('.share-socials--dropdown').addClass('active');
      }
    });
  }

  function sliderTags() {
    // var flky = new Flickity( '.tag-test ', {
    //   pageDots: false,
    // });
  }

  function newsletter()
  {
    $('#modal-newsletter .close').click(function () {
      let url= document.location.href;
      window.history.pushState({}, "", url.split("?")[0]);
      window.history.replaceState({}, '', url.split("?")[0]);
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

  function accountSettings()
  {
    let AccountForm_AccountForm = $('#AccountForm_AccountForm');
    if (AccountForm_AccountForm.length > 0) {
      // let requiredPassword = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()+=-\?;,./{}|\":<>\[\]\\\' ~_]).{10,20}/;///^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{10,20}$/;
      // AccountForm_AccountForm.on('submit', function (event) {
      //   let error = false;
      //   event.preventDefault();
      //   let cpFields = $('.change-password-fields');
      //   if (cpFields.hasClass('active')) {
      //     let AccountForm_AccountForm_NewPassword = $('#AccountForm_AccountForm_NewPassword');
      //     let AccountForm_AccountForm_ConfirmPassword = $('#AccountForm_AccountForm_ConfirmPassword');
      //     if (AccountForm_AccountForm_NewPassword.val() !== AccountForm_AccountForm_ConfirmPassword.val()) {
      //       error = true;
      //       AccountForm_AccountForm_NewPassword.parent().append('<div class="error-field"><span class="text-danger fontsize12 font-weight-book">The password confirmation does not match your password.</span></div>')
      //     }
      //
      //     if (!requiredPassword.test(AccountForm_AccountForm_NewPassword.val())) {
      //
      //     }
      //   }
      //   // setTimeout(function () {
      //   //     if (error === false) {
      //   //         event.currentTarget.submit();
      //   //     }
      //   // },1000);
      // });
    }
  }

  function otherSettings()
  {
    let urlHash = window.location.href.split("#")[1];
    if (urlHash) {
      let hash = $("#"+ urlHash);
      let target_offset_top = hash.offset().top;
      hash.find('button[data-toggle="collapse"]').trigger('click');
      $('html,body').animate({scrollTop: target_offset_top - 200});
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
