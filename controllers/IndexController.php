<?php
include_once __DIR__ . '/../models/CategoriesModel.php';
include_once __DIR__ . '/../models/ProductsModel.php';
//тестовая функция
function testAction()
{
    echo 'IndexController.php > testAction';
}

//формирование главной страницы
function indexAction($smarty)
{
    $itemId = isset($_GET['id']) ? $_GET['id'] : null;
    $limit = 6;

    $rsCategories = getAllMainCatsWithChildren();
    $rsProducts = getLastProducts($limit);
    $rsCountIndex = getCountAllProduct();

    $smarty->assign('itemInCart', 0);
    if (in_array($itemId, $_SESSION['cart'])) {
        $smarty->assign('itemInCart', 1);
    }

    //объявляем переменные Smarty
    $smarty->assign('pageTitle', 'Main page');
    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsProducts', $rsProducts);
    $smarty->assign('rsCountIndex', $rsCountIndex);
    $smarty->assign('limit', $limit);

    //подключаем страницы визуала сайта
    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'index');
    loadTemplate($smarty, 'footer');
}

function aboutusAction($smarty)
{
    $Leng = isset($_GET['leng']) ? $_GET['leng'] : null;
    $rsCategories = getAllMainCatsWithChildren();

    $smarty->assign('pageTitle', 'About us');
    $smarty->assign('rsCategories', $rsCategories);

    loadTemplate($smarty, 'header');

    if ($Leng == "en") {
        loadTemplate($smarty, 'about_us_en');
    }
    elseif ($Leng == "de"){
        loadTemplate($smarty, 'about_us_de');
    }
    elseif ($Leng == "ukr") {
        loadTemplate($smarty, 'about_us_ukr');

    } elseif ($Leng == "rus") {
        loadTemplate($smarty, 'about_us_rus');

    }

    loadTemplate($smarty, 'footer');
}
