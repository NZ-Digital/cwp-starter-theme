<% if $Category %>
    <div class="tags">
        <a href="/all-listings?category={$Category.Title}" class="tag-name"><span class="halyard-display font-weight-medium fontsize16 text-uppercase">$Category.Title</span></a>
    </div>
<% end_if %>
