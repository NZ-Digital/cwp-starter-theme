<% include Includes\User\UserSideNav %>
<section class="page-section sectionCreateArticle col-lg-8 pt-lg-8 pb-lg-8 mobile-top-padding tablet-top-padding mobile-bottom-padding tablet-bottom-padding mobile-left-padding tablet-left-padding inner-padding--right">
    <div class="createArticle-container">
        $NewsArticleForm
    </div>
</section>
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
