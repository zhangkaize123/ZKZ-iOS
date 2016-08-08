<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>我赢新闻</title>
</head>
<body>
<table align="center" width="100%">
<tr><td>国内新闻</td><td align="right"><a href="add.php?fl=2">添加新闻</a></td></tr>
</table>
    <hr>
    <table border="1" align="center" width="70%">
        <tr><td align="center"><a href="index.php">新闻</a></td><td align="center"><a href="guonei.php">国内</a></td><td align="center"><a href="guoji.php">国际</a></td><td align="center"><a href="shehui.php">社会</a></td><td align="center"><a href="gongyi.php">公益</a></td></tr>
<?
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
$sql="set names utf8";
mysql_query($sql);
//查询数据
$sql="select * from t_news where flid=2";//sql
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
        echo "<tr><td align='right'>";
        echo "<img src='images/".$row['picture']."'>";
        echo "</td>";
        echo "<td colspan='4'><b>";
        echo $row['title'];
        echo "</b>";
        echo "<br>";
        echo $row['subtitle'];
        echo "<br>";
        echo $row['time'];
        echo "</td>";
        echo "</tr>";
    }
}
else
{
    echo "<tr><td colspan='5' align='center'>";
    echo "对不起！暂时还没有新闻！";
    echo "</td></tr>";
}
//关闭数据库
mysql_close($conn);

?>

    </table>
</body>
</html>