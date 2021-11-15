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
      let input, category, selectedCategories = [], passwordField, passwordConfirmField,
          emailField, emailConfirmField, selectedCategoryField,
          errorField, modal;

      let requiredPassword = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{10,20}$/;

      emailField           = $('#RegistrationForm_RegistrationForm_Email');
      emailConfirmField    = $('#RegistrationForm_RegistrationForm_ConfirmEmail');

      passwordField        = $('#RegistrationForm_RegistrationForm_Password_Holder');
      passwordConfirmField = $('#RegistrationForm_RegistrationForm_ConfirmPassword_Holder');

      selectedCategoryField = $('#RegistrationForm_RegistrationForm_SelectedCategories');
      category = $('.category-selector');

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

      //Email and Password Validation
      signUpForm.on('submit', function(event){
        if (passwordField.length > 0) {
          if (emailField.val() !== emailConfirmField.val()) {
            $('#message-RegistrationForm_RegistrationForm_ConfirmEmail').remove();
            emailConfirmField.addClass('holder-validation is-invalid');
            emailConfirmField.parent().addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_ConfirmEmail" class="invalid-feedback" role="alert" aria-atomic="true">The email confirmation does not match your email address.</div>');
            event.preventDefault();
          }

          if (passwordField.find('.password').val() !== passwordConfirmField.find('.password').val()) {
            $('#message-RegistrationForm_RegistrationForm_ConfirmPassword').remove();
            passwordConfirmField.find('.password').addClass('holder-validation is-invalid')
            passwordConfirmField.addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_ConfirmPassword" class="invalid-feedback position-absolute pt-1 pl-2 pr-2" role="alert" aria-atomic="true">The password confirmation does not match your password.</div>');
            event.preventDefault();
          }

          if(!requiredPassword.test(passwordField.find('.password').val())){
            $('#message-RegistrationForm_RegistrationForm_Password').remove();
            passwordField.find('.password').addClass('holder-validation is-invalid')
            passwordField.addClass('holder-validation has-error').append('<div id="message-RegistrationForm_RegistrationForm_Password" class="invalid-feedback position-absolute pt-1 pl-2 pr-2" role="alert" aria-atomic="true">Must be at least 10 and not longer than 20 characters, contain 1 upper/lowercase and one number and one special character.</div>');
            event.preventDefault();
          }
        }

          // if (category.length > 0) {
        //   let countFilledInputs = 0;
        //   categories.each(function () {
        //     let field = $(this).find('.form-control').val();
        //     if ($.trim(field).length > 0) {
        //       countFilledInputs = parseInt(countFilledInputs) + 1;
        //     }
        //   });
        //
        //   if (countFilledInputs < 1) {
        //     errorField.text('Select at least 1 category.')
        //     event.preventDefault();
        //   }
        // }
      });

      //Category suggestions
      if (category.length > 0) {
        category.find('.form-check-input').each(function () {
          if(this.checked) {
            selectedCategories.push($(this).attr('name'));
          }
        });
        category.on('change', '.form-check-input', function() {
          let parent = $(this).parent('.form-check');
          if(this.checked) {
            parent.addClass('selected');
            selectedCategories.push($(this).attr('name'));
          } else {
            parent.removeClass('selected');
            selectedCategories.splice($.inArray($(this).attr('name'), selectedCategories), 1);
          }
          selectedCategoryField.val(selectedCategories.toString());
        });
      }
      //ModalClose
      modal.find('button.close').click(function () {
        modal.removeClass('show');
        modal.css('display', 'none');
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
      let selectedCategory, selectedCategoryHolder, selectedSubCategoryHolder, selectedSubCategory,
          selectedTag, selectedTagHolder,
          btnAddSubCategory, subCategoryWrapper,
          ListingIsEventFree, currencyField;

      let tagArray = [];

      let modal = $('#successRegistration');


      selectedCategory = $('#ListingForm_ListingForm_Categories');
      selectedSubCategory = $('#ListingForm_ListingForm_SubCategories');
      selectedTag     = $('#ListingForm_ListingForm_Tags');

      selectedCategoryHolder = $('#ListingForm_ListingForm_CategorySelector_Holder');
      selectedSubCategoryHolder = $('#ListingForm_ListingForm_SubCategorySelector_Holder');
      selectedTagHolder = $('#ListingForm_ListingForm_TagsSelector_Holder');

      ListingIsEventFree = $('#ListingForm_ListingForm_isEventFree');

      currencyField = $('.currency-field');
      ListingIsEventFree.find('input[type="radio"]').on('change', function() {
        if ($(this).val() === '1') {
          currencyField.removeClass('d-none');
        } else {
          currencyField.addClass('d-none');
        }
      });


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

      // if (selectedCategoriesItem.length > 0) {
      //   selectedCategories.addClass('has-item');
      // }

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

          let selectedCategories, selectedCategoriesItem,
              selectedSubCategories, selectedSubCategoriesItem,
              selectedTags, selectedTagsItem;

          selectedCategories = $('.selected-categories');
          selectedCategoriesItem = selectedCategories.find('.item');
          selectedSubCategories = $('.selected-subcategories');
          selectedSubCategoriesItem = selectedSubCategories.find('.item');

          selectedTags = $('.selected-tags');
          selectedTagsItem = selectedTags.find('.item');

          if (dataType === 'category' || dataType === 'subcategory') {
            if ($(this).hasClass('active')) {
              $(this).removeClass('active');
            } else {
              $(this).siblings().removeClass('active')
              $(this).addClass('active');
              if (dataType === 'category') {
                selectedCategories.addClass('has-item');
                //Removing existing selected category
                selectedCategoriesItem.remove();
                selectedCategory.val($.trim($(this).text()));
                selectedCategories.append('<div class="item"><span>' + $(this).text() + '</span><span class="remove-item">X</span></div>');
              }

              if (dataType === 'subcategory') {
                selectedSubCategories.addClass('has-item');
                //Removing existing selected subcategory
                selectedSubCategoriesItem.remove();
                selectedSubCategory.val($.trim($(this).text()));
                selectedSubCategories.append('<div class="item"><span>' + $(this).text() + '</span><span class="remove-item">X</span></div>');
              }
            }
          }

          if (dataType === 'tag') {
            if ($(this).hasClass('active')) {
              $(this).removeClass('active');
            } else {
              $(this).addClass('active');
              selectedTags.addClass('has-item');
              tagArray.push($.trim($(this).text()));
              selectedTag.val(tagArray.toString());
              selectedTags.append('<div class="item"><span>' + $(this).text() + '</span><span class="remove-item" data-name="'+ $.trim($(this).text()) +'">X</span></div>');
            }
          }


          /* alert($this.val()); Uncomment this for demonstration! */
        });

        // Hides the unordered list when clicking outside of it
        $(document).click(function () {
          $styledSelect.removeClass('active');
          $list.hide();
        });
      });

      //Preloader items
      if (selectedCategory.val()) {
        let preLoadselectedCategories = $('.selected-categories');
        selectedCategoryHolder.find('.styledSelect').text(selectedCategory.val())
        selectedCategoryHolder.find('.options li:contains('+selectedCategory.val()+')').addClass('active');
        preLoadselectedCategories.addClass('has-item');
        preLoadselectedCategories.append('<div class="item"><span>' + selectedCategory.val() + '</span><span class="remove-item">X</span></div>');
      }

      if (selectedSubCategory.val()) {
        let preLoadselectedSubCategories = $('.selected-subcategories');
        btnAddSubCategory.addClass('active');
        btnAddSubCategory.find('i').removeClass('fa-plus-circle').addClass('fa-minus-circle');
        subCategoryWrapper.addClass('active');
        selectedSubCategoryHolder.find('.styledSelect').text(selectedSubCategory.val())
        selectedSubCategoryHolder.find('.options li:contains('+selectedSubCategory.val()+')').addClass('active');
        preLoadselectedSubCategories.addClass('has-item');
        preLoadselectedSubCategories.append('<div class="item"><span>' + selectedSubCategory.val() + '</span><span class="remove-item">X</span></div>');
      }

      if (selectedTag.val()) {
        let tagsVal = selectedTag.val();
        let tagValArray = tagsVal.split(",");
        let preLoadselectedTag = $('.selected-tags');
        selectedTagHolder.find('.styledSelect').text(tagValArray[0])
        for (let i in tagValArray){
          console.log(tagValArray[i]);
          selectedTagHolder.find('.options li:contains('+tagValArray[i]+')').addClass('active');
          preLoadselectedTag.addClass('has-item');
          preLoadselectedTag.append('<div class="item"><span>' + tagValArray[i] + '</span><span class="remove-item">X</span></div>');
        }
      }

      $('.selected-categories .remove-item').click(function () {
        $(this).parent().parent('.selected-categories').removeClass('has-item');
        $(this).parent().remove();
        selectedCategory.val("");
      });

      $('.selected-subcategories .remove-item').click(function () {
        $(this).parent().parent('.selected-subcategories').removeClass('has-item');
        $(this).parent().remove();
        selectedSubCategory.val("");
      });

      $('.selected-tags .remove-item').click(function () {
        selectedSubCategoryHolder.find('.options li:contains('+$(this).attr('data-name')+')').addClass('active');
        $(this).parent().remove();
        tagArray.splice($.inArray($(this).attr('data-name'), tagArray), 1);
        selectedTag.val(tagArray.toString());
      });

      //ModalClose
      modal.find('button.close').click(function () {
        modal.removeClass('show');
        modal.css('display', 'none');
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
