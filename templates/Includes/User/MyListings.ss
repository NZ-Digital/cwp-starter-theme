<section class="page-section sectionMyListings col-lg-12 pt-lg-8">
    <div class="myListings-content inner-padding">
        <div class="container-fluid p-0">
            <% if $MyListings %>
                <% loop $MyListings %>
                    <div class="row pb-lg-7 pb-4 justify-content-between align-items-center">
                        <div class="col-lg-auto col-12 pb-lg-0 pb-5">
                            <p class="text-lg-left text-center"><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My $GroupName Listings</span></p>
                        </div>
                        <div class="col-lg-auto col-12">
                            <p class="text-center"><a href="$GroupPageLink" class="text-decoration-none"><span class="fontsize18 halyard-display font-weight-medium theme-button-alt">See all</span></a></p>
                        </div>
                    </div>
                    <div class="row pb-4">
                        <div class="col-xl-4 pb-lg-7 pb-5">
                            <a href="create-listing?id={$GroupID}" class="add-listing"><img src="$resourceURL('themes/starter/images/AddListing.jpg')"></a>
                        </div>
                        <% loop $Listings %>
                            <div class="col-xl-4">
                                <div class="listing-content">
                                    <div class="listing-action">
                                        <div class="dropdown show">
                                            <button class="action-btn" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></button>
                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink">
                                                <% if $Page %>
                                                    <a class="dropdown-item" href="$Page.Link"><span class="fontsize14 font-weight-medium text-footer-gray">View live listing</span></a>
                                                <% end_if %>
                                                <a class="dropdown-item" href="create-listing?id={$AssignedGroup.ID}&MultiFormSessionID={$SessionURL}&listingID={$ID}"><span class="fontsize14 font-weight-medium text-footer-gray">Edit listing</span></a>
                                                <% if $Flag == 'Active' %>
                                                <a class="dropdown-item" href="#"><span class="fontsize14 font-weight-medium text-footer-gray">Edit announcement bar</span></a>
                                                <a class="dropdown-item" href="#"><span class="fontsize14 font-weight-medium text-footer-gray">Duplicate listing</span></a>
                                                <a class="dropdown-item" href="#"><span class="fontsize14 font-weight-medium text-footer-gray">Deactivate listing</span></a>
                                                <% end_if %>
                                                <a class="dropdown-item" href="#" data-id="$ID"><span class="fontsize14 font-weight-medium text-footer-gray">Delete listing</span></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="listing-content--img">
                                        <% if $FeaturedImage %>
                                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}"></a>
                                        <% else %>
                                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><img src="$resourceURL('themes/starter/images/vertical-honing.jpg')" alt="{$SiteConfig.Title} - {$Name}"></a>
                                        <% end_if %>
                                    </div>
                                    <div class="listing-content--location-date align-items-center">
                                        <% if $ListingClosestToCurrentDate %>
                                        <div class="listing-date">
                                            <span class="halyard-display font-weight-medium fontsize16 text-uppercase text-white letterspacing-1px">$ListingClosestToCurrentDate</span>
                                        </div>
                                        <% end_if %>
                                        <% if $Flag %>
                                        <div class="listing-flag<% if $Flag == 'Active' %> active-flag<% else_if $Flag == 'Draft' %> draft-flag<% else_if $Flag == 'Archive' %> archived-flag<% else %> pending-flag<% end_if %>">
                                            <span class="halyard-display font-weight-medium fontsize16 text-white text-uppercase letterspacing-1px"><i class="fas fa-flag"></i>$Flag</span>
                                        </div>
                                        <% end_if %>
                                        <% if $City %>
                                        <div class="listing-location<% if $ListingClosestToCurrentDate %> ml-auto<% end_if %>">
                                            <a href="/all-listings?city={$City}"><span class="text-footer-gray text-underline">$City</span></a>
                                        </div>
                                        <% end_if %>
                                    </div>
                                    <div class="listing-content--details">
                                        <p class="mb-3 mt-4"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
                                        <% if $ContentSummary %>
                                            <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize19 font-weight-book line-height-100">$ContentSummary.LimitWordCount(15)</span></a></p>
                                        <% else %>
                                            <% if $ContentSummaryRaw %>
                                                <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize19 font-weight-book line-height-100">$ContentSummaryRaw.RAW.LimitWordCount(15)</span></a></p>
                                            <% else %>
                                                <% if $ContentRaw %>
                                                    <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize19 font-weight-book line-height-100">$ContentRaw.RAW.LimitWordCount(15)</span></a></p>
                                                <% else %>
                                                    <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize19 font-weight-book line-height-100">$Content.LimitWordCount(15)</span></a></p>
                                                <% end_if %>
                                            <% end_if %>
                                        <% end_if %>
                                    </div>
                                    <div class="listing-content--tags">
                                        <button class="btn-utils addtofavourites fontsize35<% if $Up.Up.addedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.Up.addedToFavourites($ID)" data-status=""><i class="<% if $Up.Up.addedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
                                        <% if $Category %>
                                            <% include ListingCategory Category=$Category %>
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
                                        <p class="ml-auto view-listing"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
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
<% if $Success %>
    <div class="modal fade show contributor-modal" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    $SiteConfig.ContributorsRegistrationMessageSuccess
                </div>
            </div>
        </div>
    </div>
<% end_if %>
