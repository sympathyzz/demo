package com.yc.blog.web;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.blog.bean.Article;
import com.yc.blog.biz.ArticleBiz;
import com.yc.blog.biz.CategoryBiz;
import com.yc.blog.util.Utils;

@Controller
public class IndexAction {
	@Resource
	private CategoryBiz cb;
	@Resource
	private ArticleBiz ab;
	
	@ModelAttribute
	public void initData(Model model){
		//查询所有类
		model.addAttribute("cateList",cb.findAll());
	}
	
	@GetMapping(value={"index","/"})
	public String index(Model model,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="5")int size){		
		Article a=ab.findByTodayFirst();
		String content=Utils.subTag(a.getContent());
		a.setContent(content);
		/**
		 * 查看今日推荐文章
		 */
		model.addAttribute("todayArticle",a);
		/**
		 * 最新发布
		 */
		model.addAttribute("newList",ab.findByPage(0,page,size));
		return "index";
	}
	@GetMapping("category")
	public String category(Model model,int id,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(defaultValue="5")int size){
		model.addAttribute("articleList",ab.findByPage(id, page, size));
		return "category";
	}
	
	@GetMapping("article")
	public String article(Model model,int id){
		model.addAttribute("article",ab.findById(id));
		return "article";
	}
	
	@RequestMapping("manage")
	public String manage(){
		return "manage";
	}
	@RequestMapping("articleMgr")
	public String articleMgr(){
		return "article-mgr";
	}
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Value("${mail.fromMail.addr}") // SPEL表达式
	private String from;
	
	public void sendSimpleMail(String to,String subject,String content){
			SimpleMailMessage message=new SimpleMailMessage();
			message.setFrom(from);
			message.setTo(to);
			message.setSubject(subject);
			message.setText(content);
			mailSender.send(message);
	}
	
	@GetMapping("email")
	@ResponseBody
	public String send(String to,String content){
		sendSimpleMail(to, "系统邮件", content);
		return "发送成功！";
	}
}
