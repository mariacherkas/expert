/**
 * Функция добавления товара в корзину
 * @param itemId
 * В случае успеха обновятся данные корзины на странице
 */
function addToCart(itemId) {
    console.log("js - addToCart()");
    $.ajax({
        type: 'POST',
        async: false,
        url: "/?controller=card&action=addtocart&id=" + itemId + '/',
        dataType: 'json',
        success: function (data) {
            console.dir('text');
            if (1 == data['success']) {
                $('#cartCntItems').html(data['cntItems']);
                $('#addCart_' + itemId).hide();
                $('#removeCart_' + itemId).show();
            }
        }
    });
}

/**
 * Функция удаления товара из корзины
 * @param itemId
 */
function removeFromCart(itemId) {
    console.log("js - removeFromCart(" + itemId + ")");
    $.ajax({
        type: 'POST',
        async: false,
        url: "/?controller=card&action=removefromcart&id=" + itemId + '/',
        dataType: 'json',
        success: function (data) {
            if (1 == data['success']) {
                $('#cartCntItems').html(data['cntItems']);
                $('#addCart_' + itemId).show();
                $('#removeCart_' + itemId).hide();
            }
        }
    });
}

/**
 * Считаем цену продукта(умножаем цену на количество)
 * @param itemId
 */
function conversionPrice(itemId) {
    var newCnt = $('#itemCnt_' + itemId).val();
    var itemPrice = $('#itemPrice_' + itemId).attr('value');
    var itemRealPrice = newCnt * itemPrice;
    var totalPrice = Number($('#totalPrice').attr('value'));
    var newTotalPrice = totalPrice + itemRealPrice - itemPrice;
    newTotalPrice = newTotalPrice.toFixed(2);

    console.log(typeof(totalPrice));
    $('#itemRealPrice_' + itemId).html(itemRealPrice);
    $('#totalPrice').html(newTotalPrice);
}

/**
 * Получаем данные из input, textarea, select
 * @param obj_form
 * @returns {{}}
 */
function getData(obj_form) {
    var hData = {};
    $('input, textarea, select', obj_form).each(function () {
        if (this.name && this.name !== '') {
            hData[this.name] = this.value;
            // console.log('hData[' + this.name + '] = ' + hData[this.name]);
        }
    });
    return hData;

}

/**
 * Регистрируем нового пользователя
 */
function registerNewUser() {
    var postData = getData('#registerBox');
    console.log(postData);
    $.ajax({
        type: 'POST',
        async: false,
        url: '/?controller=user&action=register',
        data: postData,
        dataType: 'json',
        success: function (data) {
            if (1 == data['success']) {
                alert('Alles gut');

                $('#registerBox').hide();

                $('#userLink').attr('href', '/?controller=user');
                $('#userLink').html(data['userName']);
                $('#userBox').show();

                $('#loginBox').hide();
                $('#btnSaveOrder').show();
            } else {
                alert(data['message']);
            }
        }
    });
}

/**
 * Логинимся
 */
function login() {
    var email = $('#loginEmail').val();
    var pwd = $('#loginPwd').val();

    var postData = "email=" + email + "&pwd=" + pwd;

    $.ajax({
        type: 'POST',
        async: false,
        url: "/?controller=user&action=login",
        data: postData,
        dataType: 'json',
        success: function (data) {
            if (1 == data['success']) {
                $('#registerBox').hide();
                $('#loginBox').hide();

                //$('#userLink').attr('href', '/?controller=user');
                //$('#userLink').html(data['displayName']);
                $('#userBox').show();

                $('#name').val(data['name']);
                $('#phone').val(data['phone']);
                $('#adress').val(data['adress']);

                $('#btnSaveOrder').show();

                document.location.reload();
            } else {
                alert(data['message']);
            }
        }
    });
}

/**
 * Показать блок для регистрации
 */
function showRegisterBox() {
    if ($("#registerBoxHidden").css('display') != 'block') {
        $("#registerBoxHidden").show();
    } else {
        $("#registerBoxHidden").hide();
    }
}

/**
 * Обновление данных пользователя
 */
function updateUserData() {
    console.log("js - updateUserData()");
    var phone = $('#newPhone').val();
    var adress = $('#newAdress').val();
    var pwd1 = $('#newPwd1').val();
    var pwd2 = $('#newPwd2').val();
    var curPwd = $('#curPwd').val();
    var name = $('#newName').val();

    var postData = {
        phone: phone,
        adress: adress,
        pwd1: pwd1,
        pwd2: pwd2,
        curPwd: curPwd,
        name: name
    };

    $.ajax({
        type: 'POST',
        async: false,
        url: "/?controller=user&action=update",
        data: postData,
        dataType: 'json',
        success: function (data) {
            if (1 == data['success']) {
                // console.log(data['userName']);
                $('#userLink').html(data['userName']);
                alert(data['message']);
            } else {
                alert(data['message']);
            }
        }
    });
}

/**
 * Save order function
 */
function saveOrder() {
    var postData = getData('form');
    $.ajax({
        type: 'POST',
        async: false,
        url: "/?controller=card&action=saveorder",
        data: postData,
        dataType: 'json',
        success: function (data) {
            if (data['success']) {
                alert(data['message']);
                document.location = '/';
            } else {
                alert(data['message']);
            }
        }
    });
}

/**
 * Показать продукты
 *
 * @param id
 */
function showProducts(id) {
    var objName = "#purchasesForOrderId_" + id;
    if ($(objName).css('display') != 'table-row') {
        $(objName).show();
    } else {
        $(objName).hide();
    }
}

/**
 * 
 */
function search1() {
    let postData = getData('#search');
    console.log(postData);
    $.ajax({
        type: 'POST',
        async: false,
        url: '/?controller=user&action=search',
        data: postData,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            if (1 == data['success']) {
                $('#centerColumn').html(data['result']);
                console.log('success');
            } else {
                console.log('try again');
            }
        }
    });
}