<?
$title=trim($_POST['title']);
$subtitle=trim($_POST['subtitle']);
$picture=trim($_POST['picture']);
$content=trim($_POST['content']);
$author=trim($_POST['author']);
$flid=trim($_POST['fl']);
if($title=="" or $subtitle=="" or $picture=="" or $content=="" or $author=="")
{
    echo "<script>location.href='add.php';</script>";
}
$conn=mysql_connect("127.0.0.1","root","1234");
if(!$conn)
{
    die("连接数据库失败！");
}
$result=mysql_select_db("zhq",$conn);
if(!$result)
{
    mysql_close($conn);
    die("指定数据库失败！");
}
$sql="set names utf8";
mysql_query($sql);
$sql="insert into t_news(title,subtitle,picture,content,author,flid) values('".$title."','".$subtitle."','".$picture."','".$content."','".$author."',".$flid.")";
//echo $sql;
$rs=mysql_query($sql);
if(!$rs)
{
    mysql_close($conn);
    die("新闻保存失败，请稍后再试！");
}
mysql_close($conn);
echo "insert success!";
?>