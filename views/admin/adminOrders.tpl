<h2>Orders</h2>
{if ! $rsOrders}
    Nothing here
{else}
    <table class="table">
        <tr>
            <th>№</th>
            <th>Action</th>
            <th>Orders Id</th>
            <th>Status</th>
            <th>Date created</th>
            <th>Date payment</th>
            <th>Further Information</th>
            <th>Date order change</th>
        </tr>
        {foreach $rsOrders as $item name=orders}
            <tr>
                <td>{$smarty.foreach.orders.iteration}</td>
                <td><a href="#" onclick="showProducts('{$item['id']}'); return false;">Show products</a></td>
                <td>{$item['id']}</td>
                <td>
                    <input type="checkbox" id="itemStatus_{$item['id']}" {if $item['status']}checked="checked"{/if} onclick="updateOrderStatus('{$item['id']}');">Closed
                </td>
                <td>{$item['date_created']}</td>
                <td>
                    <input id="datePayment_{$item['id']}" type="text" value="{$item['date_payment']}">
                    <input type="button" value="Save" onclick="updateDatePayment('{$item['id']}')">
                </td>
                <td>{$item['comment']}</td>
                <td>{$item['date_modification']}</td>
            </tr>

            <tr class="hideme" id="purchasesForOrderId_{$item['id']}">
                <td colspan="8">
                    {if $item['children']}
                        <table>
                            <tr>
                                <th>№</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Amount</th>
                            </tr>
                    {foreach $item['children'] as $itemChild name=products}
                            <tr>
                                <td>{$smarty.foreach.products.iteration}</td>
                                <td>{$itemChild['id']}</td>
                                <td><a href="/?controller=product">{$itemChild['name']}</a></td>
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