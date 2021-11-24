<div class="sortableListings-container">
    <div class="sortable-listings">
        <div class="sortable-listings--sorter">
            <div class="dropdown">
                <button class="btn dropdown-toggle text-left" type="button" id="listings-sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-sort-amount-down-alt fontsize19 pr-3"></i><span class="text-uppercase halyard-display font-weight-medium text">Sort By</span>
                    <i class="fal fa-angle-down fontsize25"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="listings-sort">
                    <button class="dropdown-item" type="button" data-sort="ASC">A - Z</button>
                    <button class="dropdown-item" type="button" data-sort="DESC">Z - A</button>
                    <button class="dropdown-item" type="button" data-sort="Recent">Recent</button>
                </div>
                <input type="hidden" name="group-type" value="$ListingGroupID">
            </div>
        </div>
        <div class="loader">Loading...</div>
        <div class="sortable-listings--item">
            <% include Includes/User/FilteredListings Listings=$FilteredListings %>
        </div>
    </div>
</div>
