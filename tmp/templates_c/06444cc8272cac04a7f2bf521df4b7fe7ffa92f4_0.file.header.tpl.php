<?php
/* Smarty version 4.1.0, created on 2022-06-22 14:56:09
  from 'C:\OpenServer\domains\expert\views\default\header.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_62b303593c2b77_60264183',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '06444cc8272cac04a7f2bf521df4b7fe7ffa92f4' => 
    array (
      0 => 'C:\\OpenServer\\domains\\expert\\views\\default\\header.tpl',
      1 => 1655898612,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:leftcolumn.tpl' => 1,
  ),
),false)) {
function content_62b303593c2b77_60264183 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $_smarty_tpl->tpl_vars['pageTitle']->value;?>
</title>
    <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['templateWebPath']->value;?>
css/main.css" type="text/css">
</head>
<body>
<div id="header">
    <h1>Expert - internet shop</h1>
</div>

<?php $_smarty_tpl->_subTemplateRender('file:leftcolumn.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div id="centerColumn"><?php }
}
