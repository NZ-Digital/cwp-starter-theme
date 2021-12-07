<% include Includes\User\UserSideNav %>
<section class="page-section sectionCreateArticle col-lg-8 pt-lg-8 pb-lg-8 inner-padding--right">
    <div class="createArticle-container pl-lg-8">
        $NewsArticleForm
    </div>
</section>
<section class="page-section sectionCreateListForm col-lg-8 pt-lg-9 pb-lg-9 inner-padding--right">
    <div class="sectionCreateList-container">
        <div class="form-container pl-lg-8 position-relative">
            $ListingForm
            <% if $Success %>
                <div class="modal fade show" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                $SiteConfig.CreateNewsMessageSuccess
                            </div>
                        </div>
                    </div>
                </div>
            <% end_if %>
        </div>
    </div>
</section>
