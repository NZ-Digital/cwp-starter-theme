<section class="page-section sectionListingPageContent col-lg-12 pt-lg-5 pb-lg-4 mobile-top-padding tablet-top-padding inner-padding">
    <div class="container-fluid p-0">
        <div class="row align-items-center listing-content whats-on--layout mb-0">
            <div class="col-lg-6 pb-lg-5">
                <div class="listing-content--title">
                    <p><span class="fontsize50 font-weight-book">$Title</span></p>
                </div>
            </div>
            <div class="col-lg-6 pb-lg-5">
                <div class="listing-content--tags justify-content-lg-end">
                    <% if $Listing.Category %>
                    <div class="tags">
                        <div class="tag-container pb-sm-0 pb-3">
                            <div class="tag-items">
                                <% loop $Listing.Category %>
                                    <a href="/all-listings?category={$Title}" class="tag-name mr-lg-3"><span class="halyard-display font-weight-medium fontsize16 text-uppercase text-underline">$Title</span></a>
                                <% end_loop %>
                            </div>
                        </div>
                    </div>
                    <% end_if %>
                    <button class="btn-utils addtofavourites pl-lg-3 <% if $addedToFavourites($Listing.ID) %> active<% end_if %>" data-id="$Listing.ID"><i class="<% if $addedToFavourites($Listing.ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                    <button class="btn-utils sharelisting fontsize25 ml-3 text-scorpion"><i class="fas fa-share-alt"></i></button>
                    <div class="share-socials--dropdown">
                        <p class="text-center">
                            <a target="_blank" class="pl-1 pr-1" href="https://www.facebook.com/sharer/sharer.php?u={$AbsoluteLink}"><i class="fab fa-facebook-f"></i></a>
                            <a target="_blank" class="pl-1 pr-1" href="https://twitter.com/share?url={$AbsoluteLink}"><i class="fab fa-twitter"></i></a>
                            <a target="_blank" class="pl-1 pr-1" href="https://www.linkedin.com/shareArticle?mini=true&url={$AbsoluteLink}"><i class="fab fa-linkedin-in"></i></a>
                            <a target="_blank" class="pl-1 pr-1" href="https://wa.me/?text={$AbsoluteLink}"><i class="fab fa-whatsapp"></i></a>
                            <a target="_blank" class="pl-1 pr-1" href="mailto:?subject={$Title}&body={$AbsoluteLink}"><i class="fas fa-envelope"></i></a>
                        </p>
                        <hr style="border-color: #a2a2a2;">
                        <p><a href="#" class="report-listing"><span class="fontsize16 font-weight-medium">Report</span></a></p>
                        <p><a href="#" class="copy-link"><span class="fontsize16 font-weight-medium">Copy link</span></a></p>
                        <div class="copy-link--modal">
                            <div class="body">
                                <p class="pb-3"><span class="font-weight-medium">Link copied</span><button class="copy-link--close"><i class="fal fa-times"></i></button></p>
                                <input type="text" disabled  name="pageurl" value="$AbsoluteLink" class="copy-link">
                            </div>
                        </div>
                    </div>
