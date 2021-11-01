<% if $VisibleSections %>
    <% loop $VisibleSections %>
        <% if $VisibleContentBuilder %>
            <section id="section{$VisibleContentBuilder.DisplayTypeTrim}-{$ID}" class="page-section section{$VisibleContentBuilder.DisplayTypeTrim} $Width<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %>" <% if $BgColor %>style="background-color: #{$BgColor};"<% end_if %>><div class="{$ContainerType} p-0">$VisibleContentBuilder.Show</div></section>
        <% end_if %>
    <% end_loop %>
<% end_if %>
