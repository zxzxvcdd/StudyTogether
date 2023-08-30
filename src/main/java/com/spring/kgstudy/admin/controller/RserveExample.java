package com.spring.kgstudy.admin.controller;

import org.rosuda.REngine.*;
import org.rosuda.REngine.Rserve.*;

public class RserveExample {
	public static void main(String[] args) throws REXPMismatchException {
		try {

			RConnection c = new RConnection(); // Rserve에 연결

			c.voidEval("library(rJava)");

			c.voidEval("source('D:/RSudioFolder/kgStudy/age.R')");

			REXP result = null;

			result = c.eval("ls()");

			for (String t : result.asStrings()) {
				System.out.println(t);
			}

			c.voidEval("options(encoding = 'utf-8')");

			c.voidEval("ageResult <- ageGraph()");
			
			c.voidEval("result_df <- as.data.frame(ageResult)");
			
			c.voidEval("png(filename = 'ageGraph11.png', width = 800, height = 600)");
			
			c.voidEval("print(makeAgeGraph())");
			
			c.voidEval("dev.off()");
			
			c.close(); // 연결 종료

		} catch (RserveException e) {
			e.printStackTrace();
		}
	}
}
