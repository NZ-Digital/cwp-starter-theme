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
            <% if $AssignedGroup.ID == 1 || $Listing.AssignedGroup.ID == 1 %><!-- Show date if listings are under What's On group -->
                <% if $ListingClosestToCurrentDate || $Listing.ListingClosestToCurrentDate %>
                    <div class="listing-date">
                        <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px"><% if $ListingClosestToCurrentDate %>$ListingClosestToCurrentDate<% else %>$Listing.ListingClosestToCurrentDate<% end_if %></span>
                    </div>
                <% end_if %>
            <% end_if %>
            <% if $City || $Listing.City %>
            <div class="listing-location ml-auto">
                <a href="/all-listings?city=<% if $City %>{$City}<% else %>{$Listing.City}<% end_if %>"><span class="text-footer-gray text-underline"><% if $City %>$City<% else %>$Listing.City<% end_if %></span></a>
            </div>
            <% end_if %>
        </div>
        <div class="listing-content--details">
            <p class="mb-3 mt-4 listing-title"><a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
            <% if $ContentSummary %>
                <p class="listing-text"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$ContentSummary.LimitWordCount(15)</span></a></p>
            <% else %>
                <% if $ContentSummaryRaw %>
                    <p class="listing-text"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$ContentSummaryRaw.RAW.LimitWordCount(15)</span></a></p>
                <% else %>
                    <% if $ContentRaw %>
                        <p class="listing-text"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$ContentRaw.RAW.LimitWordCount(15)</span></a></p>
                    <% else %>
                        <p class="listing-text"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.LimitWordCount(15)</span></a></p>
                    <% end_if %>
                <% end_if %>
            <% end_if %>

            <% if $Listing.ContentSummary %>
                <p class="listing-text"><a href="<% if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Listing.ContentSummary.LimitWordCount(15)</span></a></p>
            <% else %>
                <% if $Listing.ContentSummaryRaw %>
                    <p class="listing-text"><a href="<% if $Listing.Page %>$Listing.Listing.Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Listing.ContentSummaryRaw.RAW.LimitWordCount(15)</span></a></p>
                <% else %>
                    <% if $Listing.ContentRaw %>
                        <p class="listing-text"><a href="<% if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Listing.ContentRaw.RAW.LimitWordCount(15)</span></a></p>
                    <% else %>
                        <p class="listing-text"><a href="<% if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Listing.Content.LimitWordCount(15)</span></a></p>
                    <% end_if %>
                <% end_if %>
            <% end_if %>
        </div>
        <div class="listing-content--tags">
            <button class="btn-utils addtofavourites fontsize35<% if $inFavourites %> active<% end_if %>" data-id="<% if $Listing.ID %>{$Listing.ID}<% else %>{$ID}<% end_if %>"><i class="<% if $inFavourites %>fas<% else %>far<% end_if %> fa-heart"></i></button>
            <% if $Category %>
                <% include ListingCategory Category=$Category %>
            <% end_if %>
            <p class="ml-sm-auto ml-0 pt-sm-0 pt-3 view-listing"><a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
        </div>
    </div>
</div>
