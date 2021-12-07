<div class="imageBanner-container">
    <% if $Image %>
        <div class="banner-img $ImageHeight $BackgroundPosition $ImageSize" style="background-image: url('{$Image.URL}')"></div>
    <% else %>
        <div class="banner-img-placeholder"></div>
    <% end_if %>
    <% if $Content %>
        <div class="banner-content $ContentPosition">$Content</div>
    <% end_if %>
</div>
