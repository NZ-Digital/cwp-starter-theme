<% if $Listings %>
    <div class="row">
        <% loop $Listings %>
            <div class="col-lg-4">
                <div class="listing-content">
                    <div class="listing-content--img">
                        <% if $FeaturedImage %>
                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}"></a>
                        <% else %>
                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="$resourceURL('themes/starter/images/vertical-honing.jpg')" alt="{$SiteConfig.Title} - {$Name}"></a>
                        <% end_if %>
                    </div>
                    <div class="listing-content--location-date align-items-center">
                        <div class="listing-date">
                            <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px"><% if $ListingClosestToCurrentDate %>$ListingClosestToCurrentDate<% end_if %></span>
                        </div>
                        <div class="listing-location ml-auto">
                            <span class="text-footer-gray text-underline">$City</span>
                        </div>
                    </div>
                    <div class="listing-content--details">
                        <p class="mb-3 mt-4"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
                        <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.RAW.LimitWordCount(15)</span></a></p>
                    </div>
                    <div class="listing-content--tags">
                        <button class="btn-utils addtofavourites fontsize35" data-id="$ID"><i class="far fa-heart"></i></button>
                        <% if $Tags %>
                            <% loop $Tags %>
                                <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                            <% end_loop %>
                        <% end_if %>
                        <p class="ml-auto"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                    </div>
                </div>
            </div>
        <% end_loop %>
    </div>
<% end_if %>
