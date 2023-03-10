<?php

$emlist = file_get_contents("mailist.txt");
$splitEm = preg_split("/[\s,]+/", $emlist);
$countEm = count($splitEm);

if (!in_array($_GET['email'], $splitEm) && !empty($_GET['email'])) {
$z = fopen("mailist.txt", "a+");
fwrite($z, $_GET['email'] . "\n");
fclose($z);
}
?>
