<section class="page-section sectionMyListings col-lg-12 pt-lg-8">
    <div class="myListings-content inner-padding">
        <div class="container-fluid p-0">

            <%-- What's On Listings --%>
            <div class="row pb-lg-7 justify-content-between align-items-center my-listings--header">
                <div class="col-auto">
                    <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My What’s On Listings</span></p>
                </div>
                <div class="col-auto">
                    <p class="text-center"><a href="#" class="d-flex align-items-center text-decoration-none"><span class="fontsize18 halyard-display font-weight-medium theme-button-alt">See all</span></a></p>
                </div>
            </div>

            <div class="row my-listings--listings whatson-listings">
                <div class="col-lg-4 pb-lg-7">
                    <button class="addListing"><img src="$resourceURL('themes/starter/images/AddListing.jpg')"></button>
                </div>
                <% loop $AllMyWhatsOnListings %>
                    <div class="col-lg-4">
                        <div class="listing-content">
                            <% if $FeaturedImage %>
                                <div class="listing-content--img">
                                    <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
                                </div>
                            <% end_if %>
                            <div class="listing-content--location-date align-items-center">
                                <div class="listing-date">
                                    <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$ListingClosestToCurrentDate</span>
                                </div>
                                <div class="listing-flag<% if $Flag == 'Active' %> active-flag<% else %> pending-flag<% end_if %>">
                                    <span class="halyard-display font-weight-medium fontsize16 text-white text-uppercase letterspacing-1px"><i class="fas fa-flag"></i> $Flag</span>
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
                                <button class="btn-utils addtofavourites fontsize35<% if $Up.wasAddedToFavourites($ID) %> active<% end_if %>" data-id="$ID"><i class="<% if $Up.wasAddedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                                <% if $Tags %>
                                    <% loop $Tags %>
                                        <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                                    <% end_loop %>
                                <% end_if %>
                                <p class="ml-auto"><a href="<% if $ListingPage %>$ListingPage.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>
                            </div>
                        </div>
                    </div>
                <% end_loop %>
                <div class="col-lg-12 pb-lg-7"><hr></div>
            </div>

            <%-- Creative Directory Listings --%>
            <div class="row pb-lg-7 justify-content-between align-items-center my-listings--header">
                <div class="col-auto">
                    <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My Creative Directory Listings</span></p>
                </div>
                <div class="col-auto">
                    <p class="text-center"><a href="#" class="d-flex align-items-center text-decoration-none"><span class="fontsize18 halyard-display font-weight-medium theme-button-alt">See all</span></a></p>
                </div>
            </div>

            <div class="row my-listings--listings creative-listings">
                <div class="col-lg-4 pb-lg-7">
                    <button class="addListing"><img src="$resourceURL('themes/starter/images/AddListing.jpg')"></button>
                </div>
                <% loop $AllMyCreativeListings %>
                    <div class="col-lg-4">
                        <div class="listing-content">
                            <div class="listing-content--options">

                            </div>
                            <% if $FeaturedImage %>
                                <div class="listing-content--img">
                                    <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
                                </div>
                            <% end_if %>
                            <div class="listing-content--location-date align-items-center">
                                <div class="listing-date">
                                    <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$ListingClosestToCurrentDate</span>
                                </div>
                                <div class="listing-flag<% if $Flag == 'Active' %> active-flag<% else %> pending-flag<% end_if %>">
                                    <span class="halyard-display font-weight-medium fontsize16 text-white text-uppercase letterspacing-1px"><i class="fas fa-flag"></i> $Flag</span>
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
                                <button class="btn-utils addtofavourites fontsize35<% if $Up.wasAddedToFavourites($ID) %> active<% end_if %>" data-id="$ID"><i class="<% if $Up.wasAddedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                                <% if $Tags %>
                                    <% loop $Tags %>
                                        <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                                    <% end_loop %>
                                <% end_if %>
                                <p class="ml-auto"><a href="<% if $ListingPage %>$ListingPage.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>
                            </div>
                        </div>
                    </div>
                <% end_loop %>
                <div class="col-lg-12 pb-lg-7"><hr></div>
            </div>

            <%-- Find a Space Listings --%>
            <div class="row pb-lg-7 justify-content-between align-items-center my-listings--header">
                <div class="col-auto">
                    <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My Find a Space Directory Listings</span></p>
                </div>
                <div class="col-auto">
                    <p class="text-center"><a href="#" class="d-flex align-items-center text-decoration-none"><span class="fontsize18 halyard-display font-weight-medium theme-button-alt">See all</span></a></p>
                </div>
            </div>

            <div class="row my-listings--listings findspace-listings">
                <div class="col-lg-4 pb-lg-7">
                    <button class="addListing"><img src="$resourceURL('themes/starter/images/AddListing.jpg')"></button>
                </div>
<%--                <% loop $AllMyFindSpaceListings %>--%>
<%--                    <div class="col-lg-4">--%>
<%--                        <div class="listing-content">--%>
<%--                            <% if $FeaturedImage %>--%>
<%--                                <div class="listing-content--img">--%>
<%--                                    <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">--%>
<%--                                </div>--%>
<%--                            <% end_if %>--%>
<%--                            <div class="listing-content--location-date">--%>
<%--                                <div class="listing-date">--%>
<%--                                    <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$ListingClosestToCurrentDate</span>--%>
<%--                                </div>--%>
<%--                                <div class="listing-flag<% if $Flag == 'Active' %> active-flag<% else %> pending-flag<% end_if %>">--%>
<%--                                    <span class="halyard-display font-weight-medium fontsize16 text-white text-uppercase letterspacing-1px"><i class="fas fa-flag"></i> $Flag</span>--%>
<%--                                </div>--%>
<%--                                <div class="listing-location ml-auto">--%>
<%--                                    <span class="text-footer-gray text-underline">$City</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="listing-content--details">--%>
<%--                                <p class="mb-3 mt-4"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></p>--%>
<%--                                <p><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.LimitWordCount(15)</span></p>--%>
<%--                            </div>--%>
<%--                            <div class="listing-content--tags">--%>
<%--                                <button class="btn-utils addtofavourites fontsize35<% if $Up.wasAddedToFavourites($ID) %> active<% end_if %>" data-id="$ID"><i class="<% if $Up.wasAddedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>--%>
<%--                                <% if $Tags %>--%>
<%--                                    <% loop $Tags %>--%>
<%--                                        <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>--%>
<%--                                    <% end_loop %>--%>
<%--                                <% end_if %>--%>
<%--                                <p class="ml-auto"><a href="<% if $ListingPage %>$ListingPage.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                <% end_loop %>--%>
            </div>
        </div>
    </div>
</section>
