<div class="col-xl-4">
    <div class="listing-content">
        <% if $FeaturedImage %>
            <div class="listing-content--img">
                <a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}"></a>
            </div>
        <% end_if %>
        <% if $Listing.FeaturedImage %>
            <div class="listing-content--img">
                <a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><img src="{$Listing.FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}"></a>
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
            <p class="mb-3 mt-4"><a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
            <p><a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100"><% if $Content %>{$Content.RAW.LimitWordCount(15)}<% else %>$Listing.Content.LimitWordCount(15).RAW<% end_if %></span></a></p>
        </div>
        <div class="listing-content--tags">
            <button class="btn-utils addtofavourites fontsize35<% if $inFavourites %> active<% end_if %>" data-id="<% if $Listing.ID %>{$Listing.ID}<% else %>{$ID}<% end_if %>"><i class="<% if $inFavourites %>fas<% else %>far<% end_if %> fa-heart"></i></button>
            <% if $Tags %>
                <% include ListingTags Tags=$Tags %>
            <% end_if %>
            <p class="ml-auto"><a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
        </div>
    </div>
</div>

