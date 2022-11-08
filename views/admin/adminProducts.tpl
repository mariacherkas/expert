<h2>Products</h2>
<table class="table">
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Category</th>
        <th>Description</th>
        <th>Save</th>
    </tr>
    <tr>
        <td>
            <input type="text" id="newItemName" value="">
        </td>
        <td>
            <input type="text" id="newItemPrice" value="">
        </td>
        <td>
            <select id="newItemCatId">
                <option value="3">Phones Samsung</option>
                {foreach $rsCategories as $itemCat}
                    {if $itemCat['id'] >= 4}
                    <option value="{$itemCat['id']}">{$itemCat['name']}</option>
                    {/if}
                {/foreach}
            </select>
        </td>
        <td>
            <textarea id="newItemDesc"></textarea>
        </td>
        <td>
            <input type="button" value="Save" onclick="addProduct();">
        </td>
    </tr>
</table>

<table class="table">

    {foreach $rsProducts as $item name=products}

        <tr>
            <th style="width: 80px">№(id)</th>
            <th>Name</th>
            <th>Category</th>
            <th>Image</th>
            <th>Delete</th>
            <th>Save</th>
        </tr>

        <tr>
            <td rowspan="3" style="width: 80px">{$smarty.foreach.products.iteration}(id: {$item['id']})</td>
            <td>
                <input type="edit" id="itemName_{$item['id']}" value="{$item['name']}">
            </td>
            <td>
                <select id="itemCatId_{$item['id']}">
                    <option value="3">Phones Samsung</option>
                    {foreach $rsCategories as $itemCat}
                        {if $itemCat['id'] >= 4}
                            <option value="{$itemCat['id']}" {if $item['category_id'] == $itemCat['id']}selected{/if}>{$itemCat['name']}</option>
                        {/if}
                    {/foreach}
                </select>
            </td>

            <td rowspan="3">
                {if $item['image']}
                    <img src="../../www/images/products/{$item['image']}" width="100">
                {/if}
                <form action="/?controller=admin&action=upload" method="post" enctype="multipart/form-data">
                    <input type="file" name="filename" style="width: 230px; "><br>
                    <input type="hidden" name="itemId" value="{$item['id']}">
                    <input type="submit" value="Save" class="btn" style="
    background-color: #F29D52; color: #eeeeee"><br>
                </form>
            </td>
            <td rowspan="3">
                <input type="checkbox" id="itemStatus_{$item['id']}" {if $item['status'] == 0}checked="checked"{/if}>
            </td>
            <td rowspan="3">
                <input type="button" value="Save" class="btn" onclick="updateProduct('{$item['id']}');" class="btn" style="
    background-color: #F29D52; color: #eeeeee">
            </td>
        </tr>

        <tr>
            <th>Price</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>
                <input type="edit" id="itemPrice_{$item['id']}" value="{$item['price']}">
            </td>
            <td>
                <textarea id="itemDesc_{$item['id']}">{$item['description']}</textarea>
            </td>
        </tr>

    {/foreach}
</table>