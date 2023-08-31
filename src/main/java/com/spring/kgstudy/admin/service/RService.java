package com.spring.kgstudy.admin.service;

import java.util.UUID;

import org.rosuda.REngine.*;
import org.rosuda.REngine.Rserve.*;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RService {

	public String MakeMaeGraph(String year) throws REXPMismatchException {

		RConnection c = null;

		try {
			c = new RConnection(); // Rserve에 연결

			String uuid = UUID.randomUUID().toString();
			String fileName = "maeGraph-" + uuid;

			fileName = fileName.substring(0, 16);

			c.voidEval("library(rJava)"); // Rserve에 R명령어 전송
			c.eval("source('D:/RSudioFolder/kgStudy/mae.R')");

			c.voidEval("options(encoding = 'utf-8')");
			c.voidEval("result <- updateSearch(" + year + ")");
			c.voidEval("png(filename = '" + fileName + ".png', width = 800, height = 600)");
			c.voidEval("print(makeMaeGraph())");
			c.voidEval("dev.off()");
			c.close(); // 연결 종료

			return fileName;
			
		} catch (RserveException e) {
			e.printStackTrace();
		}

		return null;
	}

	public String ageGraph() throws REXPMismatchException {

		RConnection c = null;

		try {

			c = new RConnection(); // Rserve에 연결

			String uuid = UUID.randomUUID().toString();
			String fileName = "ageGraph-" + uuid;

			fileName = fileName.substring(0, 16);

			c.voidEval("library(rJava)");

			// R스크립트 경로
			c.eval("source('D:/RSudioFolder/kgStudy/age.R')");

			REXP result = null;
			result = c.eval("ls()");
			for (String t : result.asStrings()) {
				System.out.println(t);
			}

			c.voidEval("options(encoding = 'utf-8')");

			c.voidEval("ageResult <- ageGraph()");

			c.voidEval("result_df <- as.data.frame(ageResult)");

			c.voidEval("png(filename = '" + fileName + ".png', width = 800, height = 600)");

			c.voidEval("print(makeAgeGraph())");

			c.voidEval("dev.off()");

			c.close(); // 연결 종료
			return fileName;

		} catch (RserveException e) {
			e.printStackTrace();
		}
		return null;

	}
	
}
