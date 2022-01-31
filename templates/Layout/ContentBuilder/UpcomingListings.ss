<div class="upcomingListing-container">
    <% if $VisibleUpcomingListings %>
        <div class="inner-padding container-fluid">
            <div class="row">
            <% loop $VisibleUpcomingListings %>
                <% include ListingContent inFavourites=$Up.addedToFavourites($ID) %>
            <% end_loop %>
            </div>
        </div>
    <% end_if %>
</div>

<% if $HeaderButton %>
    <div class="col-lg-auto col-12 text-center pb-lg-0">$HeaderButton</div>
<% end_if %>
