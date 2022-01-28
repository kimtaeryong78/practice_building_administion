package com.cosmos.util;

import java.io.File;
import java.util.ArrayList;

public class FolderArray {

	public static ArrayList<String> getFileName(String path) {
		File dir = new File(path + "/resources/img");
		File files[] = dir.listFiles();
		ArrayList<String> fileList = new ArrayList<String>();

		for (File s : files) {
			String temp = s.toString().replace("\\", "/");
			temp = "/" + temp.substring(temp.lastIndexOf("img"), temp.length() - 4);
			fileList.add(temp);
		}

		return fileList;
	}
}
