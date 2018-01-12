package com.Icode.AccountManage.service;

import com.Icode.dao.BaseEntityDao;
import com.Icode.dao.SearchDao;
import com.Icode.entity.Account;
import com.Icode.entity.Book;
import com.Icode.entity.Record;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class InforService implements IInforService{
    @Resource(name = "baseEntityDao")
    private BaseEntityDao dao;
    @Resource(name = "searchDao")
    private SearchDao searchDao;

    public Book getBookByName(String bookname){
        String condition = " bookname = '" + bookname + "' ";
        List<Map<String, Object>> list = dao.getByCondition(condition, "book");

        Map<String, Object> map = list.get(0);
        Book book=new Book();
        book.setBookname(map.get("bookname").toString());
        book.setAllNum(Integer.parseInt(map.get("allNum").toString()));
        book.setLeftNum(Integer.parseInt(map.get("leftNum").toString()));
        book.setType(map.get("type").toString());

        return book;
    }

    public Record getRecordByUserIDandBookname(String UserID,String bookname) {
        String condition ="bookname ='" + bookname +"' and UserID ='"+ UserID +"' ";
        List<Map<String, Object>> list = dao.getByCondition(condition, "record");

        Record record = new Record();
        if (list == null || list.size() == 0) {
            return null;
        } else {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> map = list.get(i);

                record.setBookname(map.get("bookname").toString());
                record.setBorrow(Integer.parseInt(map.get("borrow").toString()));
                record.setUserID(map.get("UserID").toString());
            }
        }
        return record;
    }

    public List<Map<String, Object>> Infor(String UserID) {
        String condition = " UserID = '" + UserID + "' ";
        List<Map<String, Object>> list = dao.getByCondition(condition, "record");

       /* ArrayList<Record> list2 =new ArrayList<Record>();

        if (list == null || list.size() == 0) {
            return null;
        } else {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> map = list.get(i);
                list2.add(new Record());
                list2.get(i).setBookname(map.get("bookname").toString());
                list2.get(i).setBorrow(map.get("borrow").toString());
                list2.get(i).setUserID(map.get("UserID").toString());
            }
        }*/
        return list;
    }

    public List<Map<String, Object>> Search(String bookname,HttpServletResponse response,HttpServletRequest request) {
        String condition = " bookname = '" + bookname + "' ";
        List<Map<String, Object>> list = dao.getByCondition(condition, "book");

        Book book=getBookByName(bookname);
        HttpSession session = request.getSession();
        session.setAttribute("BOOKNAME",book.getBookname());
        session.setAttribute("ALLNUM",book.getAllNum());
        session.setAttribute("LEFTNUM",book.getLeftNum());

        return list;
    }

    public int borrow(String bookname,HttpServletResponse response,HttpServletRequest request) {
        try{

            // 更新库存信息
            String condition = " bookname = '" + bookname + "' ";
            Book book=getBookByName(bookname);

            int left=book.getLeftNum();

            book.setLeftNum(left-1);
            dao.updatePropByCondition(book,condition);

            // 更新用户信息
            HttpSession session = request.getSession();
            String UserID = (String) session.getAttribute("USERID");
            String condition2 ="bookname ='" + bookname +"' and UserID ='"+ UserID +"' ";
            Record record=getRecordByUserIDandBookname(UserID,bookname);
            if(record.getUserID()!=null){
                int borrow=record.getBorrow();

                record.setBorrow(borrow+1);
                dao.updatePropByCondition(record,condition2);
            }else{
                Record record2=new Record();
                record2.setBorrow(1);
                record2.setUserID(UserID);
                record2.setBookname(bookname);

                dao.save(record2);
            }
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public List<Map<String, Object>> record() {
        String condition = " ";
        List<Map<String, Object>> list = dao.getByCondition(condition, "record");

        return list;
    }

}