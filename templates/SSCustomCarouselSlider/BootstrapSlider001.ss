<% require css("https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css") %>
<% require javascript("https://code.jquery.com/jquery-3.3.1.slim.min.js") %>
<% require javascript("https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js") %>
<% require javascript("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js") %>

<%-- You can remove above CSS or Javascript if you already imported it somewhere --%>

<!-- Bootstrap Carousel template from SSCustomCarouselSlider -->
<div 
    id="CustomSlider-$ID" 
    class="carousel slide" 
    data-interval="4000" 
    data-ride="carousel"
>
    <!-- carousel-indicators -->
    <ol class="carousel-indicators">
        <% loop $CustomSliderImages %>
            <li
                data-target="#CustomSlider-$ID"
                data-slide-to="$Pos(0)"
                <% if $First %>class="active"<% end_if %>
            ></li>
        <% end_loop %>
    </ol>

    <!-- carousel-slider-images -->
    <div class="carousel-inner">
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

    <!-- carousel-control-buttons -->
    <a class="carousel-control-prev" href='#CustomSlider-$ID' role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Prev</span>
    </a>
    
    <a class="carousel-control-next" href='#CustomSlider-$ID' role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>

</div>
