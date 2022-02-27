<div class="contactForm-container text-center">
    <div class="d-md-none d-block">$Content</div>
    <% if $ButtonText %>
        <a href="<% if $CurrentMember %>/account-settings<% else %>/sign-up<% end_if %>" class="d-md-inline-block m-auto d-none theme-button-white">
            <span class="halyard-display font-weight-medium fontsize19">$ButtonText</span>
        </a>
    <% end_if %>
    <% if $ButtonTextMobile %>
        <a href="<% if $CurrentMember %>/account-settings<% else %>/sign-up<% end_if %>" class="d-md-none m-auto d-inline-block theme-button-white">
            <span class="halyard-display font-weight-medium fontsize19">$ButtonTextMobile</span>
        </a>
    <% end_if %>
<%--    <div class="modal fade <% if $Up.getNewsletterSuccess %>show<% end_if %>" id="modal-newsletter" tabindex="-1" role="dialog" aria-labelledby="newsletter" aria-hidden="true">--%>
<%--        <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                        <span aria-hidden="true">&times;</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    <div class="form-content">--%>
<%--                        $FormContent--%>
<%--                    </div>--%>
<%--                    <% if $NewsletterSuccess %>--%>
<%--                        <div class="alert alert-success" role="alert">You are now subscribed to your newsletter!</div>--%>
<%--                    <% end_if %>--%>
<%--                    $NewsletterForm--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>
