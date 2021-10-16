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
    HeaderSettings();

    //Sections

  }

  function HeaderSettings()
  {
   $('.close').click(function (){
     $('.alert').fadeOut();
   });
  }

  function featuredListings()
  {
    let sectionFeaturedEvents = $('.sectionFeaturedEvents');
    
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
