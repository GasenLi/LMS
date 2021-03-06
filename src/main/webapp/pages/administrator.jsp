<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>管理员界面</title>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-form.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/sweetalert-dev.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/administrator.css"/>
    <link rel="stylesheet" type="text/css" href="../css/sweetalert.css"/>

    <script type="text/javascript">
        $(document).ready(function(){
            //信息按钮事件
            $("#bookButton").click(function(){
                /*self.location='memberInfor.jsp';*/
            });

            //退出按钮事件
            $("#quitButton").click(function(){
                self.location='../login.html';
            });

            //借书按钮事件
            $("#recordButton").click(function(){
                self.location='borrowRecord.jsp';
            });
        })
    </script>
</head>
<body>
        <%

            String loginUser="";
            if(session.getAttribute("LOGINNAME")!=null){
                loginUser=session.getAttribute("LOGINNAME").toString();
            }

        %>

        <div >
            <font color="yellow"> <h1 id="position" align="center" >欢迎您<%=loginUser%></h1> </font>
        </div>

        <div class="choose">
            <div class="form-group">
                <button type="button" style="margin-right: 40px" class="btn btn-default" id="bookButton">图书信息管理</button>
                <button type="button" style="width: 110px;" class="btn btn-default" id="accountButton">人员管理</button></br>
                <div style="height: 50px"></div>
                <button type="button" style="margin-right: 40px;width: 110px;" class="btn btn-default" id="recordButton">借书信息查询</button>
                <button type="button" style="width: 110px;" class="btn btn-default" id="quitButton">退出</button>
            </div>
        </div>
</body>
</html>