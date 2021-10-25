<div class="listingGrid-container">
    <% if $Listings %>
        <div class="row no-gutters align-items-center justify-content-between pr-lg-7 pb-lg-8">
            <div class="col-auto">
                <p><span class="font-weight-light fontsize80 halyard-display yellow-line">$Name</span></p>
            </div>
            <div class="col-auto">
                <% if $PageLink %>
                    <a href="{$PageLink.Link}"><span class="theme-button-hover-dark fontsize18 font-weight-medium">{$ButtonText}</span></a>
                <% end_if %>
            </div>
        </div>
        <div class="container-fluid p-0">
            <div class="row no-gutters pl-lg-7 inner-padding--right">
                <div class="col-lg-4 pr-lg-4">
                    $Content
                </div>
                <div class="col-lg-8 pl-lg-5">
                    <div class="row">
                        <% loop $Listings %>
                            <div class="col-lg-6 pb-lg-7">
                                <div class="listing-content">
                                    <% if $FeaturedImage %>
                                        <div class="listing-content--img">
                                            <img src="{$FeaturedImage.URL}" class="mb-2" alt="{$SiteConfig.Title} - {$Name}">
                                        </div>
                                    <% end_if %>
                                    <div class="listing-content--location">
                                        <a href="#"><span class="text-footer-gray text-underline">$Location</span></a>
                                    </div>
                                    <div class="listing-content--details">
                                        <p class="mb-3 mt-4"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></p>
                                        <p><span class="halyard-display fontsize19 font-weight-book line-height-100">{$Content.LimitWordCount(15)}</span></p>
                                    </div>
                                    <div class="listing-content--tags">
                                        <button class="addtofavourites"><img src="$resourceURL('themes/starter/images/Icon feather-heart.png')" width="34.26" alt="$SiteConfig.Title - add to your favourites"> </button>
                                        <% if $Tags %>
                                            <% loop $Tags %>
                                                <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                                            <% end_loop %>
                                        <% end_if %>
                                        <p class="ml-auto"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></p>
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
