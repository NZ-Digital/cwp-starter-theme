<div class="featuredListing-container">
    <% if $VisibleFeaturedListings %>
        <div class="owl-carousel">
            <% loop $VisibleFeaturedListings %>
                <div class="listing-content">
                    <% if $FeaturedImage %>
                        <div class="listing-content--img">
                            <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
                        </div>
                    <% end_if %>
                    <div class="listing-content--date">
                        <span class="halyard-display font-weight-medium fontsize16 text-uppercase letterspacing-1px">$ListingClosestToCurrentDate</span>
                    </div>
                    <div class="listing-content--tags">
                        <button class="btn-utils addtofavourites"><img src="$resourceURL('themes/starter/images/Icon feather-heart.png')" width="34.26" alt="$SiteConfig.Title - add to your favourites"> </button>
                        <% if $Tags %>
                            <% loop $Tags %>
                                <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                            <% end_loop %>
                        <% end_if %>
                    </div>
                    <div class="listing-content--details">
                        <p class="mb-3"><span class="halyard-display fontsize35 font-weight-normal">{$Name}</span></p>
                        <p class="mb-5"><span class="halyard-display fontsize19 font-weight-book">{$Content.LimitWordCount(39)}</span></p>
                        <p><a href="<% if $ListingPage %>$ListingPage.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>
                    </div>
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
