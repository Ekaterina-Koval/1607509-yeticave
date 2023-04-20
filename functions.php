<?php
function price_format ($price) {
$price = ceil($price);
if ($price >= 1000) {
number_format($price, 0, '',' ');
}
return $price . ' ' . '&#8381;';
};

function count_time_left ($date) {
    date_default_timezone_set('Europe/Moscow');
    $date_unix = strtotime($date);
    $current_date_unix = time();
    $diff_unix = $date_unix - $current_date_unix;
    $time_left_minutes = floor($diff_unix/60);
    $hours_left = floor($time_left_minutes/60);
    $minutes_left = $time_left_minutes - $hours_left*60;
    $hours_left = str_pad($hours_left, 2, "0", STR_PAD_LEFT);
    $minutes_left = str_pad($minutes_left, 2, "0", STR_PAD_LEFT);
    $time_left_arr[0] = $hours_left;
    $time_left_arr[1] = $minutes_left;
    return $time_left_arr;
};
