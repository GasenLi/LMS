<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/8/10
  Time: 14:54
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
    <link rel="stylesheet" type="text/css" href="../css/borrowRecord.css"/>
    <link rel="stylesheet" type="text/css" href="../css/sweetalert.css"/>

    <script type="text/javascript">
        $(document).ready(function(){
            $.ajax({
                type : "post",
                url : ".././record.do",
                dataType : "text",
                success : function(data) {
                    data = eval(data);
                    //构造前先清空源节点
                    document.getElementById("data").innerHTML = '';
                    //设置一个文件碎片
                    var frag = document.createDocumentFragment();
                    //这是表头
                    var tr = document.createElement("tr");
                    tr.innerHTML = "<td>bookname</td><td>borrow</td><td>UserID</td>";
                    frag.appendChild(tr);
                    //利用循环构造表格的每一行，把其放在文件碎片上面
                    for (var i = 0; i < data.length; i++) {
                        tr = document.createElement("tr");
                        tr.innerHTML = "<td>" + data[i].bookname+ "</td>" +
                            "<td>" + data[i].borrow + "</td>" +
                            "<td>" + data[i].UserID + "</td>";
                        frag.appendChild(tr);
                    }
                    //此时文件碎片已经是一张表了，直接放网页就可以了
                    document.getElementById("data").appendChild(frag);
                },
                error : function() {
                    alert("出错了");
                }
            });

                //返回按钮事件
                $("#returnButton").click(function () {
                    self.location = 'administrator.jsp';
                });
        })
    </script>
<head>
    <title>借书信息查询</title>
</head>
<body>
        <div id="box" align="center">
            <h1>借书记录汇总</h1>
            <table class="table table-striped" border="3" id="data" style="width:600px;"></table>

            <div class="form-group">
                <button type="button" style="margin-right: 40px" class="btn btn-default" id="returnButton">返回</button>
            </div>
        </div>
</body>
</html>
