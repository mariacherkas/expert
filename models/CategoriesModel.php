<?php
//модель для таблицы categories
include_once __DIR__ . '/../config/db.php';
/**
 * Получение дочерних категорий для категории
 * @param $catId
 * @return array|false
 */
function getChildrenForCat($catId)
{
    global $db;
    $sql = "SELECT * FROM `categories` WHERE `parent_id` = '$catId'";
    $rs = mysqli_query($db, $sql);
    return createSmartyRsArray($rs);
}

/**
 * Получить главные категории с привязками дочерних
 * @return array Массив категорий
 */
function getAllMainCatsWithChildren()
{
    global $db;
    $sql = 'SELECT * FROM `categories` WHERE `parent_id` = 0';
    $rs = mysqli_query($db, $sql);

    $smartyRs = array();

    while ($row = mysqli_fetch_assoc($rs)) {
        $rsChildren = getChildrenForCat($row['id']);
        if ($rsChildren) {
            $row['children'] = $rsChildren;
        }
        $smartyRs[] = $row;
    }
    return $smartyRs;
}

/**
 * Получить данные категории по id
 * @param $catId
 * @return array|false|null
 */
function getCatById($catId)
{
    global $db;
    $catId = intval($catId);
    $sql = "SELECT * FROM `categories` WHERE `id` = '$catId'";
    $rs = mysqli_query($db, $sql);

    return mysqli_fetch_assoc($rs);
}


/**
 * Выбираем все главные категории
 * @return array|false
 */
function getAllMainCategories(){
    global $db;
    $sql = 'SELECT * FROM categories WHERE parent_id = 0';

    $rs = mysqli_query($db, $sql);

    return createSmartyRsArray($rs);
}

/**
 * Добавление категории
 *
 * @param $catName
 * @param $catParentId
 * @return int|string
 */
function insertCat($catName, $catParentId = 0){
    global $db;

    $sql = "INSERT INTO categories (`parent_id`, `name`) VALUES ('{$catParentId}', '{$catName}')";

    mysqli_query($db, $sql);

    $id = mysqli_insert_id($db);

    return $id;
}


/**
 * Выбираем все существующие категории
 *
 * @return array|false
 */
function getAllCategories(){
    global $db;
    $sql = 'SELECT * FROM categories ORDER BY parent_id ASC';

    $rs = mysqli_query($db, $sql);

    return createSmartyRsArray($rs);
}

/**
 * Обновление данных категории
 *
 * @param $itemId
 * @param $parentId
 * @param $newName
 * @return bool|mysqli_result
 */
function updateCategoryData($itemId, $parentId = -1, $newName = ''){
    global $db;
    $set = array();

    if ($newName){
        $set[] = "`name` = '{$newName}'";
    }

    if ($parentId > -1){
        $set[] = "`parent_id` = '{$parentId}'";
    }

    $setStr = implode(", ", $set);
    $sql = "UPDATE categories SET {$setStr} WHERE id = '{$itemId}'";

    $rs = mysqli_query($db, $sql);

    return $rs;
}