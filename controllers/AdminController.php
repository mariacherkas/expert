<?php

/**
 * Контроллер админки сайта
 */
include_once __DIR__ . "/../models/CategoriesModel.php";
include_once __DIR__ . "/../models/ProductsModel.php";
include_once __DIR__ . "/../models/OrdersModel.php";
include_once __DIR__ . "/../models/PurchaseModel.php";

$smarty->setTemplateDir(TEMPLATE_ADMIN_PREFIX);
$smarty->assign('templateWebPath', TEMPLATE_ADMIN_WEB_PATH);


/**
 * Список категорий, изменения данных категорий
 *
 * @param $smarty
 * @return void
 */
function indexAction($smarty)
{
    $rsCategories = getAllCategories();
    $rsMainCategories = getAllMainCategories();

    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsMainCategories', $rsMainCategories);
    $smarty->assign('pageTitle', 'Administration');

    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminCategory');
    loadTemplate($smarty, 'adminFooter');
}

/**
 * Добавляем новые категории из админки
 * @return void
 */
function addnewcatAction()
{

    $catName = $_POST['newCategoryName'];

    $catParentId = $_POST['generalCatId'];

    $res = insertCat($catName, $catParentId);
    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'Category added';
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Error';
    }

    echo json_encode($resData);
    return;
}


function updatecategoryAction()
{
    $itemId = $_POST['itemId'];
    $parentId = $_POST['parentId'];
    $newName = $_POST['newName'];

    $res = updateCategoryData($itemId, $parentId, $newName);

    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'Category update';
    } else {
        $resData['success'] = 1;
        $resData['message'] = 'Error';
    }

    echo json_encode($resData);
    return;
}


function productsAction($smarty)
{
    $rsCategories = getAllCategories();
    $rsProducts = getProducts();

    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsProducts', $rsProducts);
    $smarty->assign('pageTitle', 'Administration');

    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminProducts');
    loadTemplate($smarty, 'adminFooter');
}


function addproductAction()
{
    $itemName = $_POST['itemName'];
    $itemPrice = $_POST['itemPrice'];
    $itemDesc = $_POST['itemDesc'];
    $itemCat = $_POST['itemCatId'];
    $desc_cut = substr(strip_tags($itemDesc), 0, 50);
    $res = insertProduct($itemName, $itemPrice, $itemDesc, $itemCat, $desc_cut);

    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'New product successfully saved';
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Error';
    }

    echo json_encode($resData);
    return;
}

function updateproductAction()
{
    $itemId = $_POST['itemId'];
    $itemName = $_POST['itemName'];
    $itemPrice = $_POST['itemPrice'];
    $itemStatus = $_POST['itemStatus'];
    $itemDesc = $_POST['itemDesc'];
    $itemCat = $_POST['itemCatId'];

    $res = updateProduct($itemId, $itemName, $itemPrice, $itemStatus, $itemDesc, $itemCat);

    if ($res) {
        $resData['success'] = 1;
        $resData['message'] = 'Changes have been successfully made';
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Error';
    }

    echo json_encode($resData);
    return;
}


function uploadAction()
{
    $maxSize = 4 * 1024 * 1024;

    $itemId = $_POST['itemId'];

    $ext = pathinfo($_FILES['filename']['name'], PATHINFO_EXTENSION);

    $newFileName = $itemId . '.' . $ext;
    if ($_FILES['filename']['size'] > $maxSize) {
        echo("File size larger than 4 MB");
        return;
    }

    if (is_uploaded_file($_FILES['filename']['tmp_name'])) {
        $res = move_uploaded_file($_FILES['filename']['tmp_name'],
            $_SERVER['DOCUMENT_ROOT'] . '/www/images/products/' . $newFileName);
        if ($res) {
            $res = updateProductImage($itemId, $newFileName);
            if ($res) {
                redirect('/?controller=admin&action=products');
            }
        }
    } else {
        echo('Error');
    }
}

function ordersAction($smarty)
{
    $rsOrders = getOrders();

    $smarty->assign('rsOrders', $rsOrders);
    $smarty->assign('pageTitle', 'Orders');

    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'adminOrders');
    loadTemplate($smarty, 'adminFooter');
}

function setorderstatusAction()
{
    $itemId = $_POST['itemId'];
    $status = $_POST['status'];

    $res = updateOrderStatus($itemId, $status);
    if ($res) {
        $resData['success'] = 1;
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Error';
    }
    echo json_encode($resData);
    return;
}

function setorderdatepaymentAction()
{
    $itemId = $_POST['itemId'];
    $datePayment = $_POST['datePayment'];

    $res = updateOrderDatePayment($itemId, $datePayment);

    if ($res) {
        $resData['success'] = 1;
    } else {
        $resData['success'] = 0;
        $resData['message'] = 'Error';
    }
    echo json_encode($resData);
    return;
}