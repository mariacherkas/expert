<?php
/* Smarty version 4.1.0, created on 2022-06-22 20:30:27
  from 'C:\OpenServer\domains\expert\views\default\leftcolumn.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_62b351b3886858_83414100',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4efe4c5e380f0a114d39550a6bc60d3e7b96ae12' => 
    array (
      0 => 'C:\\OpenServer\\domains\\expert\\views\\default\\leftcolumn.tpl',
      1 => 1655919023,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62b351b3886858_83414100 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="leftColumn">
    <div id="leftMenu">
        <div class="menuCaption">
            Menu
        </div>
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['rsCategories']->value, 'item');
$_smarty_tpl->tpl_vars['item']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
$_smarty_tpl->tpl_vars['item']->do_else = false;
?>
            <a href="/?controller=category&id=<?php echo $_smarty_tpl->tpl_vars['item']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_id']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_id']->value['index'] : null)];?>
"><?php echo $_smarty_tpl->tpl_vars['item']->value['name'];?>
</a><br>
            <?php if ((isset($_smarty_tpl->tpl_vars['item']->value['children']))) {?>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['item']->value['children'], 'itenChild');
$_smarty_tpl->tpl_vars['itenChild']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['itenChild']->value) {
$_smarty_tpl->tpl_vars['itenChild']->do_else = false;
?>
                    --<a href="/?controller=category&id=<?php echo $_smarty_tpl->tpl_vars['item']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_id']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_id']->value['index'] : null)];?>
"><?php echo $_smarty_tpl->tpl_vars['itenChild']->value['name'];?>
</a><br>
                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
            <?php }?>
        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
    </div>
</div><?php }
}
