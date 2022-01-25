<section class="page-section sectionRecommendedListings col-lg-12 pt-lg-8">
    <div class="recommendedListings-content inner-padding">
        <div class="container-fluid p-0">
            <% loop $RecommendedListings %>
                <div class="row pb-lg-7 justify-content-between align-items-center">
                    <div class="col-auto">
                        <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">Recommended $GroupName</span></p>
                    </div>
                    <% if $Up.CurrentUserIsContributor %>
                    <div class="col-auto">
                        <p><a href="create-listing?id={$GroupID}" class="d-flex align-items-center text-decoration-none"><span class="fontsize25 halyard-display font-weight-medium mr-5">$GroupButtonText</span> <i class="fal fa-plus-circle fontsize35"></i></a></p>
                    </div>
                    <% end_if %>
                    <div class="col-12"></div>
                    <div class="col-lg-6 pt-3">
                        <div class="row align-items-center">
                            <div class="col-auto"><img src="$resourceURL('themes/starter/images/infoIcon.png')" alt="{$SiteConfig.Title} - Info Icon"></div>
                            <div class="col-lg-9"><p class="fontsize19 font-weight-book">Recommended $GroupName matching your selected interests. Adjust your preferences at any time in your <a href="/account-settings"><span class="text-underline">account settings.</span></a></p></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <% if $GroupID == '1' %>
                        <% loop $RecommendedWhatsOnListings %>
                            <div class="col-xl-4">
                                <div class="listing-content">
                                    <% if $FeaturedImage %>
                                        <div class="listing-content--img">
                                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Listing.Name}"></a>
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
                                        <p class="mb-3 mt-4"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
                                        <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.RAW.LimitWordCount(15)</span></a></p>
                                    </div>
                                    <div class="listing-content--tags">
                                        <button class="btn-utils addtofavourites fontsize35<% if $Up.Up.addedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.Up.addedToFavourites($ID)" data-status=""><i class="<% if $Up.Up.addedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                                        <% if $Tags %>
                                            <% include ListingTags Tags=$Tags %>
                                        <% end_if %>
                                        <p class="ml-auto"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                                    </div>
                                </div>
                            </div>
                        <% end_loop %>
                    <% else %>
                        <% loop $RecommendedCreativeDirectory %>
                            <div class="col-xl-4">
                                <div class="listing-content">
                                    <% if $FeaturedImage %>
                                        <div class="listing-content--img">
                                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Listing.Name}"></a>
                                        </div>
                                    <% end_if %>
                                    <div class="listing-content--location-date">
                                        <div class="listing-date">
                                            <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$ListingClosestToCurrentDate</span>
                                        </div>
                                        <div class="listing-location ml-auto">
                                            <a href="/all-listings?city={$City}"><span class="text-footer-gray text-underline">$City</span></a>
                                        </div>
                                    </div>
                                    <div class="listing-content--details">
                                        <p class="mb-3 mt-4"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
                                        <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.RAW.LimitWordCount(15)</span></a></p>
                                    </div>
                                    <div class="listing-content--tags">
                                        <button class="btn-utils addtofavourites fontsize35<% if $Up.Up.addedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.Up.addedToFavourites($ID)" data-status=""><i class="<% if $Up.Up.addedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                                        <% if $Tags %>
                                            <% include ListingTags Categories=$Categories %>
                                        <% end_if %>
                                        <p class="ml-auto"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                                    </div>
                                </div>
                            </div>
                        <% end_loop %>
                    <% end_if %>
                    <% if not $Last %>
                        <div class="col-xl-12 pb-lg-7"><hr></div>
                    <% end_if %>
                </div>
            <% end_loop %>
        </div>
    </div>
</section>
