<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>显示新闻</title>
</head>
<body>
<?
$id=$_GET['id'];
//连接MYSQL mysql_connect(ip,username,password)
$conn=mysql_connect("127.0.0.1","root","1234");
if(!$conn)
{
    die("连接数据库失败！");
}
//指定数据库mysql_select_db(database,connection)
$result=mysql_select_db("zhq",$conn);
if(!$result)
{
    mysql_close($conn);
    die("指定数据库失败！");
}
//设定字符集
$sql="set names utf8";
mysql_query($sql);
//记录点击次数
$sql="update t_news set clicks=clicks+1 where id=".$id;
$rs=mysql_query($sql);
//查询数据
$sql="select * from t_news where id=".$id;//sql
$rs=mysql_query($sql);//运行sql，把结果保存在变量$rs
if(!$rs)//如果运行不成功
{
    //关闭数据库
    mysql_close($conn);
    //显示出错信息，程序到此为止，不往下执行了
    die("查询数据失败！");
}
$recordcount=mysql_num_rows($rs);//得到sql运行返回的行数
if($recordcount>0)//如果有返回行
{
    //遍历每一行
    while($row=mysql_fetch_assoc($rs))//得到一行
    {
        $title=$row['title'];
        echo $title;
        echo "<br>";
        $author=$row['author'];
        echo $author;
        echo "<br>";
        $content=$row['content'];
        echo "<textarea rows=20 cols=80>";
        echo $content;
        echo "</textarea>";
    }
}
else
{
   
}
//关闭数据库
mysql_close($conn);
?>
</body>
</html>