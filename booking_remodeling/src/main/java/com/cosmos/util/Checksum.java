package com.cosmos.util;

import java.util.ArrayList;

public class Checksum {

	public static ArrayList<String> checksum(ArrayList<String> fileList, String[] sqlList){
		ArrayList<String> correctFile = new ArrayList<String>();
		for (String file : fileList) {
			for (String sql : sqlList) {
				if (sql.equalsIgnoreCase(SHA256.encoding(file) + ".jpg")) {
					correctFile.add(file + ".jpg");
				}
			}
		}
		return correctFile;
	}
}
