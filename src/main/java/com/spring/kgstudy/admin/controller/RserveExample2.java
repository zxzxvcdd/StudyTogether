package com.spring.kgstudy.admin.controller;

import org.rosuda.REngine.*;
import org.rosuda.REngine.Rserve.*;

public class RserveExample2 {
	public static void main(String[] args) throws REXPMismatchException {
		try {

			RConnection c = new RConnection(); // Rserve에 연결
			
			c.voidEval("library(rJava)"); // Rserve에 R명령어 전송

			c.eval("source('D:/RSudioFolder/kgStudy/mae.R')");
			
			REXP result = null;
			result = c.eval("ls()");
			for (String t : result.asStrings()) {
				System.out.println(t);
			}
			
			c.voidEval("options(encoding = 'utf-8')");

			String type = "2019";
			
			c.voidEval("result <- updateSearch("+ type +")");
			
			c.voidEval("png(filename = 'maeGraph2.png', width = 800, height = 600)");
			
			c.voidEval("print(makeMaeGraph())");
			
			c.voidEval("dev.off()");
			
			c.close(); // 연결 종료

		} catch (RserveException e) {
			e.printStackTrace();
		}
	}
}
