var comic = $("div.s img[title]");
var titleP = $("<p></p>");
titleP.css({"font-variant": "normal",
            "border": "1px solid yellow",
            "padding": "1em",
            "background-color": "#FFFFCC"});
titleP.text(comic.attr("title"));
comic.after(titleP);
$('body, #topLeft a, h1, #middleContent ul li a, h2, h3').css('font-family', 'Helvetica, Arial, sans-serif');
