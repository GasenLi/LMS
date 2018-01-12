<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>memberInfor</title>



    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-form.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/sweetalert-dev.js"></script>

    <script type="text/javascript">

        var id = <%= session.getAttribute("USERID").toString()%>

          $(document).ready(function() {
                $.ajax({
                    type : "post",
                    url : ".././infor.do",
                    data: {"UserID" : id},
                    dataType : "text",
                    success : function(data) {
                        data = eval(data);
                        //构造前先清空源节点
                        document.getElementById("data").innerHTML = '';
                        //设置一个文件碎片
                        var frag = document.createDocumentFragment();
                        //这是表头
                        var tr = document.createElement("tr");
                        tr.innerHTML = "<td>bookname</td><td>borrow</td>";
                        frag.appendChild(tr);
                        //利用循环构造表格的每一行，把其放在文件碎片上面
                        for (var i = 0; i < data.length; i++) {
                            tr = document.createElement("tr");
                            tr.innerHTML = "<td>" + data[i].bookname+ "</td>" + "<td>"
                            + data[i].borrow + "</td>" ;
                            frag.appendChild(tr);
                        }
                        //此时文件碎片已经是一张表了，直接放网页就可以了
                        document.getElementById("data").appendChild(frag);
                            },
                            error : function() {
                                alert("出错了");
                            }

                        });


              $(document).ready(function(){
                  //返回按钮事件
                  $("#returnButton").click(function(){
                  self.location='member.jsp';
              });

              //还书按钮事件
                  $("#quitButton").click(function(){
                  /*self.location='../login.html';*/
                  });
              })
            })
  </script>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/memberInfor.css"/>
    <link rel="stylesheet" type="text/css" href="../css/sweetalert.css"/>
</head>
<body>
      <div id="o" class="container">
          <div id="back" align="center" >
              <h1>你的图书信息</h1>
              <div class="x">
                  <table class="table table-striped"  id="data" border="3" style="width:600px;"></table>
              </div>

              <div style="height: 20px"></div>

              <div class="form-group">
                  <button type="button" style="margin-right: 40px" class="btn btn-default" id="returnButton">返回</button>

                  <button type="button" class="btn btn-default" id="registerButton">还书</button>
              </div>
          </div>
      </div>
</body>
</html>