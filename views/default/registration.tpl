{if isset($arUser)}
<h3 style="text-align: center">Registration was successful</h3>
{else}
    <div class="col-md-7 col-lg-8" >
        <h4 class="mb-3">Registration</h4>
        <form class="needs-validation" novalidate id="registerBox">
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="username" class="form-label">Name</label>
                    <div class="input-group has-validation">
                        <span class="input-group-text">@</span>
                        <input type="text" class="form-control" id="name" name="name" value="{$name}" placeholder="Name" required>
                    </div>
                </div>

                <div class="col-sm-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="you@example.com" name="email" value="" >
                </div>

                <div class="col-12">
                    <label for="address" class="form-label">Address</label>
                    <textarea type="text" class="form-control" id="adress" name="adress" placeholder="1234 Main St" required> {$adress}</textarea>
                </div>

                <div class="col-12">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="{$phone}" placeholder="+380669668915" required>
                </div>

                <div class="col-sm-6">
                    <label for="pwd1" class="form-label">Password</label>
                    <input type="password" id="pwd1" name="pwd1" value="" class="form-control" placeholder="Minimum 8 symbols">
                </div>
                <div class="col-sm-6">
                    <label for="pwd2" class="form-label">Password again</label>
                    <input type="password" id="pwd2" name="pwd2" value="" class="form-control">
                </div>

            </div>
            <br>
            <input type="button" onclick="registerNewUser();" value="Regestration" class="w-100 btn btn-primary btn-lg" style="background-color: #F29D52; border: 0px">
        </form>
    </div>
{/if}