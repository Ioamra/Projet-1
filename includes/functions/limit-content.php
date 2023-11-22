<?php
function limitContent($text, $len) {
    return strlen($text) > $len ? substr($text, 0, $len).'...' : $text;
}
?>