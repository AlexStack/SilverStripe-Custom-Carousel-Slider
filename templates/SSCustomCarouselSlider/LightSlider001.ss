<% require css("https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/css/lightslider.min.css") %>

<% require javascript("https://code.jquery.com/jquery-3.2.1.slim.min.js") %>

<% require javascript("https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js") %>
 
<%-- You can remove above CSS or Javascript if you already imported it somewhere --%>

<!-- LightSlider template from SSCustomCarouselSlider -->

<div class="CustomSlider">
<ul id="CustomSlider-$ID">
        <% loop $CustomSliderImages %>
            <li data-thumb="$Image.Pad(160,90).URL" data-src="$Image.URL" >
                    <a href="$LinkTo" target="_blank"><img
                    class="d-block w-100"
                    src="$Image.URL"
                    border="0" /></a>

                <%-- if Title %>
                    <div class="carousel-caption">
                        <% if $LinkTo %>
                            <h3><a href="$LinkTo">$Title.RAW</a></h3>
                        <% else %>
                            <h3>$Title.RAW</h3>
                        <% end_if %>
                        <div class="mb-3 caption-content">$Content.RAW</div>
                    </div>
                <% end_if --%>

            </li>
        <% end_loop %>
</ul>
</div>


<script>
  $(document).ready(function() {
    $("#CustomSlider-$ID").lightSlider({
            gallery:true,
            item:1,
            thumbItem: $CustomSliderImages.Count,
            slideMargin: 0,
            speed:500,
            auto:true,
            loop:true,
            enableDrag: true,
            currentPagerPosition:'left'
        }); 
  });
</script>

<!-- End of the SSCustomCarouselSlider -->