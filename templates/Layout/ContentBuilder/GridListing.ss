<div class="gridListing-container">
    <% if $VisibleListings %>
        <div class="container-fluid">
            <div class="row no-gutters pl-lg-7 pr-lg-10">
                <div class="col-xl-4 pr-xl-4 pb-6">$SideContent</div>
                <div class="col-xl-8 pl-xl-5">
                    <div class="row">
                        <% loop $VisibleListings.Limit($Limit) %>
                            <div class="col-6 grid-item">
                                <div class="listing-content">
                                    <% if $FeaturedImage %>
                                        <div class="listing-content--img">
                                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>">
                                                <img src="{$FeaturedImage.URL}" class="mb-2" alt="{$SiteConfig.Title} - {$Name}">
                                            </a>
                                        </div>
                                    <% end_if %>
                                    <% if $City %>
                                        <div class="listing-content--location">
                                            <a href="/all-listings?city={$City}"><span class="text-footer-gray text-underline">$City</span></a>
                                        </div>
                                    <% end_if %>
                                    <div class="listing-content--details">
                                        <p class="mb-sm-3 mt-sm-4 mt-3 mb-2 listing-title"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
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
                                    </div>
                                    <div class="listing-content--tags">
                                        <button class="btn-utils addtofavourites fontsize35<% if $Up.Up.addedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.Up.addedToFavourites($ID)"><i class="<% if $Up.Up.addedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                                        <% if $Category %>
                                            <% include ListingCategory Category=$Category %>
                                        <% end_if %>
                                        <p class="ml-sm-auto ml-0 pt-sm-0 pt-3 w-auto d-sm-block d-none view-listing"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                                    </div>
                                </div>
                            </div>
                        <% end_loop %>
                    </div>
                </div>
            </div>
        </div>
    <% end_if %>
</div>
