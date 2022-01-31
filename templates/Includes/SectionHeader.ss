<% if $HeaderTitle || $HeaderButton %>
<div class="row no-gutters justify-content-between align-items-center<% if $ReadableHeaderPaddings %><% loop $ReadableHeaderPaddings %> $Name<% end_loop %> pb-5<% end_if %>">
    <% if $HeaderTitle %>
        <div class="col-lg-auto col-12 text-center pb-lg-0 pb-4">$HeaderTitle</div>
    <% end_if %>
    <% if $HeaderButton %>
    <div class="col-lg-auto col-12 text-center pb-lg-0">$HeaderButton</div>
    <% end_if %>
</div>
<% end_if %>
