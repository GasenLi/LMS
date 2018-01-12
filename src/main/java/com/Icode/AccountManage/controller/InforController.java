package com.Icode.AccountManage.controller;

import com.Icode.AccountManage.service.IAccountService;
import com.Icode.AccountManage.service.IInforService;
import com.Icode.entity.Record;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

@RestController
public class InforController {
    @Resource
    IInforService service;

    @RequestMapping(value="/infor",method= RequestMethod.POST)
    @ResponseBody
    public String infor(String UserID){
        return JSONArray.fromObject(service.Infor( UserID)).toString();
    }


    @RequestMapping(value="/search",method= RequestMethod.POST)
    @ResponseBody
    public String search(String bookname, HttpServletResponse response, HttpServletRequest request){
        return JSONArray.fromObject(service.Search(bookname,response,request)).toString();
    }


    @RequestMapping(value="/record",method= RequestMethod.POST)
    @ResponseBody
    public String record(){
        return JSONArray.fromObject(service.record()).toString();
    }

}