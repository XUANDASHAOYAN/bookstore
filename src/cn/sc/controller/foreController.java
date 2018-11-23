package cn.sc.controller;

import cn.sc.pojo.Admin;
import cn.sc.pojo.Reader;
import cn.sc.service.AdminService;
import cn.sc.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by SONG on 2018/11/20.
 */
@Controller
@RequestMapping("")
public class foreController {
    @Autowired
    AdminService adminService;
    @Autowired
    ReaderService readerService;

    @RequestMapping("foreLogin")
    public String foreLogin(){
        return "login";
    }

    @RequestMapping("foreRegister")
    public String foreRegister(){
        return "register";
    }

    @RequestMapping("foreHome")
    public String foreHome(){
        return "home";
    }

    @RequestMapping("edit_pwd")
    public String edit_pwd(HttpServletRequest request){
        return "editPwd";
    }

    @RequestMapping("updatePWD")
    public String updatePWD(String action, String name, String oldPWD, String newPWD, HttpServletRequest request){
        if (action.equals("goback")){
            return "redirect: foreHome";
        }else {
            if (name.equals("admin") || name.equals("whpu")){
                Admin admin =  adminService.getByName(name);
                if (admin.getPassword().equals(oldPWD)){
                    admin.setPassword(newPWD);
                    adminService.update(admin);
                    request.getSession().removeAttribute("name");
                    request.getSession().setAttribute("message","密码修改完成,请重新登录");
                    return "redirect: foreLogin";
                }else {
                    request.setAttribute("message","旧密码错误,请重新输入");
                    return "editPwd";
                }
            }else {
               Reader reader = readerService.getByName(name);
               if (reader.getPassword().equals(oldPWD)){
                    reader.setPassword(newPWD);
                    readerService.updatePWD(reader);
                    request.getSession().removeAttribute("name");
                    request.getSession().setAttribute("message","密码修改完成,请重新登录");
                    return "redirect: foreLogin";
               }else {
                    request.setAttribute("message","旧密码错误,请重新输入");
                    return "editPwd";
               }
            }
        }
    }

    @RequestMapping("exit")
    public String exit(HttpServletRequest request){
        request.getSession().removeAttribute("name");
        return "redirect: foreHome";
    }
}
