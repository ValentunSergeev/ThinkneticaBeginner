$(document).ready(function () {
    var $kindSelector = $('#wagon_type');
    var $bottom_seats = $('#bottom_seats_field');

    var $top_seats = $('#top_seats_field');
    var $side_top_seats = $('#side_top_seats_field');
    var $side_bottom_seats = $('#side_bottom_seats_field');
    var $sitting_seats = $('#sitting_seats_field');

    const showFields = function (fields) {
        var allFields = [
            $bottom_seats, $top_seats, $side_bottom_seats,
            $side_top_seats, $sitting_seats
        ];

        allFields.forEach(function (item, i, arr) {
            if (fields.includes(item)){
                item.show()
            } else {
                item.find('input').val(0);
                item.hide();
            }
        })
    };

    var switchState = function () {
        switch ($kindSelector.val()) {
            case 'CoupeWagon':
                showFields([$bottom_seats, $top_seats]);
                break;
            case 'EconomyWagon':
                showFields([$bottom_seats, $top_seats, $side_bottom_seats,
                    $side_top_seats]);
                break;
            case 'PremiumWagon':
                showFields([$bottom_seats]);
                break;
            case 'SittingWagon':
                showFields([$sitting_seats]);
        }
    };

    switchState();

    $kindSelector.change(function () {
        switchState()
    });
});
