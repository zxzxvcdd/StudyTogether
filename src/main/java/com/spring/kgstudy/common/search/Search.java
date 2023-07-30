package com.spring.kgstudy.common.search;

import java.util.Date;

import com.spring.kgstudy.common.paging.Page;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
@AllArgsConstructor
public class Search extends Page {

    private String type; // 검색 조건
    private String keyword; // 검색 키워드
    
    private Date startDate;
    
    private Date endDate;
    
    public Search() {
    	
    	
    	this.endDate = new Date();
    	
    	this.startDate = new Date(); 
    	
    	
    }
    
    
}