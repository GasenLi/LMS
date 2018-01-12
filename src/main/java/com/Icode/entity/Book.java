package com.Icode.entity;

public class Book extends Entity{
    private String bookname;
    private int allNum;
    private int leftNum;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        type = type;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public int getAllNum() {
        return allNum;
    }

    public void setAllNum(int allNum) {
        this.allNum = allNum;
    }

    public int getLeftNum() {
        return leftNum;
    }

    public void setLeftNum(int leftNum) {
        this.leftNum = leftNum;
    }



    public String getTableName() {
        return "book";
    }

    public String getPrimaryKey() {
        return "ID";
    }
}
