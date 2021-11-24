<% if $Listings %>
    <div class="row">
        <% loop $Listings %>
            <div class="col-lg-4">
                <div class="listing-content">
                    <div class="listing-content--img">
                        <% if $FeaturedImage %>
                            <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
                        <% else %>
                            <img src="$resourceURL('themes/starter/images/vertical-honing.jpg')" alt="{$SiteConfig.Title} - {$Name}">
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
                        <p class="mb-3 mt-4"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></p>
                        <p><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.RAW.LimitWordCount(15)</span></p>
                    </div>
                    <div class="listing-content--tags">
                        <button class="btn-utils addtofavourites fontsize35" data-id="$ID"><i class="far fa-heart"></i></button>
                        <% if $Tags %>
                            <% loop $Tags %>
                                <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                            <% end_loop %>
                        <% end_if %>
                        <p class="ml-auto"><a href="#"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>
                    </div>
                </div>
            </div>
        <% end_loop %>
    </div>
<% end_if %>
