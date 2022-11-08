<?php
//Модель для таблицы продуктов (products)
/**
 * Получить определенное количество продуктов на выход
 * @param $limit
 * @return void
 */
function getLastProducts($limit){
    global $db;
    $count = $limit * $_GET['count'];
    $sql = "SELECT *, CONCAT(LEFT(name, 16), '..') AS name FROM `products` WHERE `status` = 1 ORDER BY `id` DESC LIMIT {$limit} OFFSET {$count}";

    $rs = mysqli_query($db, $sql);

    return createSmartyRsArray($rs);
}


function getCountAllProduct(){
    global $db;
    $sql = "SELECT COUNT(*) AS `count` FROM products WHERE status = 1";

    $rs = mysqli_query($db, $sql);

    return createSmartyRsArray($rs);
}

function getCountChildProduct($category_id){
    global $db;
    $sql = "SELECT COUNT(*) AS `count` FROM products WHERE status = 1 AND category_id IN ({$category_id})";

    $rs = mysqli_query($db, $sql);

    return createSmartyRsArray($rs);
}

/**
 *!!!
 * Выбрать продукты определенной категории
 * @param $itemId
 * @return array|false
 */
function getProductsByCat($itemId, $limit)
{
    global $db;

    $count = $limit * $_GET['count'];

    $sql = "SELECT *, CONCAT(LEFT(name, 16), '..') AS name FROM `products` WHERE `category_id` IN ({$itemId}) AND `status` = 1 ORDER BY `id` DESC LIMIT {$limit} OFFSET {$count}; ";

    $rs = mysqli_query($db, $sql);
    return createSmartyRsArray($rs);
}

/**
 * Получить данные продукта по ID
 *
 * @param $itemId
 * @return array|false|null
 */
function getProductById($itemId){
    global $db;
    $itemId = intval($itemId);
    $sql = "SELECT * FROM `products` WHERE `id` = '$itemId'";

    $rs = mysqli_query($db, $sql);
    return mysqli_fetch_assoc($rs);
}

function getProductsFromArray($itemsIds){
    global $db;
    $strIds = implode(', ', $itemsIds);
    $sql = "SELECT * FROM `products` WHERE `id` in ({$strIds})";
    $rs = mysqli_query($db, $sql);

    return createSmartyRsArray($rs);
}

function getProducts(){
    global $db;
    $sql = "SELECT * FROM products ORDER BY status DESC, category_id ASC";

    $rs = mysqli_query($db, $sql);

    return createSmartyRsArray($rs);
}

function insertProduct($itemName, $itemPrice, $itemDesc, $itemCat, $desc_cut){
    global $db;
    $sql = "INSERT INTO products SET name = '{$itemName}', 
             price = '{$itemPrice}',
             description = '{$itemDesc}',
             category_id = '{$itemCat}',
                     desc_cut = '{$desc_cut}'";
    $rs = mysqli_query($db, $sql);
    return $rs;
}

function updateProduct($itemId, $itemName, $itemPrice, $itemStatus, $itemDesc, $itemCat, $newFileName = null){
    global $db;

    $set = array();

    if ($itemName){
        $set[] = "`name` = '{$itemName}'";
    }
    if ($itemPrice){
        $set[] = "`price` = '{$itemPrice}'";
    }
    if (1 == $itemStatus || 0 == $itemStatus){
            $set[] = "`status` = '{$itemStatus}'";
    }
    if ($itemDesc){
        $set[] = "`description` = '{$itemDesc}'";
    }
    if ($itemCat){
        $set[] = "`category_id` = '{$itemCat}'";
    }
    if ($newFileName){
        $set[] = "`image` = '{$newFileName}'";
    }

    $setStr = implode(", ", $set);
    $sql = "UPDATE products SET {$setStr} WHERE id = '{$itemId}'";


    $rs = mysqli_query($db, $sql);

    return $rs;
}

function updateProductImage($itemId, $newFileName){
    $rs = updateProduct($itemId, null, null, 1, null, null, $newFileName);

    return $rs;
}

function searchProduct($input){
    global $db;
    $sql = "SELECT *, CONCAT(LEFT(name, 16), '..') AS name FROM products WHERE name LIKE '%{$input}%' OR description LIKE '%{$input}%';";
    $rs = mysqli_query($db, $sql);
    return $rs;
}