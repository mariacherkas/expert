{*user`s page*}

<h1>Your data</h1>
<table class="table" style="width: 500px">
    <tr>
        <td>Login(email)</td>
        <td>{$arUser['email']}</td>
    </tr>
    <tr>
        <td>Name</td>
        <td><input type="text" id="newName" value="{$arUser['name']}"></td>
    </tr>
    <tr>
        <td>Phone</td>
        <td><input type="text" id="newPhone" value="{$arUser['phone']}"></td>
    </tr>
    <tr>
        <td>Address</td>
        <td><textarea id="newAdress">{$arUser['adress']}</textarea></td>
    </tr>
    <tr>
        <td>New password</td>
        <td><input type="password" id="newPwd1" value=""></td>
    </tr>
    <tr>
        <td>New password again</td>
        <td><input type="password" id="newPwd2" value=""></td>
    </tr>
    <tr>
        <td>Please enter your old password to save your data</td>
        <td><input type="password" id="curPwd" value=""></td>
    </tr>

</table>

<input type="button" class="btn" value="Save" onclick="updateUserData();" style="background-color: #F29D52; border: 0px; margin-left: 280px; width: 180px">

<h2>Orders</h2>
{if ! $rsUserOrders}
    Nothing here
{else}
    <table class="table" style="width: 700px">
        <tr>
            <th>№</th>
            <th>Action</th>
            <th>Order`s id</th>
            <th>Status</th>
            <th>Date created</th>
            <th>Date payment</th>
            <th>Comment</th>
        </tr>
        {foreach $rsUserOrders as $item name=orders}
            <tr>
                <td>{$smarty.foreach.orders.iteration}</td>
                <td><a href="#" onclick="showProducts('{$item['id']}'); return false;">Show product</a></td>
                <td>{$item['id']}</td>
                <td>
                    {if $item['status'] == 1}
                        Заказ оплачен
                    {else}
                        Заказ не оплачен
                    {/if}
                </td>
                <td>{$item['date_created']}</td>
                <td>{$item['date_payment']}</td>
                <td>{$item['comment']}</td>
            </tr>

            <tr class="hideme" id="purchasesForOrderId_{$item['id']}">
                <td colspan="7">
                    {if $item['children']}
                    <table class="table" style="width: 700px">
                        <tr>
                            <th>№</th>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Amount</th>
                        </tr>
                        {foreach $item['children'] as $itemChild name=products}
                            <tr>
                                <td>{$smarty.foreach.products.iteration}</td>
                                <td>{$itemChild['product_id']}</td>
                                <td><a href="/?controller=product&id={$itemChild['product_id']}">{$itemChild['name']}</a></td>
                                <td>{$itemChild['price']}</td>
                                <td>{$itemChild['amount']}</td>
                            </tr>
                        {/foreach}
                    </table>
                    {/if}
                </td>
            </tr>
        {/foreach}
    </table>
{/if}