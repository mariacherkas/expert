<div class="col-auto">
<div id="leftColumn">
    {*меню слева, вывод категорий товаров*}

    <div id="leftMenu" class="card" style=" padding: 0px; margin-bottom: 10px">
        <div class="menuCaption card-header" style="padding: 10px 0px 10px 15px">
            Menu
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item"><h6><a href="?controller=index&count=0">All products</a></h6></li>
            {foreach $rsCategories as $item}
                <li class="list-group-item" style="font-size: large"><h6><a
                                href="/?controller=category&id={$item['id']}">{$item['name']}</a></h6></li>
                {if isset($item['children'])}
                    {foreach $item['children'] as $itemChild}
                        <li class="list-group-item"><h6><a
                                        href="/?controller=category&id={$itemChild['id']}">-{$itemChild['name']}</a>
                            </h6></li>
                    {/foreach}
                {/if}
            {/foreach}
        </ul>
    </div>

    {if isset($arUser)}
        <div id="userBox" class="card" style="padding: 0px; margin-bottom: 10px">
            <div class="card-body">
                <a href="/?controller=user" id="userLink">{$arUser['displayName']}</a><br>
                <a href="/?controller=user&action=logout">Logout</a>
            </div>
        </div>
    {else}

        {*Поле с ником пользователя и с возможностью выйти из аккаунта, скрыта до того момента, пока пользователь работает без входа в аккаунт*}
        <div id="userBox" class="hideme card" style="padding: 0px; margin-bottom: 10px">
            <div class="card-body">
                <a href="#" id="userLink"></a><br>
                <a href="/?controller=user&action=logout">Logout</a>
            </div>
        </div>
        {*Поле с авторизацией уже зарегестрированного пользователя, скрыто если пользователь уже вошел в аккаунт*}

        {if ! isset($hideLoginBox)}
            <div id="loginBox" class="card" style=" padding: 0px; margin-bottom: 10px;;">
                <div class="card-body">
                    <div class="menuCaption">Please sign in</div>
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
            {*Поле с регистрацией пользователя, скрыто, пока не нажмешь на ссылку регстрации или если уже зашел в свой аккаунт*}
            <div id="registerBox" class="card" style=" padding: 0px; margin-bottom: 10px">
                <div class="card-body">
                    <div class="menuCaption showHidden" onclick="showRegisterBox();" style="color: #D94D1A">
                        Registration
                    </div>
                    <div id="registerBoxHidden">

                        <div class="form-floating">
                            <input type="email" class="form-control" id="email" name="email" value=""
                                   placeholder="name@example.com">
                            <label for="email">Email address</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="pwd1" name="pwd1" value=""
                                   placeholder="Password">
                            <label for="pwd1">Password</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="pwd2" name="pwd2" value=""
                                   placeholder="Password">
                            <label for="pwd2">Password</label>
                        </div>
                        <input type="button" onclick="registerNewUser();" value="Registration"
                               class=" btn btn-lg btn-primary" style="background-color: #F29D52; border: 0px"
                        >

                        <a href="/?controller=user&action=registration">Full registration</a>
                    </div>
                </div>
            </div>
        {/if}
    {/if}
    {*Корзина с счетчиком товаров в корзине*}
    <div class="card" style=" padding: 0px; margin-bottom: 10px">
        <div class="card-body">
            <div class="menuCaption">Basket</div>
            <b><a href="/?controller=card">In Basket</a></b>
            <span id="cartCntItems">
        {if $cartCntItems > 0}{$cartCntItems}
        {else}Nothing{/if}
    </span>
        </div>
    </div>
</div>
</div>