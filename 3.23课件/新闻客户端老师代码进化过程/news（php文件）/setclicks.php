<?
$id=$_GET[id];
//连接MYSQL mysql_connect(ip,username,password)
$conn=mysql_connect("127.0.0.1","root","1234");
if(!$conn)
{
    die("error");
}
//指定数据库mysql_select_db(database,connection)
$result=mysql_select_db("zhq",$conn);
if(!$result)
{
    mysql_close($conn);
    die("error");
}
$sql="set names utf8";
mysql_query($sql);
//查询数据
$sql="update t_news set clicks=clicks+1 where idid=".$id;//sql
$rs=mysql_query($sql);//运行sql，把结果保存在变量$rs
if(!$rs)//如果运行不成功
{
    //关闭数据库
    mysql_close($conn);
    //显示出错信息，程序到此为止，不往下执行了
    die("error");
}
else
{
    echo("success");
}
//关闭数据库
mysql_close($conn);
?>
