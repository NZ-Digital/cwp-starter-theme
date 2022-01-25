<% loop $Groups %>
    <div class="row pb-lg-7 justify-content-between align-items-center">
        <div class="col-auto">
            <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My $GroupName Favourites</span></p>
        </div>
        <% if $Up.CurrentUserIsContributor %>
        <div class="col-auto">
            <p><a href="create-listing?id={$GroupID}" class="d-flex align-items-center text-decoration-none"><span class="fontsize25 halyard-display font-weight-medium mr-5">$GroupButtonText</span> <i class="fal fa-plus-circle fontsize35"></i></a></p>
        </div>
        <% end_if %>
    </div>
    <div class="row">
        <%--        <div class="col-lg-12">--%>
        <%--            <img src="$resourceURL('themes/starter/images/favouritesIcon.png')" alt="{$SiteConfig.Title} - Favourites Icon">--%>
        <%--                <p>Your favourited listings all in one spot</p>--%>
        <%--        </div>--%>
        <% if $Listings %>
            <% loop $Listings %>
                <div class="col-xl-4">
                    <div class="listing-content">
                        <% if $Listing.FeaturedImage %>
                            <div class="listing-content--img">
                                <a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><img src="{$Listing.FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Listing.Name}"></a>
                            </div>
                        <% end_if %>
                        <div class="listing-content--location-date">
                            <div class="listing-date">
                                <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$Listing.ListingClosestToCurrentDate</span>
                            </div>
                            <div class="listing-location ml-auto">
                                <a href="/all-listings?city={$Listing.City}"><span class="text-footer-gray text-underline">$Listing.City</span></a>
                            </div>
                        </div>
                        <div class="listing-content--details">
                            <p class="mb-3 mt-4"><a href="<% if $ListingPage %>$ListingPage.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Listing.Name}</span></a></p>
                            <p><a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Listing.Content.RAW.LimitWordCount(15)</span></a></p>
                        </div>
                        <div class="listing-content--tags">
                            <button class="btn-utils addtofavourites fontsize35 active" data-id="{$Listing.ID}"><i class="fas fa-heart"></i></button>
                            <% if $Listing.Categories %>
                                <% include ListingTags Categories=$Listing.Categories %>
                            <% end_if %>
                            <p class="ml-auto"><a href="<% if $Page %>$Page.Link<% else_if $Listing.Page %>$Listing.Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                        </div>
                    </div>
                </div>
            <% end_loop %>
        <% else %>
            <div class="col-xl-12 pt-lg-8 pb-lg-8">
                <p class="text-center"><span class="fontsize50 font-weight-book lineheight-60px letterspacing-1px">Click here to start adding your favourite<br> {$GroupName} Listings</span></p>
                <p class="text-center pt-5"><span class="fontsize19 font-weight-book">Click the heart icon to save any listing to your favourites</span></p>
                <p class="text-center pt-5"><a href="$GroupPageLink"><span class="fontsize18 font-weight-medium theme-button-alt">$GroupName</span></a></p>
            </div>
        <% end_if %>
        <% if not $Last %>
            <div class="col-xl-12 pb-lg-7"><hr></div>
        <% end_if %>
    </div>
<% end_loop %>



<%--<div class="listings-content">--%>
<%--    <% loop $Groups %>--%>
<%--        $groupName <br>--%>
<%--        <% loop $Listings %>--%>
<%--           $Name <button class="tester" data-id="{$ListingID}">Delete</button><br>--%>
<%--        <% end_loop %>--%>
<%--        <hr>--%>
<%--    <% end_loop %>--%>
<%--</div>--%>
