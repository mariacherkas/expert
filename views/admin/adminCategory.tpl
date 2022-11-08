<h2>Categories</h2>

<div id="blockNewCategory">
    New Category:
    <input name="newCategoryName" id="newCategoryName" type="text" value="">
    <br>

    It is subcategory for
    <select name="generalCatId">
        <option value="0">Main category</option>
        {foreach $rsCategories as $item}
            <option value="{$item['id']}">{$item['name']}</option>
        {/foreach}
    </select>
    <br>
    <input type="button" class="btn" onclick="newCategory();" value="Add category" style="background-color: #F29D52; color: #eeeeee">
</div>
<br>
<table class="table">
    <tr>
        <th>№</th>
        <th>ID</th>
        <th>Name</th>
        <th>Parent category</th>
        <th>Action</th>
    </tr>
    {foreach $rsCategories as $item name=categories}
        <tr>
            <td>{$smarty.foreach.categories.iteration}</td>
            <td>{$item['id']}</td>
            <td>
                <input type="edit" id="itemName_{$item['id']}" value="{$item['name']}">
            </td>
            <td>
                <select id="parentId_{$item['id']}">
                    <option value="0">Main category</option>
                    {foreach $rsMainCategories as $mainItem}
                        <option value="{$mainItem['id']}" {if $item['parent_id'] == $mainItem['id']}selected{/if}>{$mainItem['name']}</option>
                    {/foreach}
                </select>
            </td>
            <td>
                <input type="button" value="Save" onclick="updateCat('{$item['id']}');" class="btn" style="background-color: #F29D52; color: #eeeeee">
            </td>
        </tr>
    {/foreach}
</table>