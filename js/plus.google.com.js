/*
    Make Google+ like Twitter. So, you know, it's useful.
    by Mr Speaker

    Limits post size to 80px high.
    Double click to expand/contract.
    Relies on jQuery (included by default with dotjs)
*/

(function AddStylez() {
    var styleNode = document.createElement("style"),
        styleRule = ".a-f-i { \
    height: 80px; \
    overflow: hidden; \
    -webkit-user-select: none; -moz-user-select: none; user-select: none; \
    -webkit-mask-image: -webkit-gradient(linear, left 75, left bottom, from(rgba(0,0,0,1)), to(rgba(0,0,0,0))); \
} \
.lil-a-f-i { \
    height: auto; \
    overflow: auto; \
    -webkit-user-select: auto; -moz-user-select: auto; user-select: auto; \
    -webkit-mask-image: none \
}";
    styleNode.setAttribute("type", "text/css");
    styleNode.setAttribute("media", "screen");
    styleNode.appendChild(document.createTextNode(styleRule));
    document.getElementsByTagName("head")[0].appendChild(styleNode);
    console.log("ONE");
})();

(function AddClickz() {
    $(".a-f-i")
        .live("dblclick", function() {
            $(this).toggleClass("lil-a-f-i");
        });
})();
