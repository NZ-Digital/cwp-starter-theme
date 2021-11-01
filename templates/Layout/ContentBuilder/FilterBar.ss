<div class="filterBar-container">
    <% if $VisibleListingGroups %>
        <div class="tab row no-gutters" id="tab-{$ID}">
            <% loop $VisibleListingGroups %>
                <button class="tablinks col-md-4<% if $Pos == '1' %> active<% end_if %>" data-id="{$ID}" style="background-color: #{$GroupColor};">
                    $Content
                    <% if $Pos == '1' %><i class="fal fa-minus"></i><% else %><i class="fal fa-plus"></i><% end_if %>
                </button>
            <% end_loop %>
        </div>
        <% loop $VisibleListingGroups %>
            <% if $Filter.VisibleFieldItems %>
                <div id="tabcontent-{$ID}" class="tabcontent<% if $Pos == '1' %> active<% end_if %>" style="background-color: #{$GroupColor};">
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
                                                    <% loop $VisibleCategories %><button class="dropdown-item" type="button">$Name</button><% end_loop %>
                                                <% end_if %>
                                            </div>
                                        </div>
                                    <% else %>
                                        <div class="filter{$FieldType}">
                                            <input type="text" name="keywords" placeholder="Keywords" class="filter-keywords halyard-display fontsize16 font-weight-normal">
                                            <i class="fas fa-search"></i>
                                        </div>
                                    <% end_if %>
                                </div>
                            </div>
                        <% end_loop %>
                    </div>
                </div>
            <% end_if %>
        <% end_loop %>
    <% end_if %>
</div>
