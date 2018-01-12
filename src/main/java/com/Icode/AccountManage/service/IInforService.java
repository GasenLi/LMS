package com.Icode.AccountManage.service;

import com.Icode.entity.Record;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface IInforService {
    List<Map<String, Object>> Infor(String UserID);
    List<Map<String, Object>> Search(String bookname,HttpServletResponse response, HttpServletRequest request);
    List<Map<String, Object>> record();
    int borrow(String bookname,HttpServletResponse response,HttpServletRequest request);
}
