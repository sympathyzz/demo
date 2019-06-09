package com.yc.blog.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.yc.blog.bean.Article;
import com.yc.blog.biz.ArticleBiz;
import com.yc.blog.vo.EasyUIPage;
import com.yc.blog.vo.Result;

@RestController
@RequestMapping("article")
public class ArticleAction {
		@Resource
		private ArticleBiz ab;
		
		//article/query
		@RequestMapping("query")
		public EasyUIPage query(Article article,int page,int rows){
			Page<Article> p=ab.findByPage(article,page, rows);
			return new EasyUIPage(p.getTotal(),p.getResult());
		}
		
		@RequestMapping("save")
		public Result save(@Valid Article article,Errors errors){
			if(errors.hasErrors()){
				return new Result(Result.FAILURE,"博文保存失败！",errors.getAllErrors());
			}else{
				ab.save(article);
				return new Result(Result.SUCCESS,"博文保存成功！");
			}
			
		}
		
		@RequestMapping("upload")
		public Result upload(@RequestParam("file") MultipartFile file){
			try {
				file.transferTo(new File("e:/upload/upload"+file.getOriginalFilename()));
				return new Result(Result.SUCCESS,"文件上传成功！","/upload/"+file.getOriginalFilename());
			} catch (Exception e) {
				return new Result(Result.FAILURE,"文件上传失败！");
			}
		}
}
