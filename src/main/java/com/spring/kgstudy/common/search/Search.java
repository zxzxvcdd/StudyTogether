package com.spring.kgstudy.common.search;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

import com.spring.kgstudy.common.paging.Page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
@AllArgsConstructor
public class Search extends Page {

	private String type; // 검색 조건
    private String keyword; // 검색 키워드
    
    private SimpleDateFormat form = new SimpleDateFormat("yy/MM/dd");
    private String startDate;

    private String endDate;
    
    public Search() {
       
       
       
      Calendar now = Calendar.getInstance();
      
      
      this.endDate = form.format(now.getTime());
      now.add(Calendar.DATE, -7);
      this.startDate= form.format(now.getTime());
      

    }
    
    








		public void setStartDate(String startDate) {
			Date date = null;
			try {
				date = form.parse(startDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			this.startDate = form.format(date);
		}
		
		
		
		
		
		public void setEndDate(String endDate) {
			Date date = null;
			try {
				date = form.parse(endDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			this.endDate = form.format(date);
		}

    
    
}