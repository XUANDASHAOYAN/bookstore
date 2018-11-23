package cn.sc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by SONG on 2018/11/17.
 */
@Controller
@RequestMapping("")
public class testController {

    @RequestMapping("/home")
    public String home(){
        return "home";
    }
}
