package com.spring.kgstudy.admin.controller;

import org.rosuda.REngine.*;
import org.rosuda.REngine.Rserve.*;

public class RserveAge {
	public static void main(String[] args) throws REXPMismatchException {
		try {

			RConnection c = new RConnection(); // Rserve에 연결
			
			String sql = "select decode(age,'0대','어린이',age) age, total from (SELECT (floor((MONTHS_BETWEEN(SYSDATE, USER_BIRTHDAY) / 12)/10))*10||'대' AS age, COUNT(*) AS total FROM member GROUP BY (floor((MONTHS_BETWEEN(SYSDATE, USER_BIRTHDAY) / 12)/10))*10||'대' ORDER BY age)";
			
			c.voidEval("library(rJava)");
			c.voidEval("library(RJDBC)");
			c.voidEval("library(ggplot2)");
			c.voidEval("jdbcDriver<-JDBC(driverClass = 'oracle.jdbc.OracleDriver', classPath = 'D:/RSudioFolder/oracle/ojdbc8.jar')");
			c.voidEval("conn<-dbConnect(jdbcDriver, 'jdbc:oracle:thin:@localhost:1521:xe', 'kgstudy', 'kgstudy')");
			
			REXP result = null;
			result = c.eval("ls()");
			for (String t : result.asStrings()) {
				System.out.println(t);
			}
			
			c.voidEval("gg<-dbGetQuery(conn, '" + sql + "')");

			result = null;
			result = c.eval("ls()");
			for (String t : result.asStrings()) {
				System.out.println(t);
			}

			c.voidEval("options(encoding = 'utf-8')");

			c.voidEval("ageResult <- gg");

			c.voidEval("result_df <- as.data.frame(ageResult)");
			
			c.voidEval("result_df$AGE <- factor(result_df$AGE, levels = c('어린이', '10대', '20대', '30대', '40대', '50대', '60대', '70대', '80대', '대'))");
			
			c.voidEval("graph<-ggplot(result_df, aes(x = AGE, y = TOTAL, fill = AGE)) geom_bar(stat = 'identity') labs(title = '나이대별 인원수 차트', x = '나이대', y = '인원수') theme_minimal()");
			
			c.voidEval("png(filename = 'ageGraph11.png', width = 800, height = 600)");

			c.voidEval("print(graph)");

			c.voidEval("dev.off()");

			c.close(); // 연결 종료

		} catch (RserveException e) {
			e.printStackTrace();
		}
	}
}
