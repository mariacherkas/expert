{* шаблон корзины *}

<h1>Shopping Basket</h1>

{if ! $rsProducts}
    Nothing in basket
{else}
    <form action="/?controller=card&action=order" method="post">
        <div class="row row-lg-3" style="">
            <hr style="">
            {foreach $rsProducts as $item name=products}
                <div class="col-auto">

                        <img src="../../www/images/products/{$item['image']}" style="width: 130px; height: 200px">

                </div>
                <div class="col">
                <div class="row row-md-1"> 
                <div class="col">   
                        <h4><a href="?controller=product&id={$item['id']}/">{$item['name']}</a><br></h4>


                        <p class="hiderow">{$item['desc_cut']}...</p>



                        <input name="itemCnt_{$item['id']}"
                                                                       id="itemCnt_{$item['id']}" type="text" value="1"
                                                                       onchange="conversionPrice({$item['id']});"
                                                                       style="width: 30px; height: 35px">


                        <a id="removeCart_{$item['id']}" class="btn" style="background-color: gray; border: 0px"
                           href="#"
                           onclick="removeFromCart({$item['id']}); return false;" title="Remove">Delete</a>
                        <a id="addCart_{$item['id']}" class="hideme btn" href="#"
                           onclick="addToCart({$item['id']}); return false;" title="Return"
                           style="background-color: #F29D52; border: 0px;">Return</a>


                </div>
                <div class="col-auto">
                        <p class="display-6 " style="font-size: x-large; display: inline-block"><b
                                    style="color: #D94D1A"><span id="itemRealPrice_{$item['id']}"
                                                                 value="{$item['realPrice']}">{$item['price']}</span>€</b>
                        </p>

                        <span id="itemPrice_{$item['id']}" class="" value="{$item['price']}">
                            {$item['price']}
                        </span>€ (per 1 item)
                </div>
                </div>
                </div>

                        <hr style="margin-top: 10px">
                
            {/foreach}
            
                    <div class="row" style="text-align: right">
                            <h4>Subtotal: <span id='totalPrice' value="{$totalPrice}" style='color: #D94D1A'>{$totalPrice}</span><span style='color: #D94D1A'>€</span></h4>
                    </div>

            <div class="row">

                    <input type="submit" value="Make an order" class="btn"
                                                     style="background-color: #F29D52;  border: 0px">
            </div>
        </div>
    </form>
{/if}