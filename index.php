
<?php
/**
 * @var $smarty
 */
session_start();
if(!isset($_SESSION['cart'])){
    $_SESSION['cart'] = array();
}


require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/library/mainFunctions.php';
require_once __DIR__ . '/config/db.php';
//какой файл
$controllerName = isset($_GET['controller']) ? ucfirst($_GET['controller']) : "Index";
//какая функция
$actionName = isset($_GET['action']) ? $_GET['action'] : "index";

if (isset($_SESSION['user'])){
    $smarty->assign('arUser', $_SESSION['user']);
}

$smarty->assign('cartCntItems', count($_SESSION['cart']));
loadPage($smarty, $controllerName, $actionName); ?> 

