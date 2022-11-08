<!--шаблон главной страницы-->
{foreach $rsProducts as $item name=products}
    <div class="card" style="float: left; width: 15rem; height: 25rem;">
        <a href="/?controller=product&id={$item['id']}/" style="margin: 10px 0px 0px 20px">
            <img src="/www/images/products/{$item['image']}" height="200px" width="150px" alt="">
        </a><br>
        <div class="card-body" style="padding-top: 0px">
        <h5 class="card-title"><a href="/?controller=product&id={$item['id']}/" style="height: 15px">{$item['name']}</a></h5>
            <p class="card-text" style="height: 50px">{$item['desc_cut']}..</p>
            <a href="#" id="addCart_{$item['id']}" {if $itemInCart}class="hideme" {/if} onclick="addToCart({$item['id']}); return false;" style="height: 15px">Add to basket</a>
        </div>
    </div>
    {if $smarty.foreach.products.iteration mod 3 == 0}
        <div style="clear:both;"></div>
    {/if}
{/foreach}

