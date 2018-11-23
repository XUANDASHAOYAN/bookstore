package cn.sc.controller;

import cn.sc.pojo.Reader;
import cn.sc.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by SONG on 2018/11/18.
 */
@Controller
@RequestMapping("")
public class registerController {

    @Autowired
    ReaderService readerService;

    @RequestMapping("registerVerify")
    public String registerVerify(Reader reader,HttpServletRequest request){
        Reader reader1 = readerService.getByName(reader.getName());
        if(reader1 != null){
            request.setAttribute("message","数据库中已存在该读者,请再次注册!");
            return "register";
        }else {
            readerService.add(reader);
            request.setAttribute("message","注册成功,请登录!");
            return "login";
        }
    }

}
