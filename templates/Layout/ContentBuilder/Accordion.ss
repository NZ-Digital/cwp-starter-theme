<div class="accordion-container">
    <div class="row no-gutters">
        <% if $Content %>
            <div class="col-lg-4">
                <div class="pt-lg-6 padding-left-100px mobile-right-padding tablet-right-padding">
                    $Content
                </div>
            </div>
        <% end_if %>
        <% if $VisibleAccordionItems %>
            <div class="<% if not $Content %>col-lg-12<% else %>col-lg-8<% end_if %>">
            <div class="pt-lg-6 pl-lg-5 pb-lg-0 pb-5 padding-right-100px">
                <div class="accordion" id="accordion">
                    <% loop $VisibleAccordionItems %>
                        <% if $HeaderText %>
                            <p class="<% if not $First %>mt-lg-8 mt-6<% end_if %>"><span class="text-uppercase fontsize25 font-weight-medium letterspacing-7px" <% if $HeaderColor %>style="color: #{$HeaderColor};"<% end_if %>>$HeaderText</span></p>
                        <% end_if %>
                        <div class="card">
                            <div class="card-header" id="accordion-{$ID}">
                                <button class="btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse{$ID}" aria-expanded="<% if $Pos == "1" %>true<% else %>false<% end_if %>" aria-controls="collapse{$ID}"><span class="fontsize30 text-cod-gray">$Name</span></button>
                            </div>
                            <div id="collapse{$ID}" class="collapse<% if $Pos == "1" %> show<% end_if %>" aria-labelledby="accordion-{$ID}" data-parent="#accordion">
                                <div class="card-body pt-3">
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
