if (isset($_GET['email'])) {
$z = fopen("mailist.txt", "a+");
fwrite($z, $_GET['email'] . "\n");
fclose($z);
}
