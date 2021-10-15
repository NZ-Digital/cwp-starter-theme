<% if $VisibleSections %>
    <% loop $VisibleSections %>
        <section id="section{$DisplayTypeTrim}-{$ID}" class="page-section section{$DisplayTypeTrim} $SectionWidth<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %>" <% if $SectionBgColor %>style="background-color: #{$SectionBgColor};"<% end_if %>><div class="{$SectionContainer} p-0">$Show</div></section>
    <% end_loop %>
<% end_if %>
