<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="carousel-item active" style="background-image: url('img/slideBar1.png')">
            <div class="carousel-caption d-none d-md-block">
                <h2 class="display-4" id="banner1MainText">iPhone</h2>
                <p class="lead" id="banner1SubText">For the next World's Generation</p>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('img/slideBar2.png')">
            <div class="carousel-caption d-none d-md-block">
                <h2 class="display-4" id="banner2MainText">Samsung Galaxy S20+</h2>
                <p class="lead" id="banner2SubText">Beyond imagination.</p>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('img/slideBar3.png')">
            <div class="carousel-caption d-none d-md-block">
                <h2 class="display-4" id="banner3MainText">Galaxy Accessory</h2>
                <p class="lead" id="banner3SubText">The best experience</p>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<hr>
</body>
</html>
