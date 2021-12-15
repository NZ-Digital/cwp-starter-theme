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
                            <p class="text-center"><a href="$GroupPageLink" class="d-flex align-items-center text-decoration-none"><span class="fontsize18 halyard-display font-weight-medium theme-button-alt">See all</span></a></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-4 pb-lg-7">
                            <a href="create-listing?id={$GroupID}" class="add-listing"><img src="$resourceURL('themes/starter/images/AddListing.jpg')"></a>
                        </div>
                        <% loop $Listings %>
                            <div class="col-xl-4">
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
                                        <div class="listing-flag<% if $Flag == 'Active' %> active-flag<% else_if $Flag == 'Draft' %> draft-flag<% else_if $Flag == 'Archive' %> archived-flag<% else %> pending-flag<% end_if %>">
                                            <span class="halyard-display font-weight-medium fontsize16 text-white text-uppercase letterspacing-1px"><i class="fas fa-flag"></i><% if $Flag %> $Flag<% end_if %></span>
                                        </div>
                                        <div class="listing-location ml-auto">
                                            <span class="text-footer-gray text-underline">$City</span>
                                        </div>
                                    </div>
                                    <div class="listing-content--details">
                                        <p class="mb-3 mt-4"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
                                        <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.RAW.LimitWordCount(15)</span></a></p>
                                    </div>
                                    <div class="listing-content--tags">
                                        <button class="btn-utils addtofavourites fontsize35<% if $Up.Up.wasAddedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.Up.wasAddedToFavourites($ID)" data-status=""><i class="<% if $Up.Up.wasAddedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                                        <% if $Tags %>
                                            <% include ListingTags Tags=$Tags %>
                                        <% end_if %>
<%--                                        <div class="tag-container">--%>
<%--                                            <div class="tag-items">--%>
<%--                                                <% if $Tags %>--%>
<%--                                                    <% loop $Tags %>--%>
<%--                                                        <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>--%>
<%--                                                    <% end_loop %>--%>
<%--                                                <% end_if %>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
                                        <p class="ml-auto"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                                    </div>
                                </div>
                            </div>
                        <% end_loop %>
                        <% if not $Last %><div class="col-xl-12 pb-lg-7"><hr></div><% end_if %>
                    </div>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</section>
