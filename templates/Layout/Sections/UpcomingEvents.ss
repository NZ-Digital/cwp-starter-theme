<div class="upcomingEvents-container">
    <% if $UpcomingEventItems %>
        <div class="row no-gutters align-items-center justify-content-between pr-lg-7 pl-lg-7 pb-lg-9">
            <div class="col-auto">
                <p><span class="halyard-display fontsize25 font-weight-medium letterspacing-7px">$Name</span></p>
            </div>
            <div class="col-auto">
                <% if $PageLink %>
                    <a href="{$PageLink.Link}"><span class="theme-button-hover-dark fontsize18 font-weight-medium">{$ButtonText}</span></a>
                <% end_if %>
            </div>
        </div>
        <div class="inner-padding container-fluid">
            <div class="row">
            <% loop $UpcomingEventItems %>
                <% include ListingContent %>
            <% end_loop %>
            </div>
        </div>
    <% end_if %>
</div>
