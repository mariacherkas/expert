<?php
const PATH_PREFIX = __DIR__ . '/../controllers/';
const PATH_POSTFIX = 'Controller.php';
//используемый шаблон
$template = "default";
$templateAdmin = 'admin';
//пути у файлам шаблонов
define("TEMPLATE_PREFIX", __DIR__ . "/../views/{$template}");
define("TEMPLATE_ADMIN_PREFIX", __DIR__ . "/../views/{$templateAdmin}");
define("TEMPLATE_POSTFIX", ".tpl");
//пути в веб пространстве
define("TEMPLATE_WEB_PATH", "/www/templates/{$template}");
define("TEMPLATE_ADMIN_WEB_PATH", "/www/templates/{$templateAdmin}");

//include_once __DIR__ . "/../vendor/";

require __DIR__ . '/../vendor/autoload.php';
/**
 * Подключение шаблонизатора Smarty
 */
$smarty = new Smarty();

$smarty->setTemplateDir(TEMPLATE_PREFIX);
$smarty->setCompileDir('../tmp/templates_c');
$smarty->setCacheDir('../tmp/cache');
$smarty->setConfigDir('../library/Smarty/demo/configs');
$smarty->assign('templateWebPath', TEMPLATE_WEB_PATH);
$template = 'default';
