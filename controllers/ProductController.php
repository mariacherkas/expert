<?php
//контроллер страницы товара

include_once __DIR__ . '/../models/CategoriesModel.php';
include_once __DIR__ . '/../models/ProductsModel.php';


/**
 * Формирование страницы продукта
 *
 * @param $smarty
 * @return void
 */
function indexAction($smarty){
    $itemId = isset($_GET['id']) ? $_GET['id'] : null;
    if($itemId == null) exit();

    //получить данные продукта
    $rsProduct = getProductById($itemId);
    //получить все категории
    $rsCategories = getAllMainCatsWithChildren();

    //показывать кнопку добавления в корзину если true
    //показывать кнопку удаления если false
    $smarty->assign('itemInCart', 0);
    if(in_array($itemId, $_SESSION['cart'])){
        $smarty->assign('itemInCart', 1);
    }

    $smarty->assign('pageTitle', '');
    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsProduct', $rsProduct);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'product');
    loadTemplate($smarty, 'footer');
}
