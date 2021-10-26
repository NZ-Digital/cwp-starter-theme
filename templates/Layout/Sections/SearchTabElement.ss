<div class="searchTabElement-container">
    <% if $SearchTab.SearchTabItems %>
    <div class="tab row no-gutters" id="tab-{$ID}">
        <% loop $SearchTab.SearchTabItems %>
            <button class="tablinks col-md-4 <% if $Pos == '1' %>active<% end_if %>" data-id="{$DisplayNameTrim}" style="background-color: #{$TabBgColor};">
                <span class="fontsize35 font-weight-normal text-white">$Name</span>
                <p><span class="fontsize16 font-weight-light">$Description</span></p>
                <% if $Pos == '1' %><i class="fal fa-minus"></i><% else %><i class="fal fa-plus"></i><% end_if %>
            </button>
        <% end_loop %>
    </div>
    <% end_if %>
    <% if $SearchTab.SearchTabItems %>
        <% loop $SearchTab.SearchTabItems %>
        <div id="{$DisplayNameTrim}" class="tabcontent<% if $Pos == '1' %> active<% end_if %>" style="background-color: #{$TabBgColor};">
            <div class="row no-gutters justify-content-center filters">
                <% if $VisibleFilters %>
                <% loop $VisibleFilters %>
                    <div class="col filter-item">
                        <div class="filter-field">
                            <% if $Type == "Date" %>
                                <div class="dropdown filter-date">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownLocation{$ID}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-footer-gray font-weight-normal halyard-display">Any date</span>
                                        <img src="$resourceURL('themes/starter/images/Icon-date.png')" class="img-icon" alt="$Name icon">
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownLocation{$ID}">
                                        <button class="dropdown-item" type="button">This month</button>
                                        <button class="dropdown-item" type="button">Today</button>
                                        <button class="dropdown-item" type="button">Tomorrow</button>
                                        <button class="dropdown-item" type="button">This weekend</button>
                                        <button class="dropdown-item" type="button">Any date</button>
                                    </div>
                                </div>
                            <% end_if %>
                            <% if $Type == 'Location' %>
                                <div class="dropdown filter-location">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownLocation{$ID}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-footer-gray font-weight-normal halyard-display">Anywhere</span>
                                        <i class="fal fa-angle-down fontsize25"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownLocation{$ID}">
                                        <% loop $VisibleLocations %>
                                            <button class="dropdown-item" type="button">$Name</button>
                                        <% end_loop %>
                                        <button class="dropdown-item" type="button">Anywhere</button>
                                    </div>
                                </div>
                            <% end_if %>
                            <% if $Type == 'Category' %>
                                <div class="dropdown filter-categories">
                                    <button class="btn btn-secondary dropdown-toggle fontsize16" type="button" id="dropdownCategory{$ID}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="text-footer-gray font-weight-normal halyard-display">Anything</span>
                                        <i class="fal fa-angle-down fontsize25"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownCategory{$ID}">
                                        <% loop $VisibleCategories %>
                                            <button class="dropdown-item" type="button">$Name</button>
                                        <% end_loop %>
                                        <button class="dropdown-item" type="button">Anything</button>
                                    </div>
                                </div>
                            <% end_if %>
                            <% if $Type == 'Keywords' %>
                                <input type="text" name="keywords" placeholder="Keywords" class="filter-keywords halyard-display fontsize16 font-weight-normal">
                                <i class="fas fa-search"></i>
                            <% end_if %>
                        </div>
                    </div>
                <% end_loop %>
                <div class="filter-action pl-lg-2">
                    <button class="theme-button-yellow-small"><span class="font-weight-medium letterspacing-1px">Search</span></button>
                </div>
                <% end_if %>
            </div>
        </div>
        <% end_loop %>
    <% end_if %>
</div>
