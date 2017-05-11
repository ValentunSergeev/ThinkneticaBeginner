$(document).ready(function () {
    let $kindSelector = $('#wagon_type');
    let $bottom_seats = $('#bottom_seats_field');

    let $top_seats = $('#top_seats_field');
    let $side_top_seats = $('#side_top_seats_field');
    let $side_bottom_seats = $('#side_bottom_seats_field');
    let $sitting_seats = $('#sitting_seats_field');

    const showAll = function () {
        let fields = [
            $bottom_seats, $top_seats, $side_bottom_seats,
            $side_top_seats, $sitting_seats
        ];

        for (let field of fields) {
            field.show();
        }
    };

    const hideFields = function (fields) {
        for (let field of fields) {
            field.find('input').val('');
            field.hide();
        }
    };

    let switchState = function () {
        showAll();
        switch ($kindSelector.val()) {
            case 'CoupeWagon':
                hideFields([$sitting_seats, $side_bottom_seats,
                    $side_top_seats]);
                break;
            case 'EconomyWagon':
                hideFields([$sitting_seats]);
                break;
            case 'PremiumWagon':
                hideFields([$top_seats, $side_bottom_seats, $side_top_seats,
                    $sitting_seats]);
                break;
            case 'SittingWagon':
                hideFields([$top_seats, $bottom_seats, $side_top_seats,
                    $side_bottom_seats]);
        }
    };

    switchState();

    $kindSelector.change(function () {
        switchState()
    });
});