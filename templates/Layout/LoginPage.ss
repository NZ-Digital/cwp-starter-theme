<section class="page-section loginSection col-lg-12">
    <div class="container-fluid p-0">
        <div class="row align-items-center no-gutters">
            <div class="col-lg-5">
                <img src="$resourceURL('themes/starter/images/LoginFormImage.jpg')" class="bg-image w-100" alt="$SiteConfig.Title - ">
            </div>
            <div class="col-lg-7">
                <div class="form-container pl-lg-8">
                    $LoginForm
                </div>
            </div>
        </div>
    </div>
</section>
<% if $ConfirmedRegistration == 1 || $ConfirmedRegistration == 2 %>
<section class="page-section accountVerificationSection col-lg-8 pt-lg-9 pb-lg-9 inner-padding--right">
    <div class="sectionAccountVerification-container">
        <div class="form-container pl-lg-8 position-relative">
            <% if $ConfirmedRegistration == 1 %>
                <div class="modal fade show" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                $SiteConfig.AccountVerifiedMessage
                            </div>
                        </div>
                    </div>
                </div>
            <% end_if %>
            <% if $ConfirmedRegistration == 2 %>
                <div class="modal fade show" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                $SiteConfig.AccountErrorMessage
                            </div>
                        </div>
                    </div>
                </div>
            <% end_if %>
        </div>
    </div>
</section>
<% end_if %>
<% include VisibleSection %>
