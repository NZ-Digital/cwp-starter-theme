<div class="listingsByTag-container">
    <% if $ListingsByTagOrCategory %>
        <% if $ListingsByTagOrCategory %>
            <div class="row">
                <% if $TagOrCategoryName %>
                    <div class="col-xl-12 pb-5">
                        $TagOrCategoryName.RAW
                    </div>
                <% end_if %>
                <% loop $ListingsByTagOrCategory %>
                    <% include ListingContent inFavourites=$Up.addedToFavourites($ID) %>
                <% end_loop %>
            </div>
        <% end_if %>
    <% end_if %>
</div>

