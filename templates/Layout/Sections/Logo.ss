<div class="logo-container">
    <% if $VisibleLogoItems %>
        <div class="row row-cols-5 no-gutters">
            <% loop $VisibleLogoItems %>
                <div class="col<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %>">
                    $Content
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
