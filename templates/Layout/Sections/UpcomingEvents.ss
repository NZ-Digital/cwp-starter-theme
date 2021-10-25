<div class="upcomingEvents-container">
    <% if $UpcomingEventItems %>
        <div class="row no-gutters align-items-center justify-content-between pr-lg-7 pl-lg-7 pb-lg-9">
            <div class="col-auto">
                <p><span class="halyard-display fontsize25 font-weight-medium letterspacing-7px">$Name</span></p>
            </div>
            <div class="col-auto">
                <% if $PageLink %>
                    <a href="{$PageLink.Link}"><span class="theme-button-hover-dark fontsize18 font-weight-medium">{$ButtonText}</span></a>
                <% end_if %>
            </div>
        </div>
        <div class="inner-padding container-fluid">
            <div class="row">
            <% loop $UpcomingEventItems %>
                <div class="col-lg-4">
                    <div class="listing-content upcoming-event-item">
                        <% if $FeaturedImage %>
                            <div class="listing-content--img">
                                <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
                            </div>
                        <% end_if %>
                        <div class="listing-content--location-date">
                            <div class="listing-date">
                                <% if $VisibleListingDateAndTime %>
                                    <% loop $VisibleListingDateAndTime %>
                                        <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$Date.Format(E dd LLL)</span>
                                    <% end_loop %>
                                <% end_if %>
                            </div>
                            <div class="listing-location ml-auto">
                                <span class="text-footer-gray text-underline">$Location</span>
                            </div>
                        </div>
                        <div class="listing-content--details">
                            <p class="mb-3 mt-4"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></p>
                            <p><span class="halyard-display fontsize19 font-weight-book line-height-100">{$Content.LimitWordCount(15)}</span></p>
                        </div>
                        <div class="listing-content--tags">
                            <button class="addtofavourites"><img src="$resourceURL('themes/starter/images/Icon feather-heart.png')" width="34.26" alt="$SiteConfig.Title - add to your favourites"> </button>
                            <% if $Tags %>
                                <% loop $Tags %>
                                    <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
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
