package com.Icode.entity;

public class Record extends Entity{
    private String UserID;
    private String bookname;
    private int borrow;

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public int getBorrow() {
        return borrow;
    }

    public void setBorrow(int borrow) {
        this.borrow = borrow;
    }

    public String getTableName() {
        return "record";
    }

    public String getPrimaryKey() {
        return "ID";
    }
}
