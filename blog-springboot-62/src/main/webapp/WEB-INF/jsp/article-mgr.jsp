<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客后台</title>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<style type="text/css">
		#ff  *{
				margin-top: 5px
		}
</style>
<script type="text/javascript">
		function query(){
			$('#dg').datagrid('load',{
					author:$("#author").val(),
					title:$("#title").val(),
					label:$("#label").val()
			});
		}
		function openEdit(){
			$('#ff').form('clear');
			CKEDITOR.instances.content.setData('');
			$('#ti').attr("src","/images/uploadimg.jpg");
			$('#dlg').dialog('open');
		}
		function save(){
			$('#ff').form('submit',{
				url:"article/save",
				onSubmit:function(){
					//扩展参数;
				},
				success:function(data){		//不是json 对象 而是json 字符串
					data=JSON.parse(data);
					//console.info(data);
					alert(data.msg);
					if(data.code==1){
						$('#dg').datagrid('reload');
						$('#dlg').dialog('close');
					}else{
						for(var i=0;i<data.data.length;i++){
							alert(data.data[i].defaultMessage);
						}
					}
				}
			});
		}
		//列格式化函数
		function fmtop(value,row,index){
			//row==>json字符串
			//方式一转json会出问题
			//var json=JSON.stringify(row);
			//return '<input type="button" value="修改" onclick=\'modify('+json+')\'>';
			return '<input type="button" value="修改" onclick=\'modify('+index+')\'>';
		}
		
		function fmtimgs(value,row,index){
			return "<img src='"+value+"',height='50px'>";
		}
		
		function modify(index){
			var row =$('#dg').datagrid('getRows')[index];
			
			if(row.titleimgs){
				$('#ti').attr("src",row.titleimgs);
			}else{
				$('#ti').attr("src","/images/uploadimg.jpg");
			}			
			$('#ff').form('load',row);
			//设置富文本编辑器的内容
			CKEDITOR.instances.content.setData(row.content);
			$('#dlg').dialog('open');
		}
		
		function upload(){			
			$.ajax({
		        url: "/article/upload",
		        type: 'POST',
		        cache: false,
		        data: new FormData($('#ff')[0]),
		        processData: false,
		        contentType: false,
		        dataType:"json",
		        success : function(data) {
		            if (data.code == 1) {
		                $("#ti").attr("src", data.data);
		                $("#titleImgs").val(data.data);
		                $.messager.show({
		                	title:'系统提示',
		                	msg:data.msg,
		                	timeout:2000,
		                	showType:'slide'
		                });
		            } else {
		                $messager.alert('系统提示',data.msg,'error');
		            }
		        }
		    });
		}
		
</script>
</head>
<body>
		<table class="easyui-datagrid" id="dg"
				data-options="
				fitColumns:true,
				singleSelect:true,
				fit:true,
				pagination:true,
				pageSize:5,
				pageList:[5,10,20],
				url:'article/query',
				rownumbers:true,
				toolbar:'#tb'">
				<thead>
						<tr>
								<th data-options="field:'title',width:100">标题</th>
								<th data-options="field:'author',width:100">作者</th>
								<th data-options="field:'titleimgs',width:100,formatter:fmtimgs">图片</th>
								<th data-options="field:'id',width:100,formatter:fmtop">操作</th>
						</tr>
				</thead>
				</table>	
				
				<div id="tb" style="padding: 5px;height: auto">
						<div>
								作者：<input class="easyui-textbox" style="width: 80px" id="author">
								标题：<input class="easyui-textbox" style="width: 80px" id="title">
								标签：<input class="easyui-textbox" style="width: 80px" id="label">
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="openEdit()">添加</a>
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="query()">查询</a>
						</div>
				</div>
				
				<div id="dlg" class="easyui-dialog" title="博文编辑" 
				style="width:600px;height:400px;padding:10px"
			data-options="
				iconCls: 'icon-save',
				toolbar: [{
					text:'保存',
					iconCls:'icon-ok',
					handler:function(){
						save();
					}
				},'-',{
					text:'取消',
					handler:function(){
						$('#dlg').dialog('close');
					}
				}],
				closed:true,
				modal:true
			">
		<form id="ff" method="post" style="text-align: center;">
				<input type="hidden" name="id" id="id">
				
						<!-- ajax 文件上传，需要使用3个控件 -->
						<img height="70px" id="ti" src="/images/uploadimg.jpg" alt="点击上传图片" onclick="file.click()"
						style="display: inline-block;float: right;border: 1px solid #666;margin: 7px 15px ">
						<input type="hidden" name="titleimgs" id="titleImgs">
						<input type="file" name="file" style="display: none;" id="file" onchange="upload()">
						
						<input class="easyui-textbox" name="title" data-options="
						label:'标题',width:400
						"><br>
						<input class="easyui-textbox" name="author" data-options="
						label:'作者',width:400
						"><br>
						<textarea rows="5" cols="20" name="content" id="content"></textarea>
						<script >
								CKEDITOR.replace('content',{
									height:260,
									weight:550
								});
						</script> 
		</form>
	</div>
				
</body>  
</html>
