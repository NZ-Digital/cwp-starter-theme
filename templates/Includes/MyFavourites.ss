<section class="page-section sectionMyFavouriteListings col-lg-12 pt-lg-8">
    <div class="favouriteListings-content inner-padding">
        <div class="container-fluid p-0">

            <%-- What's On Listings --%>
            <div class="row pb-lg-7 justify-content-between align-items-center my-fav--header">
                <div class="col-auto">
                    <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My What’s On Favourites</span></p>
                </div>
                <div class="col-auto">
                    <p><a href="#" class="d-flex align-items-center text-decoration-none"><span class="fontsize25 halyard-display font-weight-medium mr-5">List an event</span> <i class="fal fa-plus-circle fontsize35"></i></a></p>
                </div>
            </div>

            <div class="row my-fav--listings whatson-listings">
                <% if $AllWhatsOnFavouriteListings %>
                    <% loop $AllWhatsOnFavouriteListings %>
                        <% include ListingContent inFavourites=$Up.wasAddedToFavourites($Listing.ID), Listing=$Listing %>
                    <% end_loop %>
                <% else %>
                    <div class="col-lg-12 pt-lg-8 pb-lg-8">
                        <p class="text-center"><span class="fontsize50 font-weight-book lineheight-60px letterspacing-1px">Click here to start adding your favourite<br> What’s On Listings</span></p>
                        <p class="text-center pt-5"><span class="fontsize19 font-weight-book">Click the heart icon to save any listing to your favourites</span></p>
                        <p class="text-center pt-5"><span class="fontsize18 font-weight-medium theme-button-alt">What’s On</span></p>
                    </div>
                <% end_if %>
                <div class="col-lg-12 pb-lg-7"><hr></div>
            </div>

            <%-- Creative Directory Listings --%>
            <div class="row pb-lg-7 justify-content-between align-items-center my-fav--header">
                <div class="col-auto">
                    <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My Creative Directory Favourites</span></p>
                </div>
                <div class="col-auto">
                    <p><a href="#" class="d-flex align-items-center text-decoration-none"><span class="fontsize25 halyard-display font-weight-medium mr-5">Create a directory listing</span> <i class="fal fa-plus-circle fontsize35"></i></a></p>
                </div>
            </div>
            <div class="row my-fav--listings creative-listings">
                <% if $AllCreativeFavouriteListings %>
                    <% loop $AllCreativeFavouriteListings %>
                            <% include ListingContent inFavourites=$Up.wasAddedToFavourites($Listing.ID), Listing=$Listing %>
                    <% end_loop %>
                <% else %>
                    <div class="col-lg-12 pt-lg-8 pb-lg-8">
                        <p class="text-center"><span class="fontsize50 font-weight-book lineheight-60px letterspacing-1px">Click here to start adding your favourite<br> Creative Directory Listings</span></p>
                        <p class="text-center pt-5"><span class="fontsize19 font-weight-book">Click the heart icon to save any listing to your favourites</span></p>
                        <p class="text-center pt-5"><span class="fontsize18 font-weight-medium theme-button-alt">Creative Directory</span></p>
                    </div>
                <% end_if %>
                <div class="col-lg-12 pb-lg-7"><hr></div>
            </div>

            <%--  Find A Space Listings --%>
            <div class="row pb-lg-7 justify-content-between align-items-center my-fav--header">
                <div class="col-auto">
                    <p><span class="fontsize25 halyard-display font-weight-medium letterspacing-7px text-uppercase">My find my space favourites</span></p>
                </div>
                <div class="col-auto">
                    <p><a href="#" class="d-flex align-items-center text-decoration-none"><span class="fontsize25 halyard-display font-weight-medium mr-5">Add a space</span> <i class="fal fa-plus-circle fontsize35"></i></a></p>
                </div>
            </div>

            <div class="row my-fav--listings findspace-listings">
<%--                <% if $AllFindSpaceFavouriteListings %>--%>
<%--                    <% loop $AllFindSpaceFavouriteListings %>--%>
<%--                        <% include ListingContent inFavourites=$Up.wasAddedToFavourites($Listing.ID), Listing=$Listing %>--%>
<%--                    <% end_loop %>--%>
<%--                <% else %>--%>
                    <div class="col-lg-12 pt-lg-8 pb-lg-8">
                        <p class="text-center"><span class="fontsize50 font-weight-book lineheight-60px letterspacing-1px">Click here to start adding your favourite<br> Find a Space Listings</span></p>
                        <p class="text-center pt-5"><span class="fontsize19 font-weight-book">Click the heart icon to save any listing to your favourites</span></p>
                        <p class="text-center pt-5"><span class="fontsize18 font-weight-medium theme-button-alt">Find a Space</span></p>
                    </div>
<%--                <% end_if %>--%>
            </div>
        </div>
    </div>
</section>
