{* шаблон корзины *}

<h1>Shopping Basket</h1>

{if ! $rsProducts}
    Nothing in basket
{else}
    <form action="/?controller=card&action=order" method="post">
        <table style="width: 700px">
            <hr style="width: 700px">
            {foreach $rsProducts as $item name=products}
                <tr>
                    <td style="width: 135px" rowspan="3">
                        <img src="../../www/images/products/{$item['image']}" style="width: 130px; height: 200px">
                    </td>
                    <td colspan="2">
                        <h4><a href="?controller=product&id={$item['id']}/">{$item['name']}</a><br></h4>
                    </td>
                    <td style="width: 300px; text-align: right">

                        <p class="display-6" style="font-size: x-large; display: inline-block"><b
                                    style="color: #D94D1A"><span id="itemRealPrice_{$item['id']}"
                                                                 value="{$item['realPrice']}">{$item['price']}</span>€</b>
                        </p>

                        <span id="itemPrice_{$item['id']}" value="{$item['price']}">
                            {$item['price']}
                        </span>€ (per 1 item)
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p>{$item['desc_cut']}...</p>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; width: 35px"><input name="itemCnt_{$item['id']}"
                                                                       id="itemCnt_{$item['id']}" type="text" value="1"
                                                                       onchange="conversionPrice({$item['id']});"
                                                                       style="width: 30px; height: 35px">
                    </td>
                    <td>
                        <a id="removeCart_{$item['id']}" class="btn" style="background-color: gray; border: 0px"
                           href="#"
                           onclick="removeFromCart({$item['id']}); return false;" title="Remove">Delete</a>
                        <a id="addCart_{$item['id']}" class="hideme btn" href="#"
                           onclick="addToCart({$item['id']}); return false;" title="Return"
                           style="background-color: #F29D52; border: 0px;">Return</a>

                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <hr style="width: 700px">
                    </td>
                </tr>
                
            {/foreach}
            
                    <tr>
                        <td colspan="4" style="text-align: right">
                            <h4>Subtotal: <span id='totalPrice' value="{$totalPrice}" style='color: #D94D1A'>{$totalPrice}</span><span style='color: #D94D1A'>€</span></h4>

                        </td>
                    </tr>

            <tr>
                <td colspan="3"></td>
                <td style="text-align: right"><input type="submit" value="Make an order" class="btn"
                                                     style="background-color: #F29D52;  border: 0px"></td>
            </tr>
        </table>
    </form>
{/if}