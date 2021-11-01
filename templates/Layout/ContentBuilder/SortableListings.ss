<div class="sortableListings-container">
    <div class="sortable-listing">
        <div class="sortable-listing--sorter">
            <div class="dropdown">
                <button class="btn dropdown-toggle text-left" type="button" id="listings-sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-sort-amount-down-alt fontsize19 pr-3"></i><span class="text-uppercase halyard-display font-weight-medium">Sort By</span>
                    <i class="fal fa-angle-down fontsize25"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="listings-sort">
                    <button class="dropdown-item" type="button">A - Z</button>
                    <button class="dropdown-item" type="button">Z - A</button>
                    <button class="dropdown-item" type="button">Recent</button>
                </div>
            </div>
        </div>
        <div class="sortable-listing--items">
            <div class="row">
                <% loop $SearchTabItem.Listings %>
                    <% include ListingContent %>
                <% end_loop %>
            </div>
        </div>
    </div>
</div>

