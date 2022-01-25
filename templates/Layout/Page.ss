<% if $CurrentMember %>
    <% if $URLSegment == 'my-portal' || $URLSegment == 'my-favourites' || $URLSegment == 'my-listings' || $URLSegment == 'my-recommended' || $URLSegment == 'account-settings' || $URLSegment == 'create-listing' || $URLSegment == 'my-recommended' ||  $URLSegment == 'submit-a-news-article' || $URLSegment == 'become-a-contributor' || $URLSegment == 'become-a-contributor-form' %>
        <% include Includes/User/UserNavigation %>
        <% if $URLSegment == 'my-favourites' %>
            <% include Includes/User/MyFavourites %>
        <% end_if %>
        <% if $URLSegment == 'my-listings' %>
            <% if $CurrentUserIsContributor %>
                <% include Includes/User/MyListings %>
            <% end_if %>
        <% end_if %>
        <% if $URLSegment == 'my-recommended' %>
            <% include Includes/User/RecommendedListings %>
        <% end_if %>
        <% if $URLSegment == 'account-settings' %>
            <% include Includes/User/AccountSettings %>
        <% end_if %>
        <% if $URLSegment == 'submit-a-news-article' %>
            <% include Includes/User/CreateArticle %>
        <% end_if %>
        <% if $URLSegment == 'create-listing' %>
            <% if $CurrentUserIsContributor %>
            <% include Includes/User/CreateListing %>
            <% end_if %>
        <% end_if %>
        <% if $URLSegment == 'become-a-contributor' %>
            <% if not $CurrentUserIsContributor %>
                <% include Includes/User/ContributorSignup %>
            <% end_if %>
        <% end_if %>
        <% if $URLSegment == 'become-a-contributor-form' %>
            <% if not $CurrentUserIsContributor %>
                <% include Includes/User/ContributorSignupForm %>
            <% end_if %>
        <% end_if %>
    <% end_if %>
<% end_if %>
<% if $URLSegment == 'sign-up' %>
    <% include Includes/User/RegistrationForm %>
<% end_if %>
<% include VisibleSection %>
