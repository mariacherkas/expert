{*order page*}
<div class="row">
<h2>Order's data</h2>
<form id="frmOrder" action="/?controller=card&action=saveorder" method="post">
    <div class="row">
            <div class="col-1 hidecol">№</div>
            <div class="col" style="width: 10rem">Name</div>
            <div class="col">Qty</div>
            <div class="col hidecol">Per 1 item</div>
            <div class="col">Price</div>
    </div>
                            <hr style="margin-top: 10px">
        {foreach $rsProducts as $item name=products}
    <div class="row">
                <div class="col-1 hidecol">{$smarty.foreach.products.iteration}</div>
                <div class="col"  style="width: 10rem"><a href="/?controller=product&id={$item['id']}">{$item['name']}</a></div>
                <div class="col">
                <span id="itemCnt_{$item['id']}">
                    <input type="hidden" name="itemCnt_{$item['id']}" value="{$item['cnt']}">
                    {$item['cnt']}
                </span>
                </div>
                <div class="col hidecol">
                <span id="itemPrice_{$item['id']}">
                    <input type="hidden" name="itemPrice_{$item['id']}" value="{$item['price']}">
                    {$item['price']}€
                </span>
                </div>
                <div class="col">
                <span id="itemRealPrice_{$item['id']}">
                    <input type="hidden" name="itemRealPrice_{$item['id']}" value="{$item['realPrice']}">
                    {$item['realPrice']}€
                </span>
                </div>
    </div>
                            <hr style="margin-top: 10px">
        {/foreach}
    <div class="row">
                        <div style="text-align: right">
                            <h4>Subtotal: <span id='totalPrice' value="{$totalPrice}" style='color: #D94D1A'>{$totalPrice}€</span></h4>
                        </div>
    </div>


    {if isset($arUser)}
        {$buttonClass = "class='btn'"}
        <h2>Customer data</h2>
        <div id="orderUserInfoBox">
            {$name = $arUser['name']}
            {$phone = $arUser['phone']}
            {$adress = $arUser['adress']}
            <table class="table" style="">
                <tr>
                    <td>Name</td>
                    <td><input type="text" id="name" name="name" value="{$name}"></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" id="phone" name="phone" value="{$phone}"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea id="adress" name="adress">{$adress}</textarea></td>
                </tr>
            </table>
        </div>
    {else}

        <h3>You need to log into your account</h3>

        <div class="row">
            <div class="col-auto">
                <div id="registerBox" class="card" style="display: inline-block; width: 15rem">
                    <div class="card-body">
                    <div class="menuCaption">Registration</div>

                    <div class="form-floating">
                        <input type="email" class="form-control" id="email" name="email" value=""
                               placeholder="name@example.com">
                        <label for="email">Email address</label>
                        <div id="emailHelp" class="form-text">We'll never share your email with
                            anyone else.
                        </div>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="pwd1" name="pwd1" value=""
                               placeholder="Password">
                        <label for="pwd1">Password</label>
                        <div id="pswHelp" class="form-text">Minimum 8 symbols
                        </div>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="pwd2" name="pwd2" value=""
                               placeholder="Password again">
                        <label for="pwd2">Password again</label>
                    </div>

                    <div class="form-floating">
                        <input type="text" class="form-control" id="name" name="name" value="{$name}"
                               placeholder="Name">
                        <label for="pwd2">Name*</label>
                    </div>

                    <div class="form-floating">
                        <input  class="form-control" type="text" id="phone" name="phone" value="{$phone}"
                               placeholder="Password">
                        <label for="pwd2">Phone*</label>
                    </div>

                    <div class="form-floating">
                        <textarea id="adress" name="adress" class="form-control">{$adress}</textarea>
                        <label for="pwd2" style="color: black; font-size: large">Address*</label>
                    </div>
                    <input type="button" onclick="registerNewUser();" value="Registration"
                           class="w-100 btn btn-lg btn-primary" style="background-color: #F29D52; border: 0px"
                    >

                </div>

            </div>
        </div>

        <div class="col-auto">
            <div style="display: inline-block; vertical-align: top; margin: 10px"><b> OR </b></div>
        </div>
        <div class="col">
            <div id="loginBox" class="card"
                 style="width: 15rem; padding: 0px; margin-bottom: 10px; display: inline-block; vertical-align: top">
                <div class="card-body">
                    <div class="menuCaption">Sign in</div>
                    <div class="form-floating">
                        <input type="email" class="form-control" id="loginEmail" name="loginEmail" value=""
                               placeholder="name@example.com">
                        <label for="loginEmail">Email address</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="loginPwd" name="loginPwd" value=""
                               placeholder="Password">
                        <label for="loginPwd">Password</label>
                    </div>
                    <input type="button" onclick="login();" value="Login" class="w-100 btn btn-lg btn-primary"
                           style="background-color: #F29D52; border: 0px">
                </div>
            </div>
        </div>
        {$buttonClass = "class='hideme bth'"}
    </div>
    {/if}

    <input {$buttonClass} id="btnSaveOrder" type="button" value="Make an order" onclick="saveOrder();"
                          style="background-color: #F29D52; border: 0px">

</form>

</div>