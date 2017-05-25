$(document).ready(function () {
    $('.route_name').click(function () {
        var id = $(this).data('routeId');
        $(this).hide();
        $('#route_name_' + id).show();
    });

    $('.cancel-route').click(function () {

        $(this).parent().hide();
        $(this).closest('td').find('.route_name').show();
    });

    $('.route_name_form').unbind('submit').submit(function (e) {
        var input = $(this).find("input[name='name']");

        if (input.val() === "") {
            input.parent().addClass('has-error');
            alert('Name can not be blank!');
            return false;
        } else {
            return true;
        }
    })
});
