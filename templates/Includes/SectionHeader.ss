<% if $HeaderTitle || $HeaderButton %>
<div class="row no-gutters justify-content-between align-items-center<% if $ReadableHeaderPaddings %><% loop $ReadableHeaderPaddings %> $Name<% end_loop %><% end_if %>">
    <% if $HeaderTitle %>
        <div class="col-auto pl-lg-1">$HeaderTitle</div>
    <% end_if %>
    <% if $HeaderButton %>
    <div class="col-auto pr-lg-1">$HeaderButton</div>
    <% end_if %>
</div>
<% end_if %>
