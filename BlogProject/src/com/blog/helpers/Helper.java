package com.blog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

	public static boolean deleteFile(String path) {
		boolean success = false;

		try {
			File file = new File(path);
			success = file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}

	public static boolean saveFile(InputStream is, String path) {
		boolean success = false;

		try {
			byte[] b = new byte[is.available()];
			is.read(b);

			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);

			fos.flush();
			fos.close();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	}
}
