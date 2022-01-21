package com.cosmos.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {

	public static String getEnc(String source) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		StringBuilder sb = new StringBuilder();

		md.update(source.getBytes());
		for (byte b : md.digest()) {
			sb.append(String.format("%02x", b));
		}

		return sb.toString();
	}

}
