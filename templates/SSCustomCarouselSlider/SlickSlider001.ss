
<% require css("https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css") %>
<% require css("https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css") %>

<% require javascript("https://code.jquery.com/jquery-3.2.1.slim.min.js") %>
<% require javascript("//code.jquery.com/jquery-migrate-1.2.1.min.js") %>
<% require javascript("https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js") %>

<%-- You can remove above CSS or Javascript if you already imported it somewhere --%>

<!-- Slick Carousel template from SSCustomCarouselSlider -->

<div id="CustomSlider-$ID">
    <% loop $CustomSliderImages %>
        <div class="carousel-item <% if $First %>active<% end_if %>">
            <img
                class="d-block w-100"
                src="$Image.URL"
                alt="$Image.Title"
            >
            <% if Title %>
                <div class="carousel-caption text-center d-none d-md-block slide-content">
                    <% if $LinkTo %>
                        <h3><a href="$LinkTo">$Title.RAW</a></h3>
                    <% else %>
                        <h3>$Title.RAW</h3>
                    <% end_if %>
                    <div class="mb-3 caption-content">$Content.RAW</div>
                </div>
            <% end_if %>
        </div>
    <% end_loop %>
</div>


<script>
$(document).ready(function(){
  $('#CustomSlider-$ID').slick({
    dots: true,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear'
  });
});
</script>

<!-- End of the SSCustomCarouselSlider -->