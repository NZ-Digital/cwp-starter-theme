<section class="page-section sectionListingPageContent col-lg-12 pt-lg-5 pb-lg-4 inner-padding">
    <div class="container-fluid p-0">
        <div class="row align-items-center listing-content whats-on--layout mb-0">
            <div class="col-lg-6 pb-lg-5">
                <div class="listing-content--title">
                    <p><span class="fontsize50 font-weight-book">$Title</span></p>
                </div>
            </div>
            <div class="col-lg-6 pb-lg-5">
                <div class="listing-content--tags justify-content-end">
                    <div class="tags">
                        <div class="tag-container">
                            <div class="tag-items">
                                <% if $Listing.Categories %>
                                    <% loop $Listing.Categories %>
                                        <a href="/all-listings?category={$Title}" class="tag-name mr-lg-3"><span class="halyard-display font-weight-medium fontsize16 text-uppercase text-underline">$Title</span></a>
                                    <% end_loop %>
                                <% end_if %>
                            </div>
                        </div>
                    </div>
                    <button class="btn-utils addtofavourites pl-lg-3 <% if $addedToFavourites($Listing.ID) %> active<% end_if %>" data-id="$Listing.ID"><i class="<% if $addedToFavourites($Listing.ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                    <button class="btn-utils sharelisting fontsize25 ml-3 text-scorpion"><i class="fas fa-share-alt"></i></button>
                    <button class="btn-utils downloadlisting fontsize25 ml-3 text-scorpion"><i class="fas fa-arrow-alt-to-bottom"></i></button>
                    <a target="_blank" href="https://www.google.com/maps/place/{$Listing.Address} {$Listing.City}" class="btn-utils getdirection fontsize25 ml-3 text-scorpion"> <i class="fas fa-map"></i> </a>
                    <p class="ml-3"><a target="_blank" href="<% if $Listing.BookingURL %>$Listing.BookingURL<% else %>#<% end_if %>"><span class="theme-button-gray-small font-weight-medium fontsize18 text-center">Buy tickets</span></a></p>
                </div>
                <div class="share-socials--dropdown">
                    <p class="text-center">
                        <a target="_blank" class="pl-1 pr-1" href="https://www.facebook.com/sharer/sharer.php?u={$AbsoluteLink}"><i class="fab fa-facebook-f"></i></a>
                        <a target="_blank" class="pl-1 pr-1" href="https://twitter.com/share?url={$AbsoluteLink}"><i class="fab fa-twitter"></i></a>
                        <a target="_blank" class="pl-1 pr-1" href="https://www.linkedin.com/shareArticle?mini=true&url={$AbsoluteLink}"><i class="fab fa-linkedin-in"></i></a>
                    </p>
                    <hr style="border-color: #a2a2a2;">
                    <p><a href="#"><span class="fontsize16 font-weight-medium">Report</span></a></p>
                    <p><a href="#" class="copy-link"><span class="fontsize16 font-weight-medium">Copy link</span></a></p>
                </div>
            </div>
        </div>
        <div class="row listing-content">
            <div class="col-lg-12 pb-lg-7">
                <% if $Listing.Content2 %>
                    <div class="listing-content--bar">$Listing.Content2</div>
                <% end_if %>
                <div class="listing-content--featured-img">
                    <img src="$Listing.FeaturedImage.URL" alt="$Listing.Name">
                </div>
            </div>
            <div class="col-lg-8">
                <div class="listing-content--details mb-lg-3">
                    <span class="fontsize19 font-weight-book">$Listing.Content</span>
                </div>
                <% if $Listing.GalleryImages %>
                    <% if $Listing.GalleryImages.Count > 2 %>
                        <div class="listing-content--gallery mt-lg-8">
                            <div class="owl-carousel">
                                <% loop $Listing.GalleryImages %>
                                    <div class="gallery-image">
                                        <img src="$URL" alt="Listing gallery image">
                                    </div>
                                <% end_loop %>
                            </div>
                        </div>
                    <% else %>
                        <div class="row listing-content--gallery ">
                            <% loop $Listing.GalleryImages %>
                                <div class="col-lg-6">
                                    <div class="gallery-image">
                                        <img src="$URL" alt="Listing gallery image">
                                    </div>
                                </div>
                            <% end_loop %>
                        </div>
                    <% end_if %>
                <% end_if %>
                <hr class="mt-lg-6 mb-lg-5" style="border-color: #A2A2A2;">

                <div class="listing-content--tags">
                    <% if $Listing.Tags %>
                        <span class="halyard-display font-weight-medium fontsize25 text-uppercase letterspacing-7px">Tags</span>
                        <% loop $Listing.Tags %>
                            <a href="/all-listings?tag={$Title}" class="tag-name mr-lg-3 ml-lg-5"><span class="halyard-display font-weight-medium fontsize16 text-uppercase text-underline">$Title</span></a>
                        <% end_loop %>
                    <% end_if %>
                </div>
            </div>
            <div class="col-lg-3 offset-1">
                <div class="row">
                    <% if $Listing.VisibleDatesAndTimes %>
                        <div class="col-lg-2 pb-lg-2 pr-0">
                            <img src="$resourceURL('themes/starter/images/icon-date-time.svg')" class="icon" alt="Listing icon">
                        </div>
                        <div class="col-lg-10 pb-lg-3">
                            <p><span class="fontsize20 font-weight-medium text-uppercase">Event dates & times</span></p>
                        </div>
                        <% loop $Listing.VisibleDatesAndTimes %>
                            <div class="col-lg-5 offset-2 pb-lg-1">
                                <p><span class="fontsize19 font-weight-book">$Date.Format('E, dd LLL')</span></p>
                            </div>
                            <div class="col-lg-5 pb-lg-1">
                                <p><span class="fontsize19 font-weight-book">$Time</span></p>
                            </div>
                        <% end_loop %>
                    <% end_if %>

                    <div class="col-lg-12 pt-lg-5 pb-lg-5">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <div class="col-lg-2 pb-lg-2 pr-0">
                        <img src="$resourceURL('themes/starter/images/icon-map.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 pb-lg-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Location</span></p>
                    </div>
                    <div class="col-lg-12 offset-2 pb-lg-1">
                        <p><span class="fontsize19 font-weight-book moderna-sans"><% if $Listing.BuildingName %>$Listing.BuildingName<br><% end_if %><% if $Listing.Address %>$Listing.Address, <% end_if %><% if $Listing.City %>$Listing.City, <br><% end_if %><% if $Listing.Town %>$Listing.Town<% end_if %><% if $Listing.Postcode %>$Listing.Postcode<% end_if %></span></p>
                        <p class="pt-lg-5"><a target="_blank" href="https://www.google.com/maps/place/{$Listing.Address} {$Listing.City}"> <span class="fontsize16 font-weight-medium text-underline">Open in maps</span></a></p>
                    </div>

                    <div class="col-lg-12 pt-lg-5 pb-lg-5">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <div class="col-lg-2 pb-lg-2 pr-0">
                        <img src="$resourceURL('themes/starter/images/icon-price.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 pb-lg-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Price & Bookings</span></p>
                    </div>
                    <div class="col-lg-12 offset-2 pb-lg-1">
                        <p><span class="fontsize19 font-weight-book moderna-sans">$Listing.Prices.RAW</span></p>
                        <p class="pt-lg-5"><a target="_blank" href="<% if $Listing.BookingURL %>$Listing.BookingURL<% else %>#<% end_if %>"> <span class="fontsize16 font-weight-medium text-underline">Buy tickets</span></a></p>
                    </div>

                    <div class="col-lg-12 pt-lg-5 pb-lg-5">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <div class="col-lg-2 pb-lg-2 pr-0">
                        <img src="$resourceURL('themes/starter/images/iconcontact.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 pb-lg-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Contact</span></p>
                    </div>
                    <div class="col-lg-12 offset-2 pb-lg-1">
                        <% if $Listing.Phone %><p class="pb-lg-3"><a href="tel:{$Listing.Phone}"><i class="fas fa-phone-alt mr-lg-3 fontsize20 align-middle"></i><span class="fontsize19 font-weight-book moderna-sans">$Listing.Phone</span></a></p><% end_if %>
                        <% if $Listing.Email %><p class="pb-lg-3"><a href="mailto:{$Listing.Email}"><i class="fas fa-envelope mr-lg-3 fontsize20 align-middle"></i><span class="fontsize19 font-weight-book moderna-sans">$Listing.Email</span></a></p><% end_if %>
                        <% if $Listing.Website %><p class="pb-lg-3"><a href="//$Listing.Website" target="_blank" rel="nofollow"><i class="fas fa-globe mr-lg-3 fontsize20 align-middle"></i><span class="fontsize19 font-weight-book moderna-sans">$Listing.Website</span></a></p><% end_if %>
                        <% if $Listing.Facebook %><p class="pb-lg-3"><a href="//$Listing.Facebook" target="_blank" rel="nofollow"><i class="fab fa-facebook-f mr-lg-3 fontsize20 align-middle"></i><span class="fontsize19 font-weight-book moderna-sans">$Listing.Facebook</span></a></p><% end_if %>
                        <% if $Listing.Instagram %><p class="pb-lg-3"><a href="//$Listing.Instagram" target="_blank" rel="nofollow"><i class="fab fa-instagram mr-lg-3 fontsize20 align-middle"></i><span class="fontsize19 font-weight-book moderna-sans">$Listing.Instagram</span></a></p><% end_if %>
                        <% if $Listing.Twitter %><p class="pb-lg-3"><a href="//$Listing.Twitter" target="_blank" rel="nofollow"><i class="fab fa-twitter mr-lg-3 fontsize20 align-middle"></i><span class="fontsize19 font-weight-book moderna-sans">$Listing.Twitter</span></a></p><% end_if %>
                    </div>
                    <div class="col-lg-12 pt-lg-5 pb-lg-5">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <% if $Listing.ListingLogo %>
                        <div class="col-lg-10 pb-lg-3">
                            <img src="$Listing.ListingLogo.URL" alt="$Listing.Name - Logo">
                        </div>
                    <% end_if %>
                </div>
            </div>
            <div class="col-lg-12">
                <hr style="border-color: #A2A2A2;">
            </div>
            <div class="col-lg-12 pt-5 pb-7">
                <p><a href="/whats-on"><span class="theme-button-long text-center">Back to What's On</span></a></p>
            </div>
            <div class="col-lg-12 pt-5">
                <p><span class="halyard-display font-weight-medium fontsize25 text-uppercase letterspacing-7px">Related Events</span></p>
                <% if $getRelatedListings($Listing.ID) %>
                    <div class="row pt-6">
                        <% loop $getRelatedListings($Listing.ID) %>
                            <% include ListingContent %>
                        <% end_loop %>
                    </div>
                <% end_if %>
            </div>
        </div>
    </div>
</section>
