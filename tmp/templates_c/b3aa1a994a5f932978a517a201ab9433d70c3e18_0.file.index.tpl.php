<?php
/* Smarty version 4.1.0, created on 2022-06-22 15:17:44
  from 'C:\OpenServer\domains\expert\views\default\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_62b30868e18e91_50031512',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b3aa1a994a5f932978a517a201ab9433d70c3e18' => 
    array (
      0 => 'C:\\OpenServer\\domains\\expert\\views\\default\\index.tpl',
      1 => 1655900263,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62b30868e18e91_50031512 (Smarty_Internal_Template $_smarty_tpl) {
?><!--шаблон главной страницы-->
<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['rsProducts']->value, 'item', false, NULL, 'products', array (
  'iteration' => true,
));
$_smarty_tpl->tpl_vars['item']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
$_smarty_tpl->tpl_vars['item']->do_else = false;
$_smarty_tpl->tpl_vars['__smarty_foreach_products']->value['iteration']++;
?>
    <div style="float: left; padding: 0 30px 40px 0">
        <a href="/products/<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
/">
            <img src="../../www/images/products/<?php echo $_smarty_tpl->tpl_vars['item']->value['image'];?>
" width="100px" alt="">
        </a><br>
        <a href="/products/<?php echo $_smarty_tpl->tpl_vars['item']->value['id'];?>
/"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</a>
    </div>
    <?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_products']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_products']->value['iteration'] : null) % 3 == 0) {?>
        <div style="clear:both;"></div>
    <?php }
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);
}
}
