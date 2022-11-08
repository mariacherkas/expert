<?php
include_once __DIR__ . '/../models/CategoriesModel.php';
include_once __DIR__ . '/../models/ProductsModel.php';
include_once __DIR__ . '/../models/PurchaseModel.php';
include_once __DIR__ . '/../models/OrdersModel.php';


function addtocartAction(){
    $itemId = isset($_GET['id']) ? intval($_GET['id']) : null;
    if(! $itemId) return false;

    $resData = array();

    if(isset($_SESSION['cart']) && (array_search($itemId, $_SESSION['cart']) === false)){
        $_SESSION['cart'][] = $itemId;
        $resData['cntItems'] = count($_SESSION['cart']);
        $resData['success'] = 1;
    }
    else{
        $resData['success'] = 0;
    }

    echo json_encode($resData);
}

function removefromcartAction() {
    $itemId = isset($_GET['id']) ? intval($_GET['id']) : null;
    if(! $itemId) exit();
    $resData = array();
    $key = array_search($itemId, $_SESSION['cart']);
    if ($key !== false){
        unset($_SESSION['cart'][$key]);
        $resData['success'] = 1;
        $resData['cntItems'] = count($_SESSION['cart']);
    }
    elseif (array_search($itemId, $_SESSION['cart']) !== false){
        $resData['success'] = 2;
        $resData['cntItems'] = count($_SESSION['cart']);
    }
    else{
        $resData['success'] = 0;
    }
    echo json_encode($resData);
}

/**
 * Формирование страницы корзины
 * @param $smarty
 * @return void
 */
function indexAction($smarty){
    $itemIds = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();


    $rsCategories = getAllMainCatsWithChildren();
    $rsProducts = getProductsFromArray($itemIds);

    $totalPrice = 0;
    if($rsProducts){
    foreach($rsProducts as &$item){
        $totalPrice += $item['price'];
    }
}

    $smarty->assign('pageTitle', 'Basket');
    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('rsProducts', $rsProducts);
    $smarty->assign('totalPrice', $totalPrice);


    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'cart');
    loadTemplate($smarty, 'footer');
}

function orderAction($smarty){
    $itemIds = $_SESSION['cart'] ?? null;

    if(!$itemIds){
        redirect('/?controller=card');
        return;
    }
    $itemCnt = array();
    foreach ($itemIds as $item){
        $postVar = 'itemCnt_' . $item;
        $itemCnt[$item] = $_POST[$postVar] ?? null;
    }

    $rsProducts = getProductsFromArray($itemIds);


    $totalPrice = 0;

    $i = 0;
    if ($rsProducts) {
        foreach ($rsProducts as &$item) {
            $item['cnt'] = $itemCnt[$item['id']] ?? 0;
            if ($item['cnt']) {
                $item['realPrice'] = $item['cnt'] * $item['price'];
                $totalPrice += $item['realPrice'];
            } else {
                unset($rsProducts[$i]);
            }
            $i++;
        }
    }

    if (! $rsProducts){
        echo "Basket is empty";
        return;
    }

    $_SESSION['saleCart'] = $rsProducts;


    $rsCategories = getAllMainCatsWithChildren();

    if (! isset($_SESSION['user'])){
        $smarty-> assign('hideLoginBox', 1);
    }


    $smarty->assign('pageTitle', 'Order');
    $smarty->assign('rsProducts', $rsProducts);
    $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('totalPrice', $totalPrice);

    loadTemplate($smarty, 'header');
    loadTemplate($smarty, 'order');
    loadTemplate($smarty, 'footer');

}

function saveorderAction(){
    //получаем массив покупаемых товаров
    $cart = $_SESSION['saleCart'] ?? null;

    //если корзина пуста, то формируем ответ с ошибкой и отправляем его в формате json и выходим из функции
    if (! $cart){
        $resData['success'] = 0;
        $resData['message'] = 'No items to order';
        echo json_encode($resData);
        return;
    }

    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $adress = $_POST['adress'];

    //создаем новый заказ и получаем его ИД
    if ($adress && $name && $phone){
    $orderId = makeNewOrder($name, $phone, $adress);}
    else{
        $resData['success'] = 0;
        $resData['message'] = 'Please enter your address, name and phone';
        echo json_encode($resData);
        return;
    }

    //если заказ не создан, то выдаем ошибку и завершаем функцию
    if (! $orderId){
        $resData['success'] = 0;
        $resData['message'] = 'Error';
        echo json_encode($resData);
        return;
    }
    //сохраняем товары для создаваемого заказа
    $res = setPurchaseForOrder($orderId, $cart);

    //если успешно, то формируем ответ, очищаем корзину
    if ($res){
        $resData['success'] = 1;
        $resData['message'] = 'Order saved';
        unset($_SESSION['saleCart']);
        unset($_SESSION['cart']);
    }
    else{
        $resData['success'] = 0;
        $resData['message'] = 'Error';
    }
    echo json_encode($resData);
}
