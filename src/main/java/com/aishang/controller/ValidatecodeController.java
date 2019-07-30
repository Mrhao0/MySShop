package com.aishang.controller;

import cn.dsna.util.images.ValidateCode;
import com.sun.deploy.net.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

@Controller
@RequestMapping("/")
public class ValidatecodeController {
    String code;
    @RequestMapping("/imgCode")
    public void imgCod(HttpServletResponse response){
        ValidateCode vc=new ValidateCode(163,64,4,100);
        code=vc.getCode();
        try {
            vc.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("/imgCoded")
    @ResponseBody
    public String imgCoded(String code1){
        if(code.equalsIgnoreCase(code1)){
            return "yes";
        }else{
            return "no";
        }
    }
}