<%--                    <button class="btn-utils downloadlisting fontsize25 ml-3 text-scorpion"><i class="fas fa-arrow-alt-to-bottom"></i></button>--%>
                    <a target="_blank" href="https://www.google.com/maps/place/{$Listing.Address} {$Listing.City}" class="btn-utils getdirection fontsize25 ml-3 text-scorpion"> <i class="fas fa-map"></i> </a>
                    <% if $Listing.BookingURL %><p class="ml-sm-3 pt-sm-0 pt-3"><a target="_blank" href="$Listing.BookingURL"><span class="theme-button-gray-small font-weight-medium fontsize18 text-center">Buy tickets</span></a></p><% end_if %>
                </div>
            </div>
        </div>
        <div class="row no-gutters listing-content">
            <div class="col-lg-12 pb-lg-7 pb-5">
                <% if $Listing.Content2 %>
                    <div class="listing-content--bar">$Listing.Content2</div>
                <% end_if %>
                <% if $Listing.FeaturedImage %>
                    <div class="listing-content--featured-img">
                        <img src="$Listing.FeaturedImage.URL" alt="$Listing.Name">
                    </div>
                <% end_if %>
            </div>
            <div class="col-lg-8 pb-6">
                <% if $Listing.Content %>
                    <div class="listing-content--details mb-3">
                        $Listing.Content
                    </div>
                <% else %>
                    <% if $Listing.ContentRaw %>
                        <div class="listing-content--details mb-3">
                            $Listing.ContentRaw.RAW
                        </div>
                    <% end_if %>
                <% end_if %>
                <% if $Listing.GalleryImages %>
                    <% if $Listing.GalleryImages.Count > 2 %>
                        <div class="listing-content--gallery mt-lg-8 mt-lg-4">
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
            </div>
            <div class="col-lg-3 offset-lg-1">
                <div class="row">
                    <% if $Listing.VisibleDatesAndTimes || $Listing.ByAppointment == '1' %>
                        <div class="col-lg-2 col-sm-1 col-2 pb-lg-3 pb-3 pr-0">
                            <img src="$resourceURL('themes/starter/images/icon-date-time.svg')" class="icon" alt="Listing icon">
                        </div>
                        <div class="col-lg-10 col-10 pb-lg-3 pb-3">
                            <p><span class="fontsize20 font-weight-medium text-uppercase">Event dates & times</span> <button class="accordion-btn d-lg-none">&nbsp;</button></p>
                        </div>
                        <div class="col-12">
                            <div class="row no-gutters accordion-panel">
                                <% if $Listing.VisibleDatesAndTimes %>
                                    <% loop $Listing.VisibleDatesAndTimes %>
                                        <div class="col-lg-7 col-6 col-sm-3 col-6">
                                            <p class="offset-lg-4 pb-lg-1 pb-2"><span class="fontsize19 font-weight-book">$Date.Format('E, dd LLL')</span></p>
                                        </div>
                                        <% if $Time %>
                                            <div class="col-lg-5 col-6 col-sm-7 col-6<% if $Last %> pb-3<% end_if %>">
                                                <p class="pb-lg-1 pb-2"><span class="fontsize19 font-weight-book">$Time</span></p>
                                            </div>
                                        <% end_if %>
                                    <% end_loop %>
                                <% end_if %>
                                <% if $Listing.ByAppointment == '1' %>
                                    <div class="col-12">
                                        <p class="offset-lg-2 pb-lg-1 pb-2 pl-1"><span class="fontsize19 font-weight-book">Appointments Only</span></p>
                                    </div>
                                <% end_if %>
                            </div>
                        </div>
                    <% end_if %>
                    <% if $Listing.VisibleDatesAndTimes || $Listing.ByAppointment == '1' %>
                    <div class="col-lg-12 pt-lg-5 pb-lg-5 pb-3">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <% end_if %>

                    <div class="col-lg-2 col-sm-1 col-2 pb-lg-3 pb-3 pr-0">
                        <img src="$resourceURL('themes/starter/images/icon-map.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 col-10 pb-lg-3 pb-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Location</span> <button class="accordion-btn d-lg-none">&nbsp;</button></p>
                    </div>
                    <div class="col-lg-12 pb-lg-1">
                        <div class="accordion-panel">
                        <p class="offset-lg-2 pl-lg-1"><span class="fontsize19 font-weight-book moderna-sans"><% if $Listing.IsOnline %>This event is online<% end_if %><% if $Listing.BuildingName %>$Listing.BuildingName<br><% end_if %><% if $Listing.Address %>$Listing.Address, <% end_if %><% if $Listing.City %>$Listing.City<% end_if %><% if $Listing.Postcode %> $Listing.Postcode<% end_if %></span></p>
                        <% if not $Listing.IsOnline %>
                            <p class="offset-lg-2 pl-lg-1 pt-lg-5 pt-4 pb-3"><a target="_blank" href="https://www.google.com/maps/place/{$Listing.Address} {$Listing.City}"> <span class="fontsize16 font-weight-medium text-underline">Open in maps</span></a></p>
                        <% end_if %>
                        </div>
                    </div>

                    <div class="col-lg-12 pt-lg-5 pb-lg-5 pb-3">
                        <hr style="border-color: #A2A2A2;">
                    </div>

                    <div class="col-lg-2 col-sm-1 col-2 pb-lg-3 pb-3 pr-0">
                        <img src="$resourceURL('themes/starter/images/icon-price.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 col-10 pb-lg-3 pb-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Price & Bookings</span>  <button class="accordion-btn d-lg-none">&nbsp;</button></p>
                    </div>
                    <div class="col-lg-12 pb-lg-1 pb-2">
                        <div class="accordion-panel">
                            <% if $Listing.GAPrice || $Listing.StuPrice || $Listing.SenPrice || $Listing.ChiPrice || $Listing.OtherPrice %>
                            <p class="offset-lg-2 pl-lg-1">
                                <span class="fontsize19 font-weight-book moderna-sans">
                                <% if $Listing.GAPrice %>Adult - {$Listing.GAPrice}<br><% end_if %>
                                <% if $Listing.StuPrice %>Student - {$Listing.StuPrice}<br><% end_if %>
                                <% if $Listing.SenPrice %>Senior - {$Listing.SenPrice}<br><% end_if %>
                                <% if $Listing.ChiPrice %>Child - {$Listing.ChiPrice}<br><% end_if %>
                                <% if $Listing.OtherPrice %>$Listing.OtherPrice<% end_if %>
                                </span>
                            </p>
                            <% else %>
                                <% if $Listing.IsEventFree %>
                                    <p class="offset-lg-2 pl-lg-1">
                                        <span class="fontsize19 font-weight-book moderna-sans">Free</span>
                                    </p>
                                <% end_if %>
                            <% end_if %>
                            <% if $Listing.BookingURL %>
                                <p class="offset-lg-2 pt-lg-5 pt-4 pb-3 pl-lg-1"><a target="_blank" href="$Listing.BookingURL"> <span class="fontsize16 font-weight-medium text-underline"><% if $IsEventFree %>Book online<% else %>Buy tickets<% end_if %></span></a></p>
                            <% end_if %>
                        </div>
                    </div>
                    <div class="col-lg-12 pt-lg-5 pb-lg-5 pb-3">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <div class="col-lg-2 col-sm-1 col-2 pb-lg-3 pb-3 pr-0">
                        <img src="$resourceURL('themes/starter/images/iconcontact.svg')" class="icon" alt="Listing icon">
                    </div>
                    <div class="col-lg-10 col-10 pb-lg-3 pb-3">
                        <p><span class="fontsize20 font-weight-medium text-uppercase">Contact</span> <button class="accordion-btn d-lg-none">&nbsp;</button></p>
                    </div>
                    <div class="col-lg-12 pb-lg-1">
                        <div class="accordion-panel">
                            <% if $Listing.Phone %><p class="contact-method pb-3 offset-lg-2 pl-lg-2"><i class="fas fa-phone-alt mr-lg-3 mr-1 fontsize20 align-middle"></i><a href="tel:{$Listing.Phone}" class="d-flex align-items-center text-break"><span class="fontsize19 font-weight-book moderna-sans">$Listing.Phone</span></a></p><% end_if %>
                            <% if $Listing.Email %><p class="contact-method pb-3 offset-lg-2 pl-lg-2"><i class="fas fa-envelope mr-lg-3 mr-1 fontsize20 align-middle"></i><a href="mailto:{$Listing.Email}" class="d-flex align-items-center text-break"><span class="fontsize19 font-weight-book moderna-sans">$Listing.Email</span></a></p><% end_if %>
                            <% if $Listing.Website %><p class="contact-method pb-3 offset-lg-2 pl-lg-2"><i class="fas fa-globe mr-lg-3 mr-1 fontsize20 align-middle"></i><a href="//{$Listing.Website}" target="_blank" rel="nofollow" class="d-flex align-items-center text-break"><span class="fontsize19 font-weight-book moderna-sans">$Listing.Website</span></a></p><% end_if %>
                            <% if $Listing.Facebook %><p class="contact-method pb-3 offset-lg-2 pl-lg-2"><i class="fab fa-facebook-f mr-lg-3 mr-1 fontsize20 align-middle"></i><a href="//{$Listing.Facebook}" target="_blank" rel="nofollow" class="d-flex align-items-center text-break"><span class="fontsize19 font-weight-book moderna-sans">$Listing.Facebook</span></a></p><% end_if %>
                            <% if $Listing.Instagram %><p class="contact-method pb-3 offset-lg-2 pl-lg-2"><i class="fab fa-instagram mr-lg-3 mr-1 fontsize20 align-middle"></i><a href="//{$Listing.Instagram}" target="_blank" rel="nofollow" class="d-flex align-items-center text-break"><span class="fontsize19 font-weight-book moderna-sans">$Listing.Instagram</span></a></p><% end_if %>
                            <% if $Listing.Twitter %><p class="contact-method pb-3 offset-lg-2 pl-lg-2"><i class="fab fa-twitter mr-lg-3 mr-1 fontsize20 align-middle"></i><a href="//{$Listing.Twitter}" target="_blank" rel="nofollow" class="d-flex align-items-center text-break"><span class="fontsize19 font-weight-book moderna-sans">$Listing.Twitter</span></a></p><% end_if %>
                        </div>
                    </div>
                    <% if $Listing.ListingLogo %>
                    <div class="col-lg-12 pt-lg-5 pb-lg-5 pb-3">
                        <hr style="border-color: #A2A2A2;">
                    </div>
                    <div class="col-lg-10 pb-lg-3">
                        <img src="$Listing.ListingLogo.URL" alt="$Listing.Name - Logo">
                    </div>
                    <% end_if %>
                </div>
            </div>
            <% if $Listing.Tags %>
            <div class="col-lg-8 pb-lg-6 pb-3">
                <hr class="mt-6 mb-5" style="border-color: #A2A2A2;">
                <div class="listing-content--tags">
                    <span class="halyard-display font-weight-medium fontsize25 text-uppercase letterspacing-7px mr-2">Tags</span>
                    <% loop $Listing.Tags %>
                        <a href="/all-listings?tag={$Title}" class="tag-name ml-sm-3 mr-sm-0"><span class="halyard-display font-weight-medium fontsize16 text-uppercase text-underline text-footer-gray">$Title</span></a>
                    <% end_loop %>
                </div>
            </div>
            <% end_if %>
            <div class="col-lg-12">
                <hr style="border-color: #A2A2A2;">
            </div>
            <div class="col-lg-12 pt-5">
                <p><a href="/whats-on"><span class="theme-button-long text-center">Back to What's On</span></a></p>
            </div>
            <div class="col-lg-12 pt-7 related-listings">
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
