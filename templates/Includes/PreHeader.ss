<% if $SiteConfig.PreHeader %>
    <div class="alert alert-dismissible fade show pre-header mb-0" role="alert" style="background-color: #{$SiteConfig.PreHeaderBg};">
        <div class="preheader-text">
            <div class="preheader-text--desktop">
                $SiteConfig.PreHeader
            </div>
            <div class="preheader-text--mobile">
                <% if $SiteConfig.PreHeaderMobileText %>
                    $SiteConfig.PreHeaderMobileText
                <% else %>
                    $SiteConfig.PreHeader
                <% end_if %>
            </div>
        </div>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
<% end_if %>
