<div class="featuredListing-container">
    <% if $VisibleFeaturedListings %>
        <div class="owl-carousel">
            <% loop $VisibleFeaturedListings %>
                <div class="listing-content">
                    <% if $FeaturedImage %>
                        <div class="listing-content--img">
                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}"></a>
                        </div>
                    <% end_if %>
                    <div class="listing-content--location-date align-items-center">
                        <div class="listing-date bg-saffron-mango">
                            <span class="halyard-display font-weight-medium fontsize16 text-uppercase letterspacing-1px text-cod-gray">$ListingClosestToCurrentDate</span>
                        </div>
                        <% if $Availability %>
                            <div class="listing-availability ml-auto">
                                <span class="halyard-display font-weight-medium fontsize16 letterspacing-1px text-cod-gray">$Availability</span>
                            </div>
                        <% end_if %>
                    </div>
                    <div class="listing-content--tags">
                        <button class="btn-utils addtofavourites fontsize35<% if $Up.wasAddedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.wasAddedToFavourites($ID)" data-status=""><i class="<% if $Up.wasAddedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                        <% if $Tags %>
                            <% include ListingTags Tags=$Tags %>
                        <% end_if %>
                    </div>
                    <div class="listing-content--details">
                        <p class="mb-3"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize35 font-weight-normal">{$Name}</span></a></p>
                        <p class="mb-5"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book">{$Content.RAW.LimitWordCount(39)}</span></a></p>
                        <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                    </div>
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
