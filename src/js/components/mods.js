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

    //Page
    listingPage();
    signUpPage();
    createListingPage();
    articlePage();

    //Actions
    addToFavourites();
    showTags();
    showMoreNews();
    showShareSocials();
    sliderTags();

    closeModal();
    //testAjax();
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

  function closeSearchForm()
  {
    let searchForm = $('.site-header-search');
    let closeBtn  = searchForm.find('.btn-close');

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
            btnToggle.find('span').attr('data-keyword',selectedDropdownItem.attr('data-keyword'));
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
                  $.map(datesArray, function (date, i)  {
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
        let params = "";
        let filters = $(this).parent().parent('.filters').find('.filter-item');
        filters.each(function () {
          let date = $(this).find('.filterDate .dropdown-toggle span').attr('data-keyword');
          let dateRange = $(this).find('.filterDate .dropdown-toggle span').text();
          let location = $(this).find('.filterLocation .dropdown-toggle span').attr('data-keyword');
          let category = $(this).find('.filterCategory .dropdown-toggle span').attr('data-keyword');
          let keywords = $(this).find('.filterKeywords input').val();
            if (date) {
              params += "?date=" + date + "&daterange=" +dateRange;
            }
            if (location) {
              params += "&location=" + location;
            }
            if (category) {
              params += "&category="+category;
            }
            if (keywords) {
              params +="&keywords="+keywords;
            }
            if (keywords === "") {
              params +="&keywords=";
            }
        });
        if (params) {
          window.location = url+params+'#sortable-listings';
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
        navText: ['<span class="nav-left"><img src="_resources/themes/starter/dist/images/arrow-left.svg"> </span>', '<span class="nav-right"><img src="_resources/themes/starter/dist/images/arrow-right.svg"></span>'],
        responsive:{
          0:{
            nav:true,
            stagePadding: 0,
            margin: 10,
          },
          669: {
            stagePadding: 20,
            margin: 20,
          },
          992: {
            stagePadding: 40,
            margin: 40,
          },
          1590: {
            stagePadding: 330,
            margin: 100,
          }
        }
      });
    }
  }

  function listingPage() {
    let listingPage = $('.ListingPage');
    if (listingPage.length > 0) {
      let listingPageGallery = listingPage.find('.owl-carousel');
      listingPageGallery.owlCarousel({
        items: 2,
        loop: true,
        margin: 26,
        nav: true,
        dots: true,
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

  function articlePage()
  {
    let articleGallery = $('.article-gallery');
    if (articleGallery.length > 0) {
      let gallery = articleGallery.find('.owl-carousel');
      gallery.owlCarousel({
        items: 2,
        loop: true,
        margin: 26,
        nav: true,
        dots: true,
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
      let input, categorySelector, selectedCategories = [], passwordField, passwordConfirmField,
        emailField, emailConfirmField, selectedCategoryField;

      let requiredPassword = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()+=-\?;,./{}|\":<>\[\]\\\' ~_]).{10,20}/;///^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{10,20}$/;

      emailField = $('#RegistrationForm_RegistrationForm_Email');
      emailConfirmField = $('#RegistrationForm_RegistrationForm_ConfirmEmail');

      passwordField = $('#RegistrationForm_RegistrationForm_Password_Holder');
      passwordConfirmField = $('#RegistrationForm_RegistrationForm_ConfirmPassword_Holder');

      selectedCategoryField = $('#RegistrationForm_RegistrationForm_SelectedCategories');
      categorySelector = $('.category-selector');

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
              emailField.parent().addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_Email" class="invalid-feedback" role="alert" aria-atomic="true">An account with email '+ $.trim(emailField.val()) +' already exists.</div>');
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
              console.log(error);
              event.currentTarget.submit();
            }
          },1000);
        }
      });

      //Category suggestions
      if (categorySelector.length > 0) {
        categorySelector.find('.form-check-input').each(function () {
          if (this.checked) {
            selectedCategories.push($(this).attr('name'));
          }
        });
        categorySelector.on('change', '.form-check-input', function () {
          let parent = $(this).parent('.form-check');
          if (this.checked) {
            parent.addClass('selected');
            selectedCategories.push($(this).attr('name'));
          } else {
            parent.removeClass('selected');
            selectedCategories.splice($.inArray($(this).attr('name'), selectedCategories), 1);
          }
          selectedCategoryField.val(selectedCategories.toString());
        });
      }
    }
  }

  function inputType(input, _this)
  {
    if (input.attr('type') === 'password') {
      input.attr('type', 'text');
      _this.find('span').text('Hide');
    } else {
      input.attr('type', 'password');
      _this.find('span').text('Show');
    }
  }

  function closeModal()
  {
    let modal = $('.modal');
    modal.find('button.close').click(function () {
      modal.removeClass('show');
      modal.css('display', 'none');
    });
  }

  function createListingPage()
  {
    let createListingForm = $('#ListingForm_ListingForm');
    if (createListingForm.length > 0)
    {
      //ListingCategoryStep
      ListingCategoryStep(createListingForm);

      //ListingDateAndTimeStep
      ListingDateAndTimeStep();

      //ListingPriceStep
      ListingPriceStep()

      //ListingUploadImages
      ListingUploadImages()
    }
  }

  function ListingCategoryStep(form)
  {
    let selectedCategoryHolder, selectedCategoryText,
        selectedSubCategoryHolder, selectedSubCategoryText,
        selectedTagsHolder, selectedTagsText,
        selectedTagsArray = [];

    let categoryError, tagError, actionBtn;

    categoryError = $('.category-error');
    tagError      = $('.tag-error');

    actionBtn     = $('#ListingForm_ListingForm_action_next');

    selectedCategoryText    = $('input[name="Categories"]');
    selectedSubCategoryText = $('input[name="SubCategories"]');
    selectedTagsText        = $('input[name="Tags"]');

    form.find('select').each(function () {
      let $this           = $(this),
          dataType        = $(this).attr('data-type'),
          firstData       = $(this).attr('data-first'),
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

        selectedCategoryHolder    = $('.selected-category');
        selectedSubCategoryHolder = $('.selected-subcategory');
        selectedTagsHolder        = $('.selected-tags');

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
            let item = selectedTagsHolder.find('.item-holder .text:contains('+selectedItem.text()+')');
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
                    list.find('li[rel="'+data[i].id+'"]').addClass('show');
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
    subCategoryWrapper= $('.sub-category-wrapper');

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

    actionBtn.click(function (e) {
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
    });
    loadSelectedCategoriesAndTags(selectedCategoryText, selectedSubCategoryText, selectedTagsText);
  }

  function removeSelectedItem(category, subcategory, tags)
  {
    let dataType;
    let _this, parentDiv, btnRemove = $('.remove-item'),
        categorySelectorHolder, subcategorySelectorHolder, tagSelectorHolder;

    let tagArrays = [];

    categorySelectorHolder    = $('#ListingForm_ListingForm_CategorySelector_Holder');
    subcategorySelectorHolder = $('#ListingForm_ListingForm_SubCategorySelector_Holder');
    tagSelectorHolder         = $('#ListingForm_ListingForm_TagsSelector_Holder');

    btnRemove.click(function () {
      _this = $(this);
      parentDiv = _this.parent().parent().parent();
      dataType  = parentDiv.attr('data-type');
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
        tagSelectorHolder.find('.options li:contains('+_this.siblings().text()+')').removeClass('selected');
      }
    });
  }

  function loadSelectedCategoriesAndTags(category, subcategory, tags)
  {
    let selectedCategoryHolder, selectedSubCategoryHolder, selectedTagsHolder,
        categorySelectorHolder, subcategorySelectorHolder, tagSelectorHolder;

    let btnAddSubCategory = $('.add-subcategory-btn');

    let tagArrays = [];

    selectedCategoryHolder    = $('.selected-category');
    selectedSubCategoryHolder = $('.selected-subcategory');
    selectedTagsHolder        = $('.selected-tags');

    categorySelectorHolder    = $('#ListingForm_ListingForm_CategorySelector_Holder');
    subcategorySelectorHolder = $('#ListingForm_ListingForm_SubCategorySelector_Holder');
    tagSelectorHolder         = $('#ListingForm_ListingForm_TagsSelector_Holder');

    if (category.val()) {
      categorySelectorHolder.find('.styledSelect').text(category.val());
      categorySelectorHolder.find('.options li:contains('+category.val()+')').addClass('selected');
      selectedCategoryHolder.addClass('has-item');
      selectedCategoryHolder.find('.item-holder').append('<div class="item"><span class="text">' + category.val() + '</span><span class="remove-item">X</span></div>');
    }

    if (subcategory.val()) {
      btnAddSubCategory.addClass('active').find('i').removeClass('fa-plus-circle').addClass('fa-minus-circle');
      subcategorySelectorHolder.parent().addClass('active');
      subcategorySelectorHolder.find('.styledSelect').text(subcategory.val());
      subcategorySelectorHolder.find('.options li:contains('+subcategory.val()+')').addClass('selected');
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
                if(jQuery.inArray($.trim($(this).text()), liShown) === -1) {
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
              if(jQuery.inArray($.trim($(this).text()), liTagShown) === -1) {
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
            if(jQuery.inArray($.trim($(this).text()), liTagShown) === -1) {
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

  function ListingDateAndTimeStep()
  {
    let calendar, selectedDateRange, datesArray, formattedDate,
        listingDateTimeContainer, listingSelectedDatesTextBox,
        listingSelectedStartTimeTextBox, listingSelectedEndTimeTextBox;

    listingDateTimeContainer    = $('.listingDateTimes');
    listingSelectedDatesTextBox = $('input[name="SelectedDates"]');
    listingSelectedStartTimeTextBox = $('input[name="SelectedStartTimes"]');
    listingSelectedEndTimeTextBox   = $('input[name="SelectedEndTimes"]');

    calendar = $('.calendar-datepicker');
    calendar.pignoseCalendar({
      multiple: true,
      initialize: false,
      week: 1,
      weeks: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
      select: function(dates, context) { //date selection
        let selectedDates = [];
        //removing selected date values textbox
        listingSelectedDatesTextBox.val('');
        listingSelectedStartTimeTextBox.val('');
        listingSelectedEndTimeTextBox.val('');
        if (dates.length > 0) {
          listingDateTimeContainer.find('.date-time-item').remove();
          for(let i = 0; i < dates.length; i ++) {
            if (dates[i] !== null) {
              selectedDates.push(dates[i].format("DD MMMM YYYY"));
              if (selectedDates.length > 1) {
                let rangeOfDatesArray = [];
                listingDateTimeContainer.empty();
                selectedDateRange = moment.range(moment(dates[0]), moment(dates[1]));
                datesArray = Array.from(selectedDateRange.by("days"));
                $.map(datesArray, function (date, i)  {
                  formattedDate = date.format("DD MMMM YYYY");
                  rangeOfDatesArray.push(formattedDate);
                  appendDateTimeItem(listingDateTimeContainer, formattedDate, '', '' , i);
                });
                listingSelectedDatesTextBox.val(rangeOfDatesArray);
              } else {
                formattedDate = dates[i].format("DD MMMM YYYY");
                appendDateTimeItem(listingDateTimeContainer, formattedDate, '', '' , i);
                listingSelectedDatesTextBox.val(selectedDates);
              }


              //dropdown time selector functions
              DropdownTimeSelector(listingDateTimeContainer);
            }
          }
        }
      },
      prev: function(info, context) {
        setTimeout(function () {
          PopulateDateTimes(listingDateTimeContainer);
        }, 50);
      },
      next: function(info, context) {
        setTimeout(function () {
          PopulateDateTimes(listingDateTimeContainer);
        }, 50);
      }
    });

    PopulateDateTimes(listingDateTimeContainer);
    validateDateTimes();
  }

  function DropdownTimeSelector(listingDateTimeContainer)
  {
    let btnToggle, dropdownItem, selectedDropdownItem;
    let dateTimeItem;

    dateTimeItem = listingDateTimeContainer.find('.date-time-item');
    dateTimeItem.find('.dropdown').each(function() {
      let dropdownStartTime = $(this).hasClass('selectedStartTime');
      $(this).on('show.bs.dropdown', function () {
        btnToggle = $(this).find('.dropdown-toggle');
        dropdownItem = $(this).find('.dropdown-menu .dropdown-item');
        btnToggle.removeClass('text-danger').parent().removeClass('has-error');
        dropdownItem.click(function(e) {
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

  function PopulateDateTimes(listingDateTimeContainer)
  {
    let listingSelectedStartTimeTextBox, listingSelectedEndTimeTextBox, listingSelectedDatesTextBox;

    let selectedDates, selectedStartTime, selectedEndTime;

    listingSelectedDatesTextBox = $('input[name="SelectedDates"]').val();
    listingSelectedStartTimeTextBox = $('input[name="SelectedStartTimes"]').val();
    listingSelectedEndTimeTextBox   = $('input[name="SelectedEndTimes"]').val();

    if (listingSelectedDatesTextBox) {

      selectedDates     = listingSelectedDatesTextBox.split(",");
      selectedStartTime = listingSelectedStartTimeTextBox.split(",");
      selectedEndTime   = listingSelectedEndTimeTextBox.split(",");

      for (let i = 0; i < selectedDates.length; i++) {
        //populate Calendar
        let CalendarDateFormat = moment(selectedDates[i]).format('YYYY-MM-DD');
        let EventDateFormat    = moment(selectedDates[i]).format("DD MMMM YYYY");

        let unit = $('.pignose-calendar-unit[data-date='+ CalendarDateFormat +']');
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
        appendDateTimeItem(listingDateTimeContainer,EventDateFormat, selectedStartTime[i], selectedEndTime[i], i);

        //dropdown time selector functions
        DropdownTimeSelector(listingDateTimeContainer);
      }
    }
  }

  function validateDateTimes()
  {
    const errorTimeMessage = 'Please add specific time.', errorDateMessage = 'Please select specific dates above.';

    let endTime, startTime;
    let form, dropdownBtnAttr;
    let actionBtn, errorField, errorMessage, errorFlag;
    let listingDateTimeContainer, listingDateTimeItem;

    let listingSelectedStartTimeTextBox, listingSelectedEndTimeTextBox;
    let startTimeArray, endTimeArray;

    form = $('#ListingForm_ListingForm');

    listingSelectedStartTimeTextBox = $('input[name="SelectedStartTimes"]');
    listingSelectedEndTimeTextBox   = $('input[name="SelectedEndTimes"]');

    actionBtn = $('#ListingForm_ListingForm_action_next');
    errorField = $('.error-field');

    form.on('click', actionBtn, function (e) {
      errorFlag = false;
      startTimeArray = []; endTimeArray = [];
      listingDateTimeContainer  = $('.listingDateTimes');
      dropdownBtnAttr = $(e.target).attr('data-step')
      if (dropdownBtnAttr === 'date-time') {
        listingDateTimeItem = listingDateTimeContainer.find('.date-time-item');
        if (listingDateTimeItem.length > 0) { //check if user selected date from calendar
          listingDateTimeItem.each(function () {
            let appointmentIsChecked = $(this).find('input[name="appointment_only"]').prop('checked');
            if (!appointmentIsChecked) {
              // validate if all dropdown start time is selected
              $(this).find('.dropdown').each(function() {
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
                  if (endTime  === null || endTime === "undefined" || !endTime) {
                    $(this).addClass('has-error text-danger');
                    errorFlag = true;
                    errorMessage = errorTimeMessage;
                  } else {
                    endTimeArray.push(endTime);
                  }
                }
              });
            } else {
              const appointment = 'Appointment Only';

              $(this).find('.dropdown').removeClass('has-error text-danger');
              startTimeArray.push(appointment);
              endTimeArray.push(appointment);
            }
          })
        } else {
          errorFlag = true;
          errorMessage = errorDateMessage;
        }
        if (startTimeArray.length > 0){
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
    });
  }

  function appendDateTimeItem(elem, date, startTime, endTime, id)
  {
    let startTimeText = startTime;
    let endTimeText   = endTime;

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
    '<div class="date-time-item row d-flex align-items-end">' +
      '<div class="col-lg-3 pb-4"><div class="selectedDate"><span class="text">' + date + '</span></div></div>' + //<span class="btn-remove"><i class="fal fa-times"></i>
      '<div class="col-lg-3 pb-4">' +
        '<div class="selectedStartTime dropdown">' +
          '<button class="dropdown-toggle" '+ startTimeDisabled +' type="button" id="startDate'+ id +'" data-start-time="'+startTime+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="text">'+ startTimeText +'</span><span class="btn-arrowdown"><i class="fal fa-angle-down"></i></button>' +
          '<div class="dropdown-menu" aria-labelledby="startDate'+id+'">' + timeOptions(0) + '</div>' +
        '</div>' +
      '</div>' +
      '<div class="col-lg-3 pb-4">' +
        '<div class="selectedEndTime dropdown">' +
          '<button class="dropdown-toggle" '+ endTimeDisabled +' type="button" id="endDate'+ id +'" data-end-time="'+endTime+'" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="text">'+ endTimeText +'</span><span class="btn-arrowdown"><i class="fal fa-angle-down"></i></button>' +
          '<div class="dropdown-menu" aria-labelledby="endDate'+id+'"></div>' +
        '</div>' +
      '</div>' +
      '<div class="col-lg-3 pb-4">' +
        '<div class="appointment d-flex align-items-center">' +
          '<input type="checkbox" name="appointment_only" id="appointmentOnly'+id+'" ' + appointment + '> ' +
          '<label class="ml-2 mb-0" for="appointmentOnly'+id+'"><span class="font-weight-normal">Appointment only</span></label>' +
        '</div>' +
      '</div>' +
    '</div>');

    //Disable time selector when toggled
    let inputAppointment = elem.find('input[name="appointment_only"]');
    inputAppointment.change(function() {
      let dropdown  = $(this).parent().parent().siblings();
      if(this.checked) {
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

  function timeOptions(index)
  {
    let options = '';
    const arrayTimes =
      [ '6:00 am', '7:00 am', '8:00 am', '9:00 am', '10:00 am',
        '11:00 am', '10:00 am', '11:00 am', '12:00 pm', '1:00 pm',
        '2:00 pm', '3:00 pm', '4:00 pm', '5:00 pm', '6:00 pm',
        '7:00 pm', '8:00 pm', '9:00 pm', '10:00 pm', '11:00 pm',
        '12:00 am', '1:00 am', '2:00 am',
      ];

    for (let i = index; i < arrayTimes.length; i++) {
      options += '<a class="dropdown-item" href="#" data-index="' + i + '">' + arrayTimes[i] + '</a>';
    }
    return options;
  }

  function showError(err, elem)
  {
    elem.find('.text-danger').remove();
    return elem.addClass('show').append('<span class="text-danger">' + err + '</span>');
  }

  function ListingPriceStep()
  {
    let isEventFreeRadio = $('#ListingForm_ListingForm_isEventFree');
    let pricesInputTextContainer = $('.price-inputs');
    let checkedRadio = isEventFreeRadio.find('input[name="isEventFree"]:checked').val();
    if (checkedRadio === '1') {
      pricesInputTextContainer.addClass('d-none');
    } else {
      pricesInputTextContainer.removeClass('d-none');
    }
    isEventFreeRadio.find('input[type="radio"]').on('change', function() {
      if ($(this).val() === '1') {
        pricesInputTextContainer.addClass('d-none');
      } else {
        pricesInputTextContainer.removeClass('d-none');
      }
    });
  }

  function ListingUploadImages()
  {

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

  function showTags()
  {
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

  function showMoreNews()
  {
    let sectionLatestNews  = $('.sectionLatestNews');
    if (sectionLatestNews.length > 0) {
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
    $('.sharelisting').click(function() {
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

  function sliderTags()
  {
    // var flky = new Flickity( '.tag-test ', {
    //   pageDots: false,
    // });
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
