<%@page import="com.yc.blog.bean.Article"%>
<%@page import="com.yc.blog.util.Utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>异清轩博客</title>
<%@include file="common/links.jsp" %>
</head>
<body class="user-select">
<%@include file="common/header.jsp" %>
<section class="container">
  <div class="content-wrap">
    <div class="content">
      <div class="jumbotron">
        <h1>欢迎访问异清轩博客</h1>
        <p>在这里可以看到前端技术，后端程序，网站内容管理系统等文章，还有我的程序人生！</p>
      </div>
      <div id="focusslide" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#focusslide" data-slide-to="0" class="active"></li>
          <li data-target="#focusslide" data-slide-to="1"></li>
          <li data-target="#focusslide" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active"> <a href="" target="_blank"><img src="images/banner/banner_01.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
          <div class="item"> <a href="" target="_blank"><img src="images/banner/banner_02.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
          <div class="item"> <a href="" target="_blank"><img src="images/banner/banner_03.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
        </div>
        <a class="left carousel-control" href="#focusslide" role="button" data-slide="prev" rel="nofollow"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">上一个</span> </a> <a class="right carousel-control" href="#focusslide" role="button" data-slide="next" rel="nofollow"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">下一个</span> </a> </div>
      <article class="excerpt-minic excerpt-minic-index">
        <h2><span class="red">【今日推荐】</span><a href="" title="">${todayArticle.title }</a></h2>
        <p class="note">${todayArticle.content.length()>150 ?  todayArticle.content.substring(0,150) : todayArticle.content }</p>
      </article>
      <div class="title">
        <h3>最新发布</h3>
        <div class="more"><a href="">PHP</a><a href="">JavaScript</a><a href="">EmpireCMS</a><a href="">Apache</a><a href="">MySQL</a></div>
      </div>
      <c:forEach items="${newList }" var="a">
      		<article class="excerpt excerpt-1">
      		<a class="focus" href="article?id=${a.id }" title="">
      		<img class="thumb" data-original="${a.titleimgs == null ? 'images/excerpt.jpg' : a.titleimgs}"
      		 src="${a.titleimgs == null ? 'images/excerpt.jpg' : a.titleimgs}" alt="">
      		</a>
        		<header><a class="cat" href="program">${a.categoryid }   以后要改成分类名<i></i></a>
          			<h2><a href="article?id=${a.id }" title="">${a.title }</a></h2>
        		</header>
        		<p class="meta">
          			<time class="time"><i class="glyphicon glyphicon-time"></i>${a.createtime }</time>
          			<span class="views"><i class="glyphicon glyphicon-eye-open"></i> 共${a.readcnt }次围观</span> <a class="comment" href="article?id=${a.id }#comment"><i class="glyphicon glyphicon-comment"></i> 0个不明物体</a></p>
        			<% Article a=(Article)pageContext.getAttribute("a"); %>
        		<p class="note"> <%= Utils.subTag(a.getContent()).substring(0,100)  %> </p>
      		</article>
      </c:forEach>
      
      
      <!-- 滚动翻页 -->
      <nav class="pagination" style="display: none;">
        <ul>
          <li class="prev-page"></li>
          <li class="active"><span>1</span></li>
          <li><a href="?page=2">2</a></li>
          <li class="next-page"><a href="?page=2">下一页</a></li>
          <li><span>共 2 页</span></li>
        </ul>
      </nav>
    </div>
  </div>
  <aside class="sidebar">
    <div class="fixed">
      <div class="widget widget-tabs">
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab">网站公告</a></li>
          <li role="presentation"><a href="#centre" aria-controls="centre" role="tab" data-toggle="tab">会员中心</a></li>
          <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系站长</a></li>
        </ul>
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane notice active" id="notice">
            <ul>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a href="" target="_blank">欢迎访问异清轩博客</a></li>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a target="_blank" href="">在这里可以看到前端技术，后端程序，网站内容管理系统等文章，还有我的程序人生！</a></li>
              <li>
                <time datetime="2016-01-04">01-04</time>
                <a target="_blank" href="">在这个小工具中最多可以调用五条</a></li>
            </ul>
          </div>
          <div role="tabpanel" class="tab-pane centre" id="centre">
            <h4>需要登录才能进入会员中心</h4>
            <p> <a data-toggle="modal" data-target="#loginModal" class="btn btn-primary">立即登录</a> <a href="javascript:;" class="btn btn-default">现在注册</a> </p>
          </div>
          <div role="tabpanel" class="tab-pane contact" id="contact">
            <h2>Email:<br />
              <a href="mailto:admin@ylsat.com" data-toggle="tooltip" data-placement="bottom" title="admin@ylsat.com">admin@ylsat.com</a></h2>
          </div>
        </div>
      </div>
      <div class="widget widget_search">
        <form class="navbar-form" action="/Search" method="post">
          <div class="input-group">
            <input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
    <div class="widget widget_sentence">
      <h3>每日一句</h3>
      <div class="widget-sentence-content">
        <h4>2016年01月05日星期二</h4>
        <p>Do not let what you cannot do interfere with what you can do.<br />
          别让你不能做的事妨碍到你能做的事。（John Wooden）</p>
      </div>
    </div>
    <div class="widget widget_hot">
      <h3>热门文章</h3>
      <ul>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
        <li><a href=""><span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="images/excerpt.jpg" alt=""></span><span class="text">php如何判断一个日期的格式是否正确</span><span class="muted"><i class="glyphicon glyphicon-time"></i> 2016-1-4 </span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i> 120</span></a></li>
      </ul>
    </div>
  </aside>
</section>
<footer class="footer">
  <div class="container">
    <p>&copy; 2016 <a href="">ylsat.com</a> &nbsp; <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">豫ICP备20151109-1</a> &nbsp; <a href="sitemap.xml" target="_blank" class="sitemap">网站地图</a></p>
  </div>
  <div id="gotop"><a class="gotop"></a></div>
</footer>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--该功能正在日以继夜的开发中-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--登录注册模态框-->
<div class="modal fade user-select" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="/Admin/Index/login" method="post">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="loginModalLabel">登录</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="loginModalUserNmae">用户名</label>
            <input type="text" class="form-control" id="loginModalUserNmae" placeholder="请输入用户名" autofocus maxlength="15" autocomplete="off" required>
          </div>
          <div class="form-group">
            <label for="loginModalUserPwd">密码</label>
            <input type="password" class="form-control" id="loginModalUserPwd" placeholder="请输入密码" maxlength="18" autocomplete="off" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">登录</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<%@include file="common/footer.jsp" %>
</body>