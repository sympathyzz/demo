package com.yc.blog.util;

public class Utils {

	public static String subTag(String content) {
		return content.replaceAll("<.+?>", "").replaceAll("&.+?;", "").replaceAll("\\s", "");
	}

}
