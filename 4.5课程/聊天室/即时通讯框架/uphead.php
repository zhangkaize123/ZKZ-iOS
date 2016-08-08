<form action="" enctype="multipart/form-data" method="post">
    name="uploadfile">上传文件:<input type="file" name="upfile"/><br>
    <input type="submit" value="上传"/>
</form>
<?php
    if(is_uploaded_file($_FILES['upfile']['tmp_name']))
    {
        $upfile=$_FILES["upfile"];
        //获取数组里边的值
        $name=$upfile["name"];//上传文件的文件名
        $type=$upfile["type"];//上传文件类型
        $size=$upfile["size"];//上传文件的大小
        $tmp_name=$upfile["tmp_name"];//上传文件的临时存放路径
        //判断是否为图片
        switch($type){
            case 'image/pjpeg':$okType=type;
                break;
            case 'image/jpeg':$okType=type;
                break;
            case 'image/gif':$okType=type;
                break;
            case 'image/png':$okType=type;
                break;
                
        }
        if($okType){
//            0:文件上传成功</br>
//            1:超过了文件大小，在php.ini文件中设置
//            2:超过了文件MAX_FILE_SIZE选项制定的值
//            3:文件只有部分被上传
//            4:没有文件上传
//            5:上传文件为0
            $error=$upfile["error"];//上传后系统返回的值
            echo "________________<br/>";
            echo "上传文件名称是:".$name."<br/>";
            echo "上传文件类型是:".$type."<br/>";
            echo "上传文件大小是:".$size."<br/>"
            echo "上传后系统返回的值是:".$error."<br/>";
            echo "上传文件的临时存放路径是:".$tmp_name."<br/>";
            echo "开始移动上传文件<br/>";
            //把上传的临时文件移动到up目录下边
            move_uploaded_file($tmp_name,'up/'.$name);
            $destination="up/".$name;
            echo "----------------<br/>"
            echo "上传信息:<br/>";
            if($error==0){
                echo "文件上传成功！";
                echo "<br>图片预览:<br>";
                echo "img scr=".$destination.">";
            }elseif($error==1){
                echo "超过了文件大小,在php.ini文件中设置";
            }elseif($error==2){
                echo "超过了文件的大小MAX_FILE_SIZE选项指定值";
            }elseif($error==3){
                echo "文件只有部分被上传";
            }elseif($error==4){
                echo "没有文件被上传";
            }else{
                echo "上传文件大小为0";
            }
        }else{
            echo "请上传jpg,gif,png等格式的图片"
        }
        
    }
?>