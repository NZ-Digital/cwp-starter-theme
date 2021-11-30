<div class="accordion-container">
    <div class="row no-gutters">
        <div class="col-lg-4">
            <div class="pt-lg-6 padding-left-100px">
                $Content
            </div>
        </div>
        <% if $VisibleAccordionItems %>
        <div class="col-lg-8">
            <div class="pt-lg-6 pl-lg-5 padding-right-100px">
                <div class="accordion" id="accordion">
                    <% loop $VisibleAccordionItems %>
                        <div class="card">
                            <div class="card-header" id="accordion-{$ID}">
                                <button class="btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse{$ID}" aria-expanded="<% if $Pos == "1" %>true<% else %>false<% end_if %>" aria-controls="collapse{$ID}"><span class="fontsize30">$Name</span></button>
                            </div>
                            <div id="collapse{$ID}" class="collapse<% if $Pos == "1" %> show<% end_if %>" aria-labelledby="accordion-{$ID}" data-parent="#accordion">
                                <div class="card-body">
                                   $Content
                                </div>
                            </div>
                        </div>
                    <% end_loop %>
                </div>
            </div>
        </div>
        <% end_if %>
    </div>
</div>
