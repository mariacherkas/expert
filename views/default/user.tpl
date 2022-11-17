{*user`s page*}
<div class="row">
<h1>Your data</h1>
<div class="row">

    <div class="row row-cols-1 row-cols-md-2">
        <div class="col"><b>Login(email)</b></div>
        <div class="col">{$arUser['email']}</div>
    </div>
    <div class="row row-cols-1 row-cols-md-2">
        <div class="col"><b>Name</b></div>
        <div class="col"><input type="text" id="newName" value="{$arUser['name']}"></div>
    </div>
    <div class="row row-cols-1 row-cols-md-2">
        <div class="col"><b>Phone</b></div>
        <div class="col"><input type="text" id="newPhone" value="{$arUser['phone']}"></div>
    </div>
    <div class="row row-cols-1 row-cols-md-2">
        <div class="col"><b>Address</b></div>
        <div class="col"><textarea id="newAdress">{$arUser['adress']}</textarea></div>
    </div>
    <div class="row row-cols-1 row-cols-md-2">
        <div class="col"><b>New password</b></div>
        <div class="col"><input type="password" id="newPwd1" value=""></div>
    </div>
    <div class="row row-cols-1 row-cols-md-2">
        <div class="col"><b>New password again</b></div>
        <div class="col"><input type="password" id="newPwd2" value=""></div>
    </div>
    <div class="row row-cols-1 row-cols-md-2">
        <div class="col"><b>Your current password<br>(to save your data)</b></div>
        <div class="col"><input type="password" id="curPwd" value=""></div>
    </div>

    <div class="row row-cols-1 row-cols-md-2" >
    
        <div class="col"></div>
            <div class="col">
<input type="button" class="btn" value="Save" onclick="updateUserData();" style="background-color: #F29D52; border: 0px; width: 180px">
    </div>
    </div>
</div>


<div class="showrow"><br> *If you want to see all your orders please log into your account from the computer </div>

<div class="hiderow">
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

</div>

</div>