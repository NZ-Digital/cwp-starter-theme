<div class="featuredEvents-container">
    <% if $FeaturedItems %>
        <div class="owl-carousel">
            <% loop $FeaturedItems %>
            <div class="event-item">
                <img src="{$FeaturedImage.URL}" alt="{$SiteConfig.Title} - {$Name}">
                <div class="event-date">

                </div>
                <div class="event-content">
                    <p class="mb-2"><span class="halyard-display fontsize35 font-weight-normal">{$Name}</span></p>
                    <p class="mb-5"><span class="halyard-display fontsize19 font-weight-book">{$Content.LimitWordCount(30)}</span></p>
                    <p><span class="theme-button-gray-small halyard-display font-weight-medium fontsize16">More info</span></p>
                </div>
            </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
