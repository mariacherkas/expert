<?php
/**
 * Какую страницу загружать, controller и action
 *
 * @param $smarty
 * @param $controllerName
 * @param string $actionName
 * @return void
 */
function loadPage($smarty, $controllerName, string $actionName = "index")
{
    require_once PATH_PREFIX . $controllerName . PATH_POSTFIX;
    $function = $actionName . 'Action';
    $function($smarty);
}

/**
 * Какой template
 *
 * @param $smarty
 * @param $templateName
 * @return void
 */
function loadTemplate($smarty, $templateName)
{
    $smarty->display($templateName . TEMPLATE_POSTFIX);
}

/**
 * Функция отладки
 *
 * @param $value
 * @param $die
 * @return void
 */
function d($value = null, $die = 1)
{
    echo 'Debug: <br> <pre>';
    print_r($value);
    echo '</pre>';

    if ($die) {
        die;
    }
}

/**
 * Массив Smarty
 *
 * @param $rs
 * @return array|false
 */
function createSmartyRsArray($rs)
{
    if (!$rs) {
        return false;
    }
    $smartyRs = array();
    while ($row = mysqli_fetch_assoc($rs)) {
        $smartyRs[] = $row;
    }
    return $smartyRs;
}

/**
 * Возврат на страницу
 *
 * @param $url
 * @return void
 */
function redirect($url)
{
    if (! $url) $url = '/';
    header("Location: {$url}");
    exit;
}
