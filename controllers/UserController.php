<?php

//контроллер функций пользователей

include_once __DIR__ . '/../models/CategoriesModel.php';
include_once __DIR__ . '/../models/UsersModel.php';
include_once __DIR__ . '/../models/OrdersModel.php';
include_once __DIR__ . '/../models/PurchaseModel.php';
include_once __DIR__ . '/../models/ProductsModel.php';

/**
 * Регистрация пользователя
 * @return void
 */
function registerAction()
{

    $email = $_REQUEST['email'] ?? null;
    $email = trim($email);
    $email = filter_var($email, FILTER_VALIDATE_EMAIL);
    $pwd1 = $_REQUEST['pwd1'] ?? null;
    $pwd2 = $_REQUEST['pwd2'] ?? null;

    $phone = $_REQUEST['phone'] ?? null;
    $adress = $_REQUEST['adress'] ?? null;
    $name = $_REQUEST['name'] ?? null;
    $name = trim($name);

    //$resData = null;
    $resData = checkRegisterParams($email, $pwd1, $pwd2);

    if (!$resData && checkUserEmail($email)) {
        $resData['success'] = false;
        $resData['message'] = 'User with this email already registered';
    }
    if (!$resData) {
        $pwdMD5 = md5($pwd1);
        $userData = registerNewUser($email, $pwdMD5, $name, $phone, $adress);

        if (1 == $userData['success']) {
            $resData['message'] = 'Alles gut!';
            $resData['success'] = 1;

            $userData = $userData[0];
            $resData['userName'] = $userData['name'] ?: $userData['email'];
            $resData['userEmail'] = $email;

            $_SESSION['user'] = $userData;
            $_SESSION['user']['displayName'] = $userData['name'] ?: $userData['email'];

        } else {
            $resData['success'] = 0;
            $resData['message'] = 'Error in registering';
        }
    }
    echo json_encode($resData);
}


/**
 * Выходим из аккаунта
 * @return void
 */
function logoutAction()
{
    if (isset($_SESSION['user'])) {
        unset($_SESSION['user']);
        unset($_SESSION['cart']);
    }
    redirect('/');
}

/**
 * Заходим в аккаунт, логинимся
 * @return void
 */
function loginAction()
{
    $email = $_REQUEST['email'] ?? null;
    $email = trim($email);

    $pwd = $_REQUEST['pwd'] ?? null;
    $pwd = trim($pwd);

    $userData = loginUser($email, $pwd);

    if (1 == $userData['success']) {
        $userData = $userData[0];
        $_SESSION['user'] = $userData;
        $_SESSION['user']['displayName'] = $userData['name'] ?: $userData['email'];

        $resData = $_SESSION['user'];
        $resData['success'] = 1;

        $resData['userName'] = $userData['name'] ?: $userData['email'];
        $resData['userEmail'] = $email;
    } else {
        $resData['success'] = 0;
        $resData['message'] = "Wrong login or password";
    }

    echo json_encode($resData);
}

/**
 * Страница пользователя
 * @param $smarty
 * @return void
 */
function indexAction($smarty)
{
    if (!isset($_SESSION['user'])) {
        redirect('/');
    }

    $rsCategories = getAllMainCatsWithChildren();

    $rsUserOrders = getCurUserOrders();

    $smarty->assign('pageTitle', 'User`s page');
    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsUserOrders', $rsUserOrders);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'user');
    loadTemplate($smarty, 'footer');
}

function updateAction()
{
    if (!isset($_SESSION['user'])) {
        redirect('/');
    }

    //инициализация переменных
    $resData = array();
    $phone = $_REQUEST['phone'] ?? null;
    $adress = $_REQUEST['adress'] ?? null;
    $name = $_REQUEST['name'] ?? null;;
    $pwd1 = $_REQUEST['pwd1'] ?? null;
    $pwd2 = $_REQUEST['pwd2'] ?? null;
    $curPwd = $_REQUEST['curPwd'] ?? null;
    //проверка пароля

    $curPwdMD5 = md5($curPwd);
//    var_dump($curPwdMD5);
    if (!$curPwd || ($_SESSION['user']['pwd'] != $curPwdMD5)) {
        $resData['success'] = 0;
        $resData['message'] = 'Password is not correct';
        echo json_encode($resData);
        return false;
    }
    //обновление данных пользователя

    $res = updateUserData($name, $phone, $adress, $pwd1, $pwd2, $curPwdMD5);

    if (1 == $res) {
        $resData['success'] = 1;
        $resData['message'] = 'Data saved';
        $resData['userName'] = $name;

        $_SESSION['user']['name'] = $name;
        $_SESSION['user']['phone'] = $phone;
        $_SESSION['user']['adress'] = $adress;
        $_SESSION['user']['pwd'] = $curPwdMD5;
        $_SESSION['user']['displayName'] = $name ?: $_SESSION['user']['email'];
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Data save error';
    }

    echo json_encode($resData);
}

function authorizationAction($smarty)
{
    if (!isset($_SESSION['user'])) {
        $smarty->assign('hideLoginBox', 1);
    }

    $rsCategories = getAllMainCatsWithChildren();

    $smarty->assign('pageTitle', 'Authorization');
    $smarty->assign('rsCategories', $rsCategories);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'authorization');
    loadTemplate($smarty, 'footer');
}

function registrationAction($smarty)
{
    if (!isset($_SESSION['user'])) {
        $smarty->assign('hideLoginBox', 1);
    }

    $rsCategories = getAllMainCatsWithChildren();

    $smarty->assign('pageTitle', 'Registration');
    $smarty->assign('rsCategories', $rsCategories);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'registration');
    loadTemplate($smarty, 'footer');
}

function searchAction($smarty)
{
    $search = $_REQUEST['search'] ?? null;
    $rsProducts = searchProduct($search);

    $resData = array();

    if ($rsProducts) {
        $resData['success'] = 1;

        $rsProducts = mysqli_fetch_all($rsProducts, MYSQLI_ASSOC);
        $smarty->assign('rsProducts', $rsProducts);
        $result = $smarty->fetch("search.tpl");
        $resData['result'] = $result;

    } else {
        $resData['success'] = 0;
    }
    echo json_encode($resData);



}