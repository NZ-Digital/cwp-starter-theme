<section class="page-section sectionMyListings col-lg-12 pt-lg-8">
    <div class="myListings-content inner-padding">
        <div class="container-fluid p-0">
            <% if $MyListings %>
                <% loop $MyListings %>
                    <div class="row pb-lg-7 justify-content-between align-items-center">
                        <div class="col-auto">
                            <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My $GroupName Listings</span></p>
                        </div>
                        <div class="col-auto">
                            <p class="text-center"><a href="#" class="d-flex align-items-center text-decoration-none"><span class="fontsize18 halyard-display font-weight-medium theme-button-alt">See all</span></a></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 pb-lg-7">
                            <a href="create-listing?id={$GroupID}" class="add-listing"><img src="$resourceURL('themes/starter/images/AddListing.jpg')"></a>
                        </div>
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
                                            <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px"><% if $ListingClosestToCurrentDate %>$ListingClosestToCurrentDate<% else %>THU 18 NOV<% end_if %></span>
                                        </div>
                                        <div class="listing-flag<% if $Flag == 'Active' %> active-flag<% else_if $Flag == 'Draft' %> draft-flag<% else_if $Flag == 'Archive' %> archived-flag<% else %> pending-flag<% end_if %>">
                                            <span class="halyard-display font-weight-medium fontsize16 text-white text-uppercase letterspacing-1px"><i class="fas fa-flag"></i><% if $Flag %> $Flag<% else %> Pending<% end_if %></span>
                                        </div>
                                        <div class="listing-location ml-auto">
                                            <span class="text-footer-gray text-underline">$City</span>
                                        </div>
                                    </div>
                                    <div class="listing-content--details">
                                        <p class="mb-3 mt-4"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></p>
                                        <p><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.LimitWordCount(15)</span></p>
                                    </div>
                                    <div class="listing-content--tags">
                                        <button class="btn-utils addtofavourites fontsize35" data-id="$ID"><i class="far fa-heart"></i></button>
                                        <% if $Tags %>
                                            <% loop $Tags %>
                                                <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                                            <% end_loop %>
                                        <% else %>
                                            <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">Jazz</span></a>
                                            <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">Workshop</span></a>
                                        <% end_if %>
                                        <p class="ml-auto"><a href="#"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>
                                    </div>
                                </div>
                            </div>
                        <% end_loop %>
                        <% if not $Last %><div class="col-lg-12 pb-lg-7"><hr></div><% end_if %>
                    </div>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</section>
