<?php
function formatDateDiff($date) {
    date_default_timezone_set('Europe/Paris');
    $diff = time() - DateTime::createFromFormat('d/m/Y H:i', $date)->getTimestamp();
    $oneMinute = 60;
    $oneHours = 60 * 60;
    $oneDay = 60 * 60 * 24;
    $oneMonth = 60 * 60 * 24 * 30;
    $oneYear = 60 * 60 * 24 * 365;
    $res = "il y a moins d'une minute";
    $diff > $oneMinute && $res = "Il y a 1 minute";
    $diff > $oneMinute * 2 && $res = "Il y a ".round($diff / $oneMinute)." minutes";
    $diff > $oneHours && $res = "Il y a 1 heure";
    $diff > $oneHours * 2 && $res = "Il y a ".round($diff / $oneHours)." heures";
    $diff > $oneDay && $res = "Il y a 1 jour";
    $diff > $oneDay * 2 && $res = "Il y a ".round($diff / $oneDay)." jours";
    $diff > $oneMonth && $res = "Il y a ".round($diff / $oneMonth)." mois";
    $diff > $oneYear && $res = "Il y a plus d'un ans";
    return $res;
}
?>