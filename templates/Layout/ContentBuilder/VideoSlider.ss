<div class="videoSlider-container">
    <% if $VisibleVideoItems %>
        <div class="owl-carousel">
            <% loop $VisibleVideoItems %>
                <div class="videoSlider-content row no-gutters m-0 align-items-center" style="background-color: #{$ContentBgColor};">
                    <div class="video-content--text col-lg-5 padding-left-100px">
                        $Content
                    </div>
                    <% if $Video %>
                        <div class="video-content--video col-lg-7">
                            <video <% if $VideoThumbnail %>poster="$VideoThumbnail.URL"<% end_if %>>
                                <source src="$Video.URL" type="video/mp4">
                            </video>
                            <button class="btn--video-play"><i class="fal fa-play-circle"></i></button>
                        </div>
                    <% end_if %>
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
