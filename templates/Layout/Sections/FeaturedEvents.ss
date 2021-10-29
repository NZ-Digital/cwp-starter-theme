<div class="featuredEvents-container">
    <% if $FeaturedItems %>
        <div class="row no-gutters justify-content-between pr-lg-7 pl-lg-7">
            <div class="col-auto pl-lg-1 pb-lg-6">
                <p><span class="halyard-display fontsize25 font-weight-medium letterspacing-7px">$Name</span></p>
            </div>
            <div class="col-auto pr-lg-1 pb-lg-6">
                <% if $PageLink %>
                    <a href="{$PageLink.Link}"><span class="theme-button-hover-dark fontsize18 font-weight-medium">{$ButtonText}</span></a>
                <% end_if %>
            </div>
        </div>
        <div class="owl-carousel">
            <% loop $FeaturedItems %>
            <div class="listing-content">
                <% if $FeaturedImage %>
                    <div class="listing-content--img">
                        <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
                    </div>
                <% end_if %>
                <div class="listing-content--date">
                    <% if $VisibleListingDateAndTime %>
                        <% loop $VisibleListingDateAndTime %>
                            <span class="halyard-display font-weight-medium fontsize16 text-uppercase letterspacing-1px">$Date.Format(E dd LLL)</span>
                        <% end_loop %>
                    <% end_if %>
                </div>
                <div class="listing-content--tags">
                    <button class="btn-utils addtofavourites"><img src="$resourceURL('themes/starter/images/Icon feather-heart.png')" width="34.26" alt="$SiteConfig.Title - add to your favourites"> </button>
                    <% if $Tags %>
                        <% loop $Tags %>
                            <a href="#" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                        <% end_loop %>
                    <% end_if %>
                </div>
                <div class="listing-content--details">
                    <p class="mb-3"><span class="halyard-display fontsize35 font-weight-normal">{$Name}</span></p>
                    <p class="mb-5"><span class="halyard-display fontsize19 font-weight-book">{$Content.LimitWordCount(30)}</span></p>
                    <p><a href="<% if $ListingPage %>$ListingPage.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></a></p>
                </div>
            </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
