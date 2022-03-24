<section class="page-section sectionMyListings col-lg-12 pt-lg-8">
    <div class="myListings-content inner-padding">
        <div class="container-fluid p-0 all-listings">
            <% include Includes/User/CreatedListings MyListings=$MyListings %>
        </div>
    </div>
</section>
<% if $Success %>
    <div class="modal fade show contributor-modal" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    $SiteConfig.ContributorsRegistrationMessageSuccess
                </div>
            </div>
        </div>
    </div>
<% end_if %>
