<% if $HeaderTitle || $HeaderContent || $HeaderButton %>
<div class="row no-gutters justify-content-between pr-lg-7 pl-lg-7">
    <% if $HeaderTitle %>
        <div class="col-auto pl-lg-1 pb-lg-6">$HeaderTitle</div>
    <% end_if %>
    <% if $HeaderButton %>
    <div class="col-auto pr-lg-1 pb-lg-6">$HeaderButton</div>
<%--        <% if $PageLink %>--%>
<%--            <a href="{$PageLink.Link}"><span class="theme-button-hover-dark fontsize18 font-weight-medium">{$ButtonText}</span></a>--%>
<%--        <% end_if %>--%>
    <% end_if %>
</div>
<% end_if %>
