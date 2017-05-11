$(document).ready(function () {
    let $kindSelector = $('#wagon_type');
    let $bottom_seats = $('#bottom_seats_field');

    let $top_seats = $('#top_seats_field');
    let $side_top_seats = $('#side_top_seats_field');
    let $side_bottom_seats = $('#side_bottom_seats_field');
    let $sitting_seats = $('#sitting_seats_field');

    const showFields = function (fields) {
        let allFields = [
            $bottom_seats, $top_seats, $side_bottom_seats,
            $side_top_seats, $sitting_seats
        ];

        for (let field of allFields) {
            if (fields.includes(field)){
                field.show()
            } else {
                field.find('input').val(0);
                field.hide();
            }
        }
    };

    let switchState = function () {
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