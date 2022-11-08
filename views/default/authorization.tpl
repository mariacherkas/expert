{if isset($arUser)}
    <h3 style="text-align: center">Authorization was successful</h3>
{else}
    <div id="loginBox" class="card" style="width: 20rem; padding: 0px; margin-bottom: 10px; left: 25%;">
        <div class="card-body">
            <h1 class="h3 mb-3 fw-normal" style="text-align: center">Please sign in</h1>

            <div class="form-floating">
                <input type="email" class="form-control" id="loginEmail" name="loginEmail"  value="" placeholder="name@example.com">
                <label for="loginEmail">Email address</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="loginPwd" name="loginPwd" value="" placeholder="Password">
                <label for="loginPwd">Password</label>
            </div>
            <input type="button" onclick="login();" value="Login" class="w-100 btn btn-lg btn-primary"
                   style="background-color: #F29D52; border: 0px">
        </div>
    </div>
{/if}
