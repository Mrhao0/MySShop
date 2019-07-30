$(function(){

    $.ajax({
        url:"/MySShop/product/hotbot.do",
        dataType:"json",
        success:function(data){
            for (var i=0;i<data.length;i++) {
                $("#searchul").append("<li><a href='/MySShop/product/productlist.do?pname="+data[i]+"'>"+data[i]+"</a></li>")
            }
        }
    });
    $("#myorder").click(function(){
       if($("#logined").text()==""){
           alert("请先登录,谢谢")
       }
    });
    $("#oneclick").click(function(){

        if("little-login-h"==$("#minilogin").attr("class")){
            $("#minilogin").attr("class","little-login-h1")
        }else{
            $("#minilogin").attr("class","little-login-h")
        }
    });

    $("#onlogin").click(function(){
        var username= $("#userName").val();
        var password=$("#passWord").val();
        $.ajax({
            url:"/MySShop/user/ajaxlogin.do",
            data:{
                userName:username,
                passWord:password
            },
            success:function(data){
                console.log(data);
                console.log(decodeURI(data));
                if(data!="no"){
                    alert("welcome");
                    $("#minilogin").attr("class","little-login-h1");
                    window.location.reload();
                }else{
                    alert("no")
                    $("#minilogin").attr("class","little-login-h1");
                    window.location.reload();
                }
            }
        });
});


});