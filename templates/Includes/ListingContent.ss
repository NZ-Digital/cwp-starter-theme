<div class="col-lg-4">
    <div class="listing-content upcoming-event-item">
        <% if $FeaturedImage %>
            <div class="listing-content--img">
                <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
            </div>
        <% end_if %>
        <div class="listing-content--location-date">
            <div class="listing-date">
                <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$ListingClosestToCurrentDate</span>
            </div>
            <div class="listing-location ml-auto">
                <span class="text-footer-gray text-underline">$City</span>
            </div>
        </div>
        <div class="listing-content--details">
            <p class="mb-3 mt-4"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></p>
            <p><span class="halyard-display fontsize19 font-weight-book line-height-100">{$Content.LimitWordCount(15)}</span></p>
        </div>
        <div class="listing-content--tags">
            <button class="btn-utils addtofavourites"><img src="$resourceURL('themes/starter/images/Icon feather-heart.png')" width="34.26" alt="$SiteConfig.Title - add to your favourites"> </button>
            <% if $Tags %>
                <% loop $Tags %>
                    <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                <% end_loop %>
            <% end_if %>
            <p class="ml-auto"><a href="<% if $ListingPage %>$ListingPage.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>
        </div>
    </div>
</div>

