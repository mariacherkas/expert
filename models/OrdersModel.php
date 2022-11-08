<?php
/**
 * Модель для таблицы заказов
 */

/**
 * Создаем новый заказ
 *
 * @param $name
 * @param $phone
 * @param $adress
 * @return false|mixed
 */
function makeNewOrder($name, $phone, $adress){

    global $db;
    $userId = $_SESSION['user']['id'];

    $comment = "users id: {$userId}<br>
                Name: {$name}<br>
                Phone: {$phone}<br>
                Address: {$adress}";
    $dateCreated = date('Y.m.d H:i:s');
    $userIp = $_SERVER['REMOTE_ADDR'];

    $sql = "INSERT INTO `orders` (`user_id`, `date_created`, `date_payment`, `status`, `comment`, `user_ip`) VALUES ('$userId', '$dateCreated', null, '0', '$comment', '$userIp')";

    $rs = mysqli_query($db, $sql);

    if ($rs){
        $sql = "SELECT `id` FROM `orders` ORDER BY `id` DESC LIMIT 1";
        $rs = mysqli_query($db, $sql);
        $rs = createSmartyRsArray($rs);

        if (isset($rs[0])){
            return $rs[0]['id'];
        }
    }

    return false;
}

/**
 * Получаем список заказов с привязкой к продуктам для пользователя
 * @param $userId
 * @return array
 */
function getOrdersWithProductsByUser($userId) {
    global $db;
    $userId = intval($userId);
    $sql = "SELECT * FROM orders WHERE user_id = '$userId' ORDER BY id DESC";

    $rs = mysqli_query($db, $sql);

    $smartyRs = array();
    while ($row = mysqli_fetch_assoc($rs)){
        $rsChildren = getPurchaseForOrder($row['id']);

        if ($rsChildren){
            $row['children'] = $rsChildren;
            $smartyRs[] = $row;
        }
    }

    return $smartyRs;

}

function getOrders(){
    global $db;

    $sql = "SELECT o.*, u.name, u.email, u.phone, u.adress 
    FROM orders AS `o` LEFT JOIN users AS `u` 
    ON o.user_id = u.id ORDER BY id DESC";

    $rs = mysqli_query($db, $sql);

    $smartyRs = array();
    while($row = mysqli_fetch_assoc($rs)){

        $rsChildren = getProductsForOrder($row['id']);

        if ($rsChildren){
            $row['children'] = $rsChildren;
            $smartyRs[] = $row;
        }

    }

    return $smartyRs;
}

function getProductsForOrder($orderId){
    global $db;
    $sql = "SELECT * FROM purchase AS pe LEFT JOIN products AS ps ON pe.product_id = ps.id WHERE (`order_id` = '{$orderId}')";

    $rs = mysqli_query($db, $sql);
    return createSmartyRsArray($rs);
}

function updateOrderStatus($itemId, $status){
    global $db;
    $status = intval($status);
    $sql = "UPDATE orders SET `status` = '{$status}' WHERE id = '{$itemId}'";

    $rs = mysqli_query($db, $sql);

    return $rs;
}

function updateOrderDatePayment($itemId, $datePayment){
    global $db;

    $sql = "UPDATE orders SET `date_payment` = '{$datePayment}' WHERE id = '{$itemId}'";

    $rs = mysqli_query($db, $sql);

    return $rs;
}