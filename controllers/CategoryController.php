<?php
//контроллер страницы категорий
include_once __DIR__ . '/../models/CategoriesModel.php';
include_once __DIR__ . '/../models/ProductsModel.php';

//формирование страницы категорий

function indexAction($smarty){
    $limit = 6;

    //получаем гет параметр id
    $catId = isset($_GET['id']) ? $_GET['id'] : null;
    if($catId == null) exit();
    $rsProducts = null;
    $rsChildCats = null;
    $rsCategory = getCatById($catId);
    //если главная категория - показываем дочерние, если дочерняя - товар
    if($rsCategory['parent_id'] == 0){
       // $rsChildCats = getChildrenForCat($catId);
       $rsChild = getChildrenForCat($catId);
       $rsArray = array();
       foreach ($rsChild as $item){
            $rsArray[] = $item['id'];
       }
       $rsChild = implode(", ", $rsArray);

       $rsProducts = getProductsByCat($rsChild, $limit);

       $rsCount = getCountChildProduct($rsChild);
    }
    else{
        $rsProducts = getProductsByCat($catId, $limit);

        $rsCount = getCountChildProduct($rsCategory['id']);
    }
    $rsCategories = getAllMainCatsWithChildren();

    $smarty->assign('pageTitle', 'Category`s products '.$rsCategory['name']);

    $smarty->assign('rsCategory', $rsCategory);
    $smarty->assign('rsProducts', $rsProducts);
    $smarty->assign('rsChildCats', $rsChildCats);

    $smarty->assign('rsCategories', $rsCategories);

    $smarty->assign('rsCount', $rsCount);
    $smarty->assign('limit', $limit);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'category');
    loadTemplate($smarty, 'footer');
}
