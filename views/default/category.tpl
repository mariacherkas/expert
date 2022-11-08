<h1>Products from category {$rsCategory['name']}</h1>

{if $rsProducts}
    {foreach $rsProducts as $item name=products}
        <div style="float: left; width: 15rem; height: 25rem;" class="card">
            <a href="/?controller=product&id={$item['id']}/" style="margin: 10px 0px 0px 20px">
                <img src="../../www/images/products/{$item['image']}" height="200px" width="150px">
            </a><br>
            <div class="card-body" style="padding-top: 0px">
                <h5 class="card-title" style="height: 15px"><a href="/?controller=product&id={$item['id']}/">{$item['name']}</a></h5>
                <p class="card-text" style="height: 50px">{$item['desc_cut']}...</p>
                <a href="#" id="addCart_{$item['id']}" {if $itemInCart}class="hideme" {/if} onclick="addToCart({$item['id']}); return false;">Add to basket</a>
            </div>
        </div>
        {if $smarty.foreach.products.iteration mod 3 == 0}
            <div style="clear: both"></div>
        {/if}
    {/foreach}
{else}
    <h3>Nothing here...</h3>
{/if}

{*
{foreach $rsChildCats as $item name=childCats}
    <h2><a href="/?controller=category&id={$item['id']}">{$item['name']}</a></h2>
{/foreach}
*}