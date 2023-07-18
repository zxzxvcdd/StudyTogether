package com.spring.kgstudy.common.paging;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

 @ToString @AllArgsConstructor
public class Page {

    private int pageNum;
    private int amount;

    public Page(){
        this.pageNum = 1;
        this.amount = 12;
    }

    public int getStart() {
        return (pageNum - 1) * amount;
    }

    public void setPageNum(int pageNum){
        if(pageNum <= 0 || pageNum > Integer.MAX_VALUE){
            this.pageNum = 1;
            return;
        }
        this.pageNum = pageNum;
    }


    public void setAmount(int amount){
        if(amount < 4 || amount > 100){
            this.amount = 5;
            return;
        }
        this.amount = amount;
    }

	public int getPageNum() {
		return pageNum;
	}

	public int getAmount() {
		return amount;
	}
}