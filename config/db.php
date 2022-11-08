<?php
//  инициализация подключения к базе данных
$db_location = "localhost";
$db_name = "expert";
$db_user = "root";
$db_password = "";
global $db;
$db = mysqli_connect($db_location, $db_user, $db_password, $db_name);

