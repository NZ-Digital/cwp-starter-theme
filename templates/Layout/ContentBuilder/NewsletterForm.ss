<div class="contactForm-container text-center">
    <div class="d-md-none d-block">$Content</div>
    <% if $ButtonText %>
        <a href="<% if $CurrentMember %>/account-settings#AccountForm_AccountForm_EventFrequency_Holder<% else %>/sign-up<% end_if %>" class="d-md-inline-block m-auto d-none theme-button-white">
            <span class="halyard-display font-weight-medium fontsize19">$ButtonText</span>
        </a>
    <% end_if %>
    <% if $ButtonTextMobile %>
        <a href="<% if $CurrentMember %>/account-settings#AccountForm_AccountForm_EventFrequency_Holder<% else %>/sign-up<% end_if %>" class="d-md-none m-auto d-inline-block theme-button-white">
            <span class="halyard-display font-weight-medium fontsize19">$ButtonTextMobile</span>
        </a>
    <% end_if %>
</div>
