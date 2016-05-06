<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>springmvc 文件上传</title>
<script type="text/javascript" src="res/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="uploadify/jquery.uploadify.js"></script>
<link  type="text/css" rel="stylesheet" href="uploadify/css/uploadify.css">
</head>
<body>
	
	<table>
        <tr>
            <td><label>图片上传：</label></td>
            <td>
            	<label><input type="file" name="uploadify" id="uploadify"/></label>&nbsp;&nbsp;
            </td>
            <td><div id="fileQueue"></div></td>
        </tr>
        <tr>
            <td></td>
            <td>
            </td>
            <td>
            	<input type="button" name="uploadBtn" value="上传文件" onclick="javascript:$('#uploadify').uploadify('upload', '*');" />
            	<input type="button" name="uploadBtn" value="停止上传" onclick="javascript:$('#uploadify').uploadify('stop');" />
            </td>
        </tr>
   </table>
	
</body>
<script type="text/javascript">
$(document).ready(function(){
	 $("#uploadify").uploadify({
		 'auto': false,  //表示是否支自动上传
         'swf': '${pageContext.request.contextPath}/uploadify/uploadify.swf', //使用swf文件处理
         'uploader':'${pageContext.request.contextPath}/upload/uploadImage.html',  //文件接收者
         'queueID': 'fileQueue', //表示上传队列
         'multi' : 5,   //同时支持5个文件上传
         'queueSizeLimit' : 5, //队列中可以有5个上传信息
         'buttonText': '请选择上传图片',  // 按钮上显示的文字
         'multi'   : true, 
         'method': 'post',
         'fileObjName'   : 'file',  //参数名称
         'formData': { 'uploadLocation': 'user' },//这里只能传静态参数  
         'fileSizeLimit': '100MB',  //单个文件大小
         'fileTypeDesc':"请选择图片文件",  
         'fileTypeExts': '*.jpg;*.gif;*.jpeg;*.png;*.bmp;',
         onUploadSuccess : function (data){
        	 alert(data.name);
         },
         onUploadError: function(event, queueID, fileObj) {
             alert("文件:" + fileObj.name + "上传失败");
         }
     });
	
});

</script>
</html>