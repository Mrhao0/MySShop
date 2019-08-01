function verPassWord() {
    var pwd = $("#passWord").val();
    var pwd1 = /\d/;
    var pwd2 = /[a-zA-z]/;
    var pwd3 = /[^0-9a-zA-Z]/;
    var pwd4 = /[\u4e00-\u9fa5]/;
    var pwd5 = / /;
    if (!pwd1.test(pwd)) {
        $("#passWordMes").attr("class", "cuo");
        $("#passWordMes").attr("style", "color:red");
        $("#passWordMes").text("密码要包含至少一个数字");
        return;
    }
    if (!pwd2.test(pwd)) {
        $("#passWordMes").attr("class", "cuo");
        $("#passWordMes").attr("style", "color:red");
        $("#passWordMes").text("密码要包含至少一个字母");
        return;
    }
    if (!pwd3.test(pwd)) {
        $("#passWordMes").attr("class", "cuo");
        $("#passWordMes").attr("style", "color:red");
        $("#passWordMes").text("密码要包含至少一个符号");
        return;
    }
    if (pwd4.test(pwd)) {
        $("#passWordMes").attr("class", "cuo");
        $("#passWordMes").attr("style", "color:red");
        $("#passWordMes").text("密码不能有汉字");
        return;
    }
    if (pwd5.test(pwd)) {
        $("#passWordMes").attr("class", "cuo");
        $("#passWordMes").attr("style", "color:red");
        $("#passWordMes").text("密码不能有空格");
        return;
    }
    var pwdlength = pwd.length;
    if (pwdlength > 16 || pwdlength < 8) {
        $("#passWordMes").attr("class", "cuo");
        $("#passWordMes").attr("style", "color:red");
        $("#passWordMes").text("密码超过16位大于8位");
        return;
    }
    $("#passWordMes").attr("class", "dui");
    $("#passWordMes").attr("style", "color:green");
    $("#passWordMes").text("密码可用");
}