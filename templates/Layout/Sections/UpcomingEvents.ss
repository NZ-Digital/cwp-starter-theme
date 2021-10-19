<div class="upcomingEvents-container">
    <% if $UpcomingEventItems %>
        <div class="row no-gutters justify-content-between pr-lg-7 pl-lg-7 pb-lg-9">
            <div class="col-auto">
                <p><span class="halyard-display fontsize25 font-weight-medium letterspacing-7px">$Name</span></p>
            </div>
            <div class="col-auto">
                <% if $PageLink %>
                    <a href="{$PageLink.Link}"><span class="theme-button-hover-dark fontsize18 font-weight-medium">{$ButtonText}</span></a>
                <% end_if %>
            </div>
        </div>
        <div class="inner-padding">
            <div class="row">
            <% loop $UpcomingEventItems %>
                <div class="col-lg-4">
                    <div class="upcoming-event-item">
                        <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}" class="featured-img">
                        <div class="event-date-location">
                            <div class="event-date">
                                <% if $VisibleListingDateAndTime %>
                                    <% loop $VisibleListingDateAndTime %>
                                        <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$Date.Format(E dd LLL)</span>
                                    <% end_loop %>
                                <% end_if %>
                            </div>
                            <div class="event-location ml-auto">
                                <span>$Location</span>
                            </div>
                        </div>
                        <div class="event-content">
                            <p class="mb-3"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></p>
                            <p><span class="halyard-display fontsize19 font-weight-book line-height-100">{$Content.LimitWordCount(15)}</span></p>
                        </div>
                        <div class="event-tags">
                            <button class="btn-addFavourites"><img src="$resourceURL('themes/starter/images/Icon feather-heart.png')" width="34.26" alt="$SiteConfig.Title - add to your favourites"> </button>
                            <% if $Tags %>
                                <% loop $Tags %>
                                    <a href="#" class="event-tag-item"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                                <% end_loop %>
                            <% end_if %>
                            <p class="ml-auto"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></p>
                        </div>
                    </div>
                </div>
            <% end_loop %>
            </div>
        </div>
    <% end_if %>
</div>
