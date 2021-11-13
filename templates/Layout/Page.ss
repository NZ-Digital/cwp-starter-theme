<% if $CurrentMember %>
    <% if $URLSegment == 'my-portal' || $URLSegment == 'my-favourites' || $URLSegment == 'my-listings' || $URLSegment == 'my-recommended' || $URLSegment == 'account-settings' || $URLSegment == 'create-listing' %>
        <% include Includes/User/UserNavigation %>
        <% if $URLSegment == 'my-favourites' %>
            <% include Includes/User/MyFavourites %>
        <% end_if %>
        <% if $URLSegment == 'my-listings' %>
            <% include Includes/User/MyListings %>
        <% end_if %>
        <% if $URLSegment == 'account-settings' %>
            <% include Includes/User/AccountSettings %>
        <% end_if %>
        <% if $URLSegment == 'create-listing' %>
            <% include Includes/User/CreateListing %>
        <% end_if %>
    <% end_if %>
<% end_if %>
<% if $URLSegment == 'sign-up' %>
    <% include Includes/User/RegistrationForm %>
<% end_if %>
<% include VisibleSection %>
