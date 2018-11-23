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
 * Created by SONG on 2018/11/17.
 */
@Controller
@RequestMapping("")
public class loginController {
    @Autowired
    AdminService adminService;

    @Autowired
    ReaderService readerService;

    @RequestMapping("loginVerify")
    public String loginVerify(String name, String password, HttpServletRequest request){
        if("login".equals(request.getParameter("action"))){
            String identity = request.getParameter("identity");
            if ("reader".equals(identity)) {
                Reader reader = readerService.getByName(name);
                if (null != reader){
                    if (password.equals(reader.getPassword())){
                        request.getSession().setAttribute("name",name);
                        return "home";
                    }else {
                        request.setAttribute("message","密码错误");
                        return "login";
                    }
                }else {
                    request.setAttribute("message","数据库中不存在该读者");
                    return "login";
                }

            }else {
                Admin admin = adminService.getByName(name);
                if (null != admin){
                    if (password.equals(admin.getPassword())){
                        request.getSession().setAttribute("name",name);
                        return "home";
                    }else {
                        request.setAttribute("message","密码错误");
                        return "login";
                    }
                }else {
                    request.setAttribute("message","数据库中不存在该管理员");
                    return "login";
                }
            }
        }else {
            return "redirect: foreRegister";
        }
    }

}
