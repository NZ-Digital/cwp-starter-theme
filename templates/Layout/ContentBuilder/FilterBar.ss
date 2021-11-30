<div class="filterBar-container">
    <% if $VisibleListingGroups %>
        <div class="tab row no-gutters" id="tab-{$ID}">
            <% loop $VisibleListingGroups %>
                <button class="tablinks col-lg-4<% if $Up.ListingGroupID == $ID %> active<% end_if %><% if $Up.URLSegment == "home" && $Pos == "1"%> active<% end_if %>" data-id="{$ID}" style="background-color: #{$GroupColor};">
                    $Content
                    <span class="fontsize25"><% if $Up.ListingGroupID == $ID %><i class="fal fa-minus"></i><% else_if $Up.URLSegment == "home" && $Pos == "1" %><i class="fal fa-minus"></i> <% else %><i class="fal fa-plus"></i><% end_if %></span>
                </button>
            <% end_loop %>
        </div>
        <% loop $VisibleListingGroups %>
            <% if $Filter.VisibleFieldItems %>
                <div id="tabcontent-{$ID}" class="tabcontent<% if $Up.ListingGroupID == $ID %> active<% end_if %><% if $Up.URLSegment == "home" && $Pos == "1"%> active<% end_if %>" style="background-color: #{$GroupColor};">
                    <div class="row no-gutters justify-content-center filters">
                        <% loop $Filter.VisibleFieldItems %>
                            <div class="col filter-item">
                                <div class="filter-field">
                                    <% if $FieldType != "Keywords" %>
                                        <div class="dropdown filter{$FieldType}">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdown{$ID}" data-type="{$FieldType}" data-id="{$ID}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <% if $FieldType == "Date" %>
                                                    <span class="text-footer-gray font-weight-normal halyard-display">Any date</span>
                                                    <img src="$resourceURL('themes/starter/images/Icon-date.png')" class="img-icon" alt="$Name icon">
                                                <% end_if %>
                                                <% if $FieldType == "Location" %>
                                                    <span class="text-footer-gray font-weight-normal halyard-display">Anywhere</span>
                                                    <i class="fal fa-angle-down fontsize25"></i>
                                                <% end_if %>
                                                <% if $FieldType == "Category" %>
                                                    <span class="text-footer-gray font-weight-normal halyard-display">Anything</span>
                                                    <i class="fal fa-angle-down fontsize25"></i>
                                                <% end_if %>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdown{$ID}">
                                                <% if $FieldType == "Date" %>
                                                    <div class="calendar-options">
                                                        <button class="dropdown-item" type="button">This month</button>
                                                        <button class="dropdown-item" type="button">Today</button>
                                                        <button class="dropdown-item" type="button">Tomorrow</button>
                                                        <button class="dropdown-item" type="button">This weekend</button>
                                                        <button class="dropdown-item" type="button">Any date</button>
                                                    </div>
                                                    <div class="calendar" id="datepicker{$ID}"></div>
                                                <% end_if %>
                                                <% if $FieldType == "Location" %>
                                                    <% loop $VisibleLocations %><button class="dropdown-item" type="button">$Name</button><% end_loop %>
                                                <% end_if %>
                                                <% if $FieldType == "Category" %>
                                                    <% loop $VisibleCategories %><button class="dropdown-item" type="button">$Title</button><% end_loop %>
                                                <% end_if %>
                                            </div>
                                        </div>
                                    <% else %>
                                        <div class="filter{$FieldType}">
                                            <input type="text" name="keywords" placeholder="Keywords" class="halyard-display fontsize16 font-weight-normal">
                                            <i class="fas fa-search"></i>
                                        </div>
                                    <% end_if %>
                                </div>
                            </div>
                        <% end_loop %>
                        <div class="filter-action pl-lg-2">
                            <button class="theme-button-yellow-small-arrow"><span class="font-weight-medium letterspacing-1px">Search</span></button>
                        </div>
                    </div>
                </div>
            <% end_if %>
        <% end_loop %>
    <% end_if %>
</div>
