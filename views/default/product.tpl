{*страница продукта*}
<div class="col-lg-12" style="margin-right: 20px">
    <div class="col" style="vertical-align: top">
        <img src="../../www/images/products/{$rsProduct['image']}" width="300px" height="400px"
             style="float: left; margin-right: 30px;"><br>
    </div>
    <div class="col">
        <b style="font-size: x-large">{$rsProduct['name']}</b><br>

        <p class="display-6" style="font-size: x-large;">Cost: <b style="color: #D94D1A">{$rsProduct['price']}€</b></p>

        <a href="#" id="removeCart_{$rsProduct['id']}" {if ! $itemInCart}class="hideme" {/if}
           onclick="removeFromCart({$rsProduct['id']}); return false;">
            <button class="btn" style="background-color:  #F29D52"><b style="font-size: large; color: #eeeeee">Remove
                    from basket</b></button>
        </a>
        <a href="#" id="addCart_{$rsProduct['id']}" {if  $itemInCart}class="hideme" {/if}
           onclick="addToCart({$rsProduct['id']}); return false;">
            <button class="btn " style="background-color: #D94D1A"><b style="font-size: large; color: #eeeeee;">Add to
                    basket</b></button>
        </a>
        <br>
        <b style="font-size: x-large">About this item:</b> <br>
        <p style="font-size: large">{$rsProduct['description']}</p>
    </div>
</div>