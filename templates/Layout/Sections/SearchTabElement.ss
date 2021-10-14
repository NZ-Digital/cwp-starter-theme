<div class="searchTabElement-container">
    <% if $SearchTab.SearchTabItems %>
    <ul class="nav nav-tabs row no-gutters" id="{$ID}-tab" role="tablist">
        <% loop $SearchTab.SearchTabItems %>
            <li class="nav-item col-md-4">
                <a class="nav-link <% if $Pos == '1' %>active<% end_if %>" id="{$DisplayNameTrim}-tab" data-toggle="tab" href="# {$ID}" role="tab" aria-controls="{$DisplayNameTrim}" aria-selected="true" style="background-color: #{$TabBgColor};">
                    <span class="fontsize35 font-weight-normal text-white">$Name</span>
                    <p><span class="fontsize19 font-weight-light">$Description</span></p>
                </a>
            </li>
        <% end_loop %>
    </ul>
    <div class="tab-content" id="{$ID}-tabContent">
        <% loop $SearchTab.SearchTabItems %>
            <div class="tab-pane fade show <% if $Pos == '1' %>active<% end_if %>" id="{$ID}" role="tabpanel" aria-labelledby="{$DisplayNameTrim}-tab" style="background-color: #{$TabBgColor};">
                <span class="text-white">Content Here</span>
            </div>
        <% end_loop %>
    </div>
    <% end_if %>
</div>
