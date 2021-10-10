<div class="imageBanner-container">
    <% if $Image %>
        <div class="banner-img $ImageHeight" style="background: url('{$Image.URL}')"></div>
    <% else %>
        <div class="banner-img-placeholder"></div>
    <% end_if %>
    <% if $Content %>
        <div class="banner-content">$Content</div>
    <% end_if %>
</div>
