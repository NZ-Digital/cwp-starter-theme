<% include VisibleSection %>
<% if $Listing.AssignedGroup.ID == "1" %>
    <% include Includes/User/ListingPageWhatsOn %>
<% end_if %>
<% if $Listing.AssignedGroup.ID == "2" || $Listing.AssignedGroup.ID == "3" %>
    <% include Includes/User/ListingPageCreativeDirectory %>
<% end_if %>
