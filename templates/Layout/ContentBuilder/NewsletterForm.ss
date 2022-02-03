<div class="contactForm-container">
    <div class="d-md-block d-none">$Content</div>
    <% if $ButtonText %>
        <button type="button" class="d-md-block m-auto d-none theme-button-white" data-toggle="modal" data-target="#modal-newsletter">
            <span class="halyard-display font-weight-medium fontsize19">$ButtonText</span>
        </button>
    <% end_if %>
    <p class="text-center d-md-none d-block">&nbsp;</p>
    <% if $ButtonTextMobile %>
        <button type="button" class="d-md-none m-auto d-block theme-button-white" data-toggle="modal" data-target="#modal-newsletter">
            <span class="halyard-display font-weight-medium fontsize19">$ButtonTextMobile</span>
        </button>
    <% end_if %>
    <div class="modal fade <% if $Up.getNewsletterSuccess %>show<% end_if %>" id="modal-newsletter" tabindex="-1" role="dialog" aria-labelledby="newsletter" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-content">
                        $FormContent
                    </div>
                    <% if $NewsletterSuccess %>
                        <div class="alert alert-success" role="alert">You are now subscribed to your newsletter!</div>
                    <% end_if %>
                    $NewsletterForm
                </div>
            </div>
        </div>
    </div>
</div>
