<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/8/9
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>会员界面</title>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-form.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/sweetalert-dev.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/borrow.css"/>
    <link rel="stylesheet" type="text/css" href="../css/sweetalert.css"/>

    <script type="text/javascript">

        $(document).ready(function(){
            //查询按钮事件
            $("#searchButton").click(function(){
                $("#search").slideToggle("slow");


                $("#searchForm").ajaxSubmit({
                    type : "post",
                    url : ".././search.do",
                    dataType : "json",
                    success : function(data) {
                        data = eval(data);
                        //构造前先清空源节点
                        document.getElementById("data").innerHTML = "";
                        //设置一个文件碎片
                        var frag = document.createDocumentFragment();
                        //这是表头
                        var tr = document.createElement("tr");
                        tr.innerHTML = "<td>bookname</td><td>allNum</td><td>leftNum</td>";
                        frag.appendChild(tr);
                        //利用循环构造表格的每一行，把其放在文件碎片上面
                        for (var i = 0; i < data.length; i++) {
                            tr = document.createElement("tr");
                            tr.innerHTML = "<td>" + data[i].bookname+ "</td>" + "<td>"
                                + data[i].allNum + "</td>" +"<td>" + data[i].leftNum+ "</td>";
                            frag.appendChild(tr);
                        }
                        //此时文件碎片已经是一张表了，直接放网页就可以了
                        document.getElementById("data").appendChild(frag);

                    },
                    error : function() {
                        alert("出错了");
                    }

                });
            });

            //返回按钮事件
            $("#returnButton").click(function(){
                self.location='member.jsp';
            });

            //借书按钮事件
            $("#borrowButton").click(function(){
                $("#searchForm").ajaxSubmit({
                    type : "post",
                    url : ".././borrow.do",
                    dataType : "json",
                    success : function(data) {
                        if(data=='1'){
                            swal({
                                title: "借书成功",
                                text: "5秒后自动消失",
                                timer: 5000,
                                type:"success",
                                showConfirmButton: true
                            });
                        }else{
                            swal({
                                title: "借书失败",
                                text: "5秒后自动消失",
                                timer: 5000,
                                type:"error",
                                showConfirmButton: true
                            });
                        }
                    },
                    error : function() {
                        alert("出错了");
                    }

                });
            });
        })
    </script>
</head>
<body>
      <div id="box" align="center">
            <h1>借书系统</h1>
              <form class="form-horizontal" id="searchForm" method="post ">
                        <div class="form-group" style="margin-top: 20px">
                            <input type="text" style="width: 400px;" class="form-control" id="book" name="bookname" placeholder="请输入书名">
                        </div>
                        <div class="form-group">
                            <button type="button" style="margin-right: 40px" class="btn btn-default" id="returnButton">返回</button>

                            <button type="button" class="btn btn-default" id="searchButton">查询</button>
                        </div>
              </form>
            <div id="search">
                <table class="table table-hover" id="data"></table>
                <button type="button" style="margin-right: 40px" class="btn btn-default" id="borrowButton">借书</button>
            </div>
      </div>

      <script type="text/javascript">

      </script>
</body>
</html>
