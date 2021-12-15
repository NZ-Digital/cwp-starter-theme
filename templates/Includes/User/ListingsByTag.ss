<section class="page-section sectionListingsByTag col-lg-12 pt-lg-5 pb-lg-4 inner-padding">
    <div class="listingsByTag-container">
        <% if $ListingsByTag %>
            <div class="row">
                <% loop $ListingsByTag %>
                    <% include ListingContent inFavourites=$Up.wasAddedToFavourites($ID) %>
                <% end_loop %>
            </div>
        <% end_if %>
    </div>
</section>
