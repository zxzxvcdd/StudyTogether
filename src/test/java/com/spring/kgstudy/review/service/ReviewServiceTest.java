package com.spring.kgstudy.review.service;

import static org.junit.jupiter.api.Assertions.*;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;


@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/*.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
class ReviewServiceTest {

	@Autowired
	ReviewService service;
	@Test
	void test() {

LocalDate now = LocalDate.now();
		
		LocalDate start = now.minusYears(40);
		
		
		for(int i=1; i<=120; i++) {
			
		
			for(int j=1; j<=30; j++) {
				 Random random = new Random();
				 Long ranDay = (long) (random.nextInt((int) (now.toEpochDay() -start.toEpochDay()+1)) + start.toEpochDay());
				 
				 Date orderDate = 	Date.from(LocalDate.ofEpochDay(ranDay).atStartOfDay(ZoneId.systemDefault()).toInstant());
				 SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
				 
				 String date = format.format(orderDate);
		
				
				String sql ="insert into review(review_id,user_id,store_id,store_name,reservation_id,review_date,review_content,review_filename,review_star)"
						+ "      values (review_seq.NEXTVAL, 'user"+i+"', "+(2257+i)+ ", (select store_name from store_table where store_id = "+ (2257+i)+"), "
						+ i*j+",' "+date+"', '리뷰입니다"+i*j+"', '파일1.jsp', "+((i*j)%5+1)+");" ;
				
				System.out.println(sql);
				
				
				
			}
			
		}
	
	}

}
