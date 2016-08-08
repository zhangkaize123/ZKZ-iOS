<?
$fl=$_GET['fl'];
?>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>添加新闻</title>
</head>
<body>
<center>添加新闻</center>
    <hr>
<form action="action.php" name="newsForm" method="post">
    <table border="1" align="center" width="70%">
        <tr><td>大标题</td><td><input name="title" size="40"></td></tr>
    <tr><td>小标题</td><td><input name="subtitle" size="40"></td></tr>
    <tr><td>图片名</td><td><input name="picture" size="40"></td></tr>
    <tr><td>内容</td><td><textarea rows="5" cols="60" name="content"></textarea></td></tr>
    <tr><td>出处</td><td><input name="author" size="40"></td></tr>
    <tr><td colspan="2" align="center"><input type="submit" value="提   交"></td></tr>
    </table>
<input type="hidden" value="<?echo $fl?>" name="fl">
</form>
</body>
</html>