<div class="col-lg-4">
    <div class="listing-content">
        <% if $FeaturedImage %>
            <div class="listing-content--img">
                <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
            </div>
        <% end_if %>
        <% if $Listing.FeaturedImage %>
            <div class="listing-content--img">
                <img src="{$Listing.FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
            </div>
        <% end_if %>
        <div class="listing-content--location-date">
            <div class="listing-date">
                <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px"><% if $ListingClosestToCurrentDate %>$ListingClosestToCurrentDate<% else %>$Listing.ListingClosestToCurrentDate<% end_if %></span>
            </div>
            <div class="listing-location ml-auto">
                <span class="text-footer-gray text-underline"><% if $City %>$City<% else %>$Listing.City<% end_if %></span>
            </div>
        </div>
        <div class="listing-content--details">
            <p class="mb-3 mt-4"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></p>
            <p><span class="halyard-display fontsize19 font-weight-book line-height-100"><% if $Content %>{$Content.RAW.LimitWordCount(15)}<% else %>$Listing.Content.LimitWordCount(15).RAW<% end_if %></span></p>
        </div>
        <div class="listing-content--tags">
            <button class="btn-utils addtofavourites fontsize35<% if $inFavourites %> active<% end_if %>" data-id="<% if $Listing.ID %>{$Listing.ID}<% else %>{$ID}<% end_if %>"><i class="<% if $inFavourites %>fas<% else %>far<% end_if %> fa-heart"></i></button>
            <% if $Tags %>
                <% loop $Tags %>
                    <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                <% end_loop %>
            <% else %>
                <% loop $Listing.Tags %>
                    <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                <% end_loop %>
            <% end_if %>
            <p class="ml-auto"><a href="<% if $ListingPage %>$ListingPage.Link<% else_if $Listing.ListingPage %>$Listing.$ListingPage.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>
        </div>
    </div>
</div>

