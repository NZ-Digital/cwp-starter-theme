<div class="imageWithContent-container">
    <div class="row no-gutters">
        <div class="col-lg-5<% if $ContentPosition == 'cp-left' %> order-last<% end_if %> order-lg-0 order-1" >
            <% if $Image %>
                <div class="image-content--img $ImageHeight $ImageSize" style="background-image: url('{$Image.URL}')"></div>
            <% end_if %>
        </div>
        <div class="col-lg-7<% if $ContentPosition == 'cp-left' %> order-first<% end_if %> order-lg-1 order-0"><div class="image-content--content $ImageHeight"<% if $ContentBg %> style="background-image: url('{$ContentBg.URL}'); <% if $ContentBgColor %>background-color:#{$ContentBgColor};<% end_if %>" <% end_if %>>$Content</div></div>
    </div>
</div>
