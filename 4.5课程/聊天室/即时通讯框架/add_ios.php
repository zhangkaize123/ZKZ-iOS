  <?
$userid=$_GET['userid'];//登录的账号
$classname=$_GET['classname'];//班级的名字
$conn=mysql_connect("127.0.0.1","root","zkz");//zkz 为连接数据库的密码
if(!$conn)
{
    die("error");
}
$result=mysql_select_db("zkz",$conn);//zkz为数据库的名字 在这里为 zhangkz
if(!$result)
{
    mysql_close($conn);
    die("error");
}
mysql_query("set names utf8");
//$sql="select *from t_class where userid='".$userid."' and name='".$classname."'";
//$rs=mysql_query($sql);
//$rows=mysql_num_rows($rs);
//if($rows>0)
//{
//    echo("exist");
//}else{
    $s="insert into t_class (userid,name) values ('".$userid."','".$classname."')";//t_class为表格的名字  在这里为ofUser表格
    $result=mysql_query($s);
    if($result)
    {
        //echo("success");
        //$sq="select * from t_class";
        //$sq="select max(id) from t_class";
        //select * from t_class where id = (SELECT MAX(id) from t_class);
        $sq="select * from t_class where id=(select max(id) from t_class)";
        $rs=mysql_query($sq);
        while($row=mysql_fetch_assoc($rs))
        {
            $arr[]=$row;
        }
        echo json_encode($arr);//在这里返回的是用户名的信息
        
    }else{
        echo("error1");
    }
//}


?>