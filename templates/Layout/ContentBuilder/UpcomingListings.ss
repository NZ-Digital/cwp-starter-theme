<div class="upcomingListing-container">
    <% if $VisibleUpcomingListings %>
        <div class="inner-padding container-fluid">
            <div class="row">
            <% loop $VisibleUpcomingListings %>
                <% include ListingContent %>
            <% end_loop %>
            </div>
        </div>
    <% end_if %>
</div>
