<div class="upcomingListing-container">
    <% if $VisibleUpcomingListings %>
        <div class="inner-padding container-fluid">
            <div class="row">
            <% loop $VisibleUpcomingListings %>
                <% include ListingContent inFavourites=$Up.wasAddedToFavourites($ID) %>
            <% end_loop %>
            </div>
        </div>
    <% end_if %>
</div>
