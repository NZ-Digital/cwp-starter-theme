<div class="featuredEvents-container">
    <% if $FeaturedItems %>
        <div class="owl-carousel">
            <% loop $FeaturedItems %>
            <div class="">$Name</div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
