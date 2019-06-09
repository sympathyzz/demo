<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客后台</title>
<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function onMenuSelect(item){
	if($('#tt').tabs('exists',item.text)){
		$('#tt').tabs('select',item.text)
	}else{
		$('#tt').tabs('add',{
				title:item.text,
				content:'<iframe id="a" src="'+item.url+'" style="width: 100%;height: 100%; border: 0px"></iframe>',
				closable:true
				//href:item.url
		});
	}
}
//json 格式的菜单对象
var dt=[{
	text:'系统管理',
	iconCls:'icon-sum',
	state:'open',
	children:[{
		text:'博文管理',
		url:'articleMgr'
	},{
		text:'分类管理',
		url:'????'
	}]
}];
</script>
</head>
<body>
<div class="easyui-layout" style="width:700px;height:350px;" data-options="fit:true">
		<div data-options="region:'north'" style="height:50px;"></div>
		<div data-options="region:'south',split:true" style="height:50px;"></div>
		<div class="easyui-sidemenu" data-options="region:'west',split:true,data:dt,onSelect:onMenuSelect"
				title="菜单栏" style="width: 200px;"></div>
			<div class="easyui-tabs"  data-options="region:'center'" id="tt">
				<div title="首页"></div>
			</div>				
		</div>
</body>
</html>