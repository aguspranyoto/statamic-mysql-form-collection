$("#reload").click(function () {
    $.ajax({
        type: "GET",
        url: "reload-captcha",
        success: function (data) {
            $("#captcha_img").html(data.captcha);
        },
    });
});
