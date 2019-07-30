package com.aishang.controller;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.aishang.po.ProductTypeListSp;
import com.aishang.po.User;
import com.aishang.service.IUserService;
import com.aishang.util.ProductUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import java.applet.AppletContext;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController{

    @Resource
    private IUserService userService;
@Resource
HttpSession session;
    //注册页
    @RequestMapping("/register")
    public String register(){
        return "register";
    }
    //登录页
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    //个人信息页
    @RequestMapping("/personalData")
    public String personalData(){
        return "personalData";
    }

    //注册页-验证用户名重复
    @ResponseBody
    @RequestMapping("/verUserName")
    public String verUserName(String userName){
        System.out.println("\n\n\n"+userName+"\n\n\n");
       User user = userService.selectUserByUserName(userName);
       if(user!=null){
               return "no";
       }else{
           return "yes";
       }
    }
    //注册页-登录页&登陆前验证
    @RequestMapping("/login1")
    public String login1(User user, Model model){
        if(user!=null){
            String passWord=user.getPassWord();
            String userName= user.getUserName();
            String userName1=userName.replace(" ","");
            String or= verUserName(userName);
            if(or.equals("no")){
                model.addAttribute("regedUserName","no");
                return "register";
            }
            //passWord.matches("");//后端的正则
            if(passWord==null || userName==null || !userName1.equals(userName) || "".equals(userName) || passWord.length()>16 ||  passWord.length()<8){
                model.addAttribute(user);
                return "register";
            }else{
                userService.insertUser(user);
                return "redirect:login.do";
            }
        }
            return "redirect:register.do";
    }
//登录
    @RequestMapping("personalData1")
        public String personalData1(HttpServletResponse response,HttpServletRequest request,User user,String hobby,Model model){
        System.out.println("\n\n\n"+hobby+"\n\n\n");
        User user1=userService.selectUserByPassWord(user);
        HttpSession session=request.getSession();
        if(user1!=null){
            Cookie cookie1=new Cookie("userName",user1.getUserName());
            Cookie cookie2=new Cookie("passWord",user1.getPassWord());
            if("on".equals(hobby)){
                cookie1.setMaxAge(60*60*24*7);
                cookie2.setMaxAge(60*60*24*7);
            }else{
                cookie1.setMaxAge(0);
                cookie2.setMaxAge(0);
            }
            response.addCookie(cookie1);
            response.addCookie(cookie2);
        }else{
            return "redirect:login.do?login=f";
        }
            session.setAttribute("user",user1);
            List<ProductTypeListSp> productTypeList= ProductUtil.productUtil.selectProductByCsId();
            model.addAttribute("productType",productTypeList);
            return "personalData";
    }
    //个人信息页-保存功能-修改信息
    @RequestMapping("/save")
    public String save(User user,HttpServletRequest request){
        userService.updateUserInformation(user);
        HttpSession session = request.getSession();
        session.setAttribute("user",user);
        return "redirect:personalData.do";
    }
    @ResponseBody
    @RequestMapping("/ajaxlogin")
    public String ajaxlogin(User user,HttpServletResponse response,HttpServletRequest request){
        User user1=userService.selectUserByPassWord(user);
        HttpSession session=request.getSession();
        if(user1!=null){
            String encode="";
            session.setAttribute("user",user1);
            try {
                encode = URLEncoder.encode(user1.getUserName(), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return encode;

        }else{
            return "no";
        }
    }
    //退出登录
    @RequestMapping("/out")
    public String out(){
        session.invalidate();
        return "login";
    }
}
