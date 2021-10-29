<% include VisibleSection %>
<section class="page-section sectionListingPageContent col-lg-12 pt-lg-5 pb-lg-4 inner-padding">
    <div class="container-fluid p-0">
        <div class="row align-items-center listing-content">
            <div class="col-lg-6 pb-lg-5">
                <div class="listing-content--title">
                    <p><span class="fontsize50 font-weight-book">$Listing.Name</span></p>
                </div>
            </div>
            <div class="col-lg-6 pb-lg-5">
                <div class="listing-content--tags">
                    <% if $Listing.Tags %>
                        <% loop $Listing.Tags %>
                            <a href="#" class="tag-name mr-lg-3"><span class="halyard-display font-weight-medium fontsize16 text-uppercase text-underline">$Title</span></a>
                        <% end_loop %>
                    <% end_if %>
                    <button class="btn-utils addtofavourites pl-lg-3"><img src="$resourceURL('themes/starter/images/Icon feather-heart.png')" width="34.26" alt="$SiteConfig.Title - add to your favourites"> </button>
                    <button class="btn-utils sharelisting pl-lg-3"><img src="$resourceURL('themes/starter/images/Iconawesome-share-alt.svg')" alt="$SiteConfig.Title - share listing"> </button>
                    <button class="btn-utils downloadlisting pl-lg-3"><img src="$resourceURL('themes/starter/images/Iconawesome-download.svg')" alt="$SiteConfig.Title - download listing"> </button>
                    <button class="btn-utils getdirection pl-lg-3"><img src="$resourceURL('themes/starter/images/Icon-awesome-map.svg')" alt="$SiteConfig.Title - get direction"> </button>
                    <p><a href="#"><span class="theme-button-gray font-weight-medium fontsize18">Buy tickets</span></a></p>
                </div>
            </div>
        </div>
        <div class="row listing-content">
            <div class="col-lg-12 pb-lg-7">
                <div class="listing-content--img">
                    <img src="$Listing.FeaturedImage.URL" alt="$Listing.Name">
                </div>
            </div>
            <div class="col-lg-8">
                <div class="listing-content--details mb-lg-3">
                    $Listing.Content
                </div>
                <% if $Listing.GalleryImages %>
                    <div class="listing-content--gallery mt-lg-8">
                        <div class="owl-carousel">
                            <% loop $Listing.GalleryImages %>
                                <div class="gallery-image">
                                    <img src="$URL" alt="Listing gallery image">
                                </div>
                            <% end_loop %>
                        </div>
                    </div>
                <% end_if %>
                <hr class="mt-lg-6 mb-lg-5" style="border-color: #A2A2A2;">

                <div class="listing-content--tags">
                    <% if $Listing.Tags %>
                        <span class="halyard-display font-weight-medium fontsize25 text-uppercase letterspacing-3px">Tags</span>
                        <% loop $Listing.Tags %>
                            <a href="#" class="tag-name mr-lg-3 ml-lg-5"><span class="halyard-display font-weight-medium fontsize16 text-uppercase text-underline">$Title</span></a>
                        <% end_loop %>
                    <% end_if %>
                </div>
            </div>
            <div class="col-lg-3 offset-1">
                <div class="row">
                    <% if $Listing.VisibleListingDateAndTime %>
                    <div class="col-lg-2 pb-lg-2">
                        <img src="$resourceURL('themes/starter/images/icon-date-time.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 pb-lg-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Event dates & times</span></p>
                    </div>
                    <% end_if %>
                    <% loop $Listing.VisibleListingDateAndTime %>
                        <div class="col-lg-5 offset-2 pb-lg-1">
                            <p><span class="fontsize19 font-weight-book">$Date.Format('E, dd LLL')</span></p>
                        </div>
                        <div class="col-lg-5 pb-lg-1">
                            <p><span class="fontsize19 font-weight-book">$Time</span></p>
                        </div>
                    <% end_loop %>


                    <div class="col-lg-12 pt-lg-4 pb-lg-4">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <div class="col-lg-2 pb-lg-2">
                        <img src="$resourceURL('themes/starter/images/icon-map.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 pb-lg-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Location</span></p>
                    </div>
                    <div class="col-lg-12 offset-2 pb-lg-1">
                        <p><span class="fontsize19 font-weight-book">Memorial Hall <br> 1 Memorial Street, Queenstown 9300</span></p>
                        <p class="pt-lg-5"><span class="fontsize16 font-weight-medium text-underline">Open in maps</span></p>
                    </div>


                    <div class="col-lg-12 pt-lg-4 pb-lg-4">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <div class="col-lg-2 pb-lg-2">
                        <img src="$resourceURL('themes/starter/images/icon-price.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 pb-lg-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Price & Bookings</span></p>
                    </div>
                    <div class="col-lg-12 offset-2 pb-lg-1">
                        <p><span class="fontsize19 font-weight-book">$Listing.Price</span></p>
                        <p class="pt-lg-5"><span class="fontsize16 font-weight-medium text-underline">Open in maps</span></p>
                    </div>


                    <div class="col-lg-12 pt-lg-4 pb-lg-4">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <div class="col-lg-2 pb-lg-2">
                        <img src="$resourceURL('themes/starter/images/iconcontact.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 pb-lg-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Contact</span></p>
                    </div>
                    <div class="col-lg-12 offset-2 pb-lg-1">
                        <p class="pb-lg-3"><img src="$resourceURL('themes/starter/images/Iconawesome-phone.svg')" style="height: 22px; width: 22px;" class="icon mr-lg-3" alt="Listing icon"><span class="fontsize19 font-weight-book">$Listing.Phone</span></p>
                        <p class="pb-lg-3"><img src="$resourceURL('themes/starter/images/Iconzocial-email.svg')" style="height: 22px; width: 22px;" class="icon mr-lg-3" alt="Listing icon"><span class="fontsize19 font-weight-book">$Listing.Email</span></p>
                        <p class="pb-lg-3"><img src="$resourceURL('themes/starter/images/Iconmaterial-web.svg')" style="height: 22px; width: 22px;" class="icon mr-lg-3" alt="Listing icon"><span class="fontsize19 font-weight-book">$Listing.Website</span></p>
                        <p class="pb-lg-3"><img src="$resourceURL('themes/starter/images/Iconawesome-facebook-f.svg')" style="height: 22px; width: 22px;" class="icon mr-lg-3" alt="Listing icon"><span class="fontsize19 font-weight-book">$Listing.Facebook</span></p>
                        <p class="pb-lg-3"><img src="$resourceURL('themes/starter/images/Iconawesome-instagram.svg')" style="height: 22px; width: 22px;" class="icon mr-lg-3" alt="Listing icon"><span class="fontsize19 font-weight-book">$Listing.Instagram</span></p>
                    </div>

<%--                    <div class="col-lg-12 pt-lg-4 pb-lg-4">--%>
<%--                        <hr style="border-color: #A2A2A2;">--%>
<%--                    </div>--%>

<%--                    <div class="col-lg-10 offset-2">--%>
<%--                        <img src="$Listing.SponsorImage.URL" class="sponsor-image" alt="Sponsors Image">--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</section>

