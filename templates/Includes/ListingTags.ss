<% if $Tags.Count > 1 %>
    <div class="tags">
        <div class="d-flex">
            <div class="short-tags">
                <% loop $Tags.Limit(1) %>
                    <a href="/all-listings?tag={$Title}" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
                <% end_loop %>
            </div>
            <button class="see-more"><span class="halyard-display font-weight-medium fontsize16 d-block"><i class="fas fa-angle-down"></i></span></button>
        </div>
        <div class="more-tags">
            <% loop $Tags %>
                <a href="/all-listings?tag={$Title}" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
            <% end_loop %>
        </div>
    </div>
<% else %>
    <div class="tags">
        <% loop $Tags %>
            <a href="/all-listings?tag={$Title}" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Title</span></a>
        <% end_loop %>
    </div>
<% end_if %>
