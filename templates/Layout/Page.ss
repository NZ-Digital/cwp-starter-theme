<% if $CurrentMember %>
    <% if $URLSegment == 'my-portal' || $URLSegment == 'my-favourites' || $URLSegment == 'my-listings' || $URLSegment == 'my-recommended' %>
        <% include UserNavigation %>
        <% if $URLSegment == 'my-favourites' %>
            <% include MyFavourites %>
        <% end_if %>
        <% if $URLSegment == 'my-listings' %>
            <% include MyListings %>
        <% end_if %>
    <% end_if %>
<% end_if %>
<% include VisibleSection %>
