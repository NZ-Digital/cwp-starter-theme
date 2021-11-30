<div class="container-fluid">
    <% if $VisibleFooterItems %>
    <div class="row justify-content-between">
        <% loop $VisibleFooterItems %>
            <% if not $IsPostFooter %>
                <div class="{$Width}<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %> $Type">
                    $Content
                </div>
            <% end_if %>
        <% end_loop %>
    </div>
    <% end_if %>
    <div class="row row-cols-5 pt-lg-7 pb-lg-4">
        <div class="col mr-auto">
            <p>
                <span class="halyard-display font-weight-medium text-footer-gray fontsize14">&copy; $Now.Year {$SiteConfig.Title}. All rights reserved.</span>
            </p>
        </div>
        <% loop $VisibleFooterItems %>
            <% if $IsPostFooter %>
                <div class="col-auto text-right">
                    $Content
                </div>
            <% end_if %>
        <% end_loop %>
    </div>
</div>
