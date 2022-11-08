{*order page*}
<h2>Order's data</h2>
<form id="frmOrder" action="/?controller=card&action=saveorder" method="post">
    <table class="table" style="width: 700px">
        <tr style="">
            <td>№</td>
            <td>Name</td>
            <td>Amount</td>
            <td>Per 1 item</td>
            <td>Price</td>
        </tr>

        {foreach $rsProducts as $item name=products}
            <tr>
                <td>{$smarty.foreach.products.iteration}</td>
                <td><a href="/?controller=product&id={$item['id']}">{$item['name']}</a></td>
                <td>
                <span id="itemCnt_{$item['id']}">
                    <input type="hidden" name="itemCnt_{$item['id']}" value="{$item['cnt']}">
                    {$item['cnt']}
                </span>
                </td>
                <td>
                <span id="itemPrice_{$item['id']}">
                    <input type="hidden" name="itemPrice_{$item['id']}" value="{$item['price']}">
                    {$item['price']}€
                </span>
                </td>
                <td>
                <span id="itemRealPrice_{$item['id']}">
                    <input type="hidden" name="itemRealPrice_{$item['id']}" value="{$item['realPrice']}">
                    {$item['realPrice']}€
                </span>

                </td>
            </tr>
        {/foreach}
                    <tr>
                        <td colspan="5" style="text-align: right">
                            <h4>Subtotal: <span id='totalPrice' value="{$totalPrice}" style='color: #D94D1A'>{$totalPrice}€</span></h4>
                        </td>
                    </tr>

    </table>

    {if isset($arUser)}
        {$buttonClass = "class='btn'"}
        <h2>Customer data</h2>
        <div id="orderUserInfoBox">
            {$name = $arUser['name']}
            {$phone = $arUser['phone']}
            {$adress = $arUser['adress']}
            <table class="table" style="width: 500px">
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
        <div style="margin-top: 30px">
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

            <div style="display: inline-block; vertical-align: top; margin: 10px"><b> OR </b></div>

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

    {/if}

    <input {$buttonClass} id="btnSaveOrder" type="button" value="Make an order" onclick="saveOrder();"
                          style="background-color: #F29D52; border: 0px">

</form>