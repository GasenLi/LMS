package com.Icode.AccountManage.controller;

import com.Icode.AccountManage.service.IInforService;
import net.sf.json.JSONArray;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class ChangeController {
    @Resource
    IInforService service;

    @RequestMapping(value="/borrow",method= RequestMethod.POST)
    @ResponseBody
    public String borrow(String bookname, HttpServletResponse response, HttpServletRequest request){
        return service.borrow(bookname,response,request)+"";
    }
}
