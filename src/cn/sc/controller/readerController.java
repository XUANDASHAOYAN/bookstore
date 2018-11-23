package cn.sc.controller;

import cn.sc.pojo.Reader;
import cn.sc.service.AdminService;
import cn.sc.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by SONG on 2018/11/21.
 */
@Controller
@RequestMapping
public class readerController {

    @Autowired
    ReaderService readerService;

    @Autowired
    AdminService adminService;

    @RequestMapping("showMyInfo")
    public String showMyInfo(HttpServletRequest request){
        Reader reader = readerService.getByName(request.getParameter("name"));
        request.setAttribute("reader",reader);
        return "showMyInfo";
    }

    @RequestMapping("editReader")
    public String editReader(String action,Reader reader,HttpServletRequest request){
        if (action.equals("goback")){
            return "redirect: foreHome";
        }else {
            readerService.update(reader);
            request.setAttribute("message","读者信息更新成功!");
            return "showMyInfo";
        }
    }

}
