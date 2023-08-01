package com.spring.kgstudy.common.search;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
    
    private SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String endDate;
    
    public Search() {
    	
    	
    	
		Calendar now = Calendar.getInstance();
		
		
		this.endDate = form.format(now.getTime());
		now.add(Calendar.DATE, -7);
		this.startDate= form.format(now.getTime());
		

    }
    
	public void setStartDate(Date startDate) {
		this.startDate = form.format(startDate);
	}

	public void setEndDate(Date endDate) {
		this.endDate = form.format(endDate);
		
		
	}
}
