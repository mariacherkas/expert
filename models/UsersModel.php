<?php
//модель для таблицы пользователей user
/**
 * Регистрация пользователя
 *
 * @param $email
 * @param $pwdMD5
 * @param $name
 * @param $phone
 * @param $adress
 * @return array|bool|mysqli_result
 */
function registerNewUser($email, $pwdMD5, $name, $phone, $adress){
    global $db;
    $email = htmlspecialchars(mysqli_real_escape_string($db, $email));
    $name = htmlspecialchars(mysqli_real_escape_string($db, $name));
    $phone = htmlspecialchars(mysqli_real_escape_string($db, $phone));
    $adress = htmlspecialchars(mysqli_real_escape_string($db, $adress));

    $sql = "INSERT INTO `users` (`email`, `pwd`, `name`, `phone`, `adress`) VALUES ('{$email}', '{$pwdMD5}', '{$name}', '{$phone}', '{$adress}')";

    $rs = mysqli_query($db, $sql);

    if (1 == $rs){
        $sql = "SELECT * FROM `users` WHERE (`email` = '{$email}' and `pwd` = '{$pwdMD5}') LIMIT 1";

    $rs = mysqli_query($db, $sql);
    $rs = createSmartyRsArray($rs);

    if (isset($rs[0])){
        $rs['success'] = 1;
    }
    else{
        $rs['success'] = 0;
    }
    }
    else{
        $rs['success'] = 0;
    }
    return $rs;
}

/**
 * Проверка параметров на существование и паролей на схожесть
 *
 * @param $email
 * @param $pwd1
 * @param $pwd2
 * @return array
 */
function checkRegisterParams($email, $pwd1, $pwd2){
    $res = null;
    if(! $email){
        $res['success'] = false;
        $res['message'] = 'Enter your email';
    }
    if(mb_strlen($pwd1) < 8)
    {
        $res['success'] = false;
        $res['message'] = 'Your password is shorter then 8 symbols';
    }
    if(! $pwd1){
        $res['success'] = false;
        $res['message'] = 'Enter your password';
    }
    if(! $pwd2){
        $res['success'] = false;
        $res['message'] = 'Enter your password again';
    }
    if($pwd1 != $pwd2){
        $res['success'] = false;
        $res['message'] = 'Passwords are not the same';
    }
    return $res;
}

/**
 * Проверка на существование пользователя с таким email
 *
 * @param $email
 * @return array|false
 */
function checkUserEmail($email){
    global $db;

    $email = mysqli_real_escape_string($db, $email);
    $sql = "SELECT `id` FROM `users` WHERE `email` = '{$email}'";

    $rs = mysqli_query($db, $sql);
    $rs = createSmartyRsArray($rs);
    return $rs;
}

/**
 * Логинимся с эмейлом и паролем
 *
 * @param $email
 * @param $pwd
 * @return array|false
 */
function loginUser($email, $pwd){
    global $db;
    $email = htmlspecialchars(mysqli_real_escape_string($db, $email));

    $pwd = md5($pwd);
    $sql = "SELECT * FROM `users` WHERE (`email` = '{$email}' and `pwd` = '{$pwd}') LIMIT 1";

    $rs = mysqli_query($db, $sql);
    $rs = createSmartyRsArray($rs);

    if (isset($rs[0])){
        $rs['success'] = 1;
    }
    else{
        $rs['success'] = 0;
    }

    return $rs;
}

/**
 * Изменения данных пользователя
 *
 * @param $name
 * @param $phone
 * @param $adress
 * @param $pwd1
 * @param $pwd2
 * @param $curPwd
 * @return bool|mysqli_result
 */
function updateUserData($name, $phone, $adress, $pwd1, $pwd2, $curPwd){
    global $db;

    $email = htmlspecialchars(mysqli_real_escape_string($db, $_SESSION['user']['email']));
    $name = htmlspecialchars(mysqli_real_escape_string($db, $name));
    $phone = htmlspecialchars(mysqli_real_escape_string($db, $phone));
    $adress = htmlspecialchars(mysqli_real_escape_string($db, $adress));
    $pwd1 = trim($pwd1);
    $pwd2 = trim($pwd2);

    $newPwd = null;
    if($pwd1 && ($pwd1 == $pwd2)){
        $newPwd = md5($pwd1);
    }

    $sql = "UPDATE `users` SET ";

    if($newPwd){
        $sql .= "`pwd` = '{$newPwd}', ";
    }

    $sql .= "`name` = '{$name}', 
    `phone` = '{$phone}',
    `adress` = '{$adress}' WHERE 
    `email` = '{$email}' AND `pwd` = '{$curPwd}' LIMIT 1";


    $rs = mysqli_query($db, $sql);

    return $rs;
}

/**
 * Получить данные заказов текущего пользователя
 * @return array
 */
function getCurUserOrders(){
    $userId = $_SESSION['user']['id'] ?? 0;
    $rs = getOrdersWithProductsByUser($userId);

    return $rs;
}