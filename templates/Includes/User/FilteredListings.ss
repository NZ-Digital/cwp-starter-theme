<div class="row">
    <% if $Listings %>
        <% loop $Listings %>
            <div class="<% if $Up.GroupID == "3" %>col-xl-3<% else %>col-xl-4<% end_if %>">
                <div class="listing-content">
                    <div class="listing-content--img">
                        <% if $FeaturedImage %>
                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}"></a>
                        <% else %>
                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="$resourceURL('themes/starter/images/vertical-honing.jpg')" alt="{$SiteConfig.Title} - {$Name}"></a>
                        <% end_if %>
                    </div>
                    <div class="listing-content--location-date align-items-center">
                        <% if $Up.GroupID == "1" %>
                        <div class="listing-date">
                            <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px"><% if $ListingClosestToCurrentDate %>$ListingClosestToCurrentDate<% end_if %></span>
                        </div>
                        <% end_if %>
                        <div class="listing-location <% if $Up.GroupID == "1" %>ml-auto<% end_if %>">
                            <a href="/all-listings?city={$City}"><span class="text-footer-gray text-underline">$City</span></a>
                        </div>
                    </div>
                    <div class="listing-content--details">
                        <p class="mb-3 mt-4"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
                        <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.RAW.LimitWordCount(15)</span></a></p>
                    </div>
                    <div class="listing-content--tags">
                        <button class="btn-utils addtofavourites fontsize35<% if $Up.addedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.addedToFavourites($ID)"><i class="<% if $Up.addedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                        <% if $Categories %>
                            <% include ListingTags Categories=$Categories %>
                        <% end_if %>
                        <p class="ml-auto"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                    </div>
                </div>
            </div>
        <% end_loop %>
    <% else %>
        <div class="col-lg-12">
            <p><span class="fontsize30 font-weight-semibold">No results found.</span></p>
        </div>
    <% end_if %>
</div>

