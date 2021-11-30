<div class="gridListing-container">
    <% if $VisibleListings %>
        <div class="container-fluid p-0">
            <div class="row no-gutters pl-lg-7 pr-lg-10">
                <div class="col-lg-4 pr-lg-4">$SideContent</div>
                <div class="col-lg-8 pl-lg-5">
                    <div class="row">
                        <% loop $VisibleListings.Limit($Limit) %>
                            <div class="col-lg-6">
                                <div class="listing-content">
                                    <% if $FeaturedImage %>
                                        <div class="listing-content--img">
                                            <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>">
                                                <img src="{$FeaturedImage.URL}" class="mb-2" alt="{$SiteConfig.Title} - {$Name}">
                                            </a>
                                        </div>
                                    <% end_if %>
                                    <div class="listing-content--location">
                                        <a href="#"><span class="text-footer-gray text-underline">$City</span></a>
                                    </div>
                                    <div class="listing-content--details">
                                        <p class="mb-3 mt-4"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize25 font-weight-normal line-height-100">{$Name}</span></a></p>
                                        <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-100">{$Content.RAW.LimitWordCount(15)}</span></a></p>
                                    </div>
                                    <div class="listing-content--tags">
                                        <button class="btn-utils addtofavourites fontsize35<% if $Up.wasAddedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.wasAddedToFavourites($ID)"><i class="<% if $Up.wasAddedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>
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
                </div>
            </div>
        </div>
    <% end_if %>
</div>
