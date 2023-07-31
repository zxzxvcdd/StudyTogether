package com.spring.kgstudy.common.paging;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @AllArgsConstructor
public class Page {

    private int pageNum; //현재 페이지 번호
    private int amount; //한 페이지에 보여줄 데이터의 개수

    public Page(){
        this.pageNum = 1;
        this.amount = 10;
    }

    public int getStart() { //시작 데이터의 인덱스를 계산하는 메서드
        return (pageNum - 1) * amount;
    }

    public void setPageNum(int pageNum){ //페이지 번호를 설정하는 메서드, 1이상의 값이여야 함.
        if(pageNum <= 0 || pageNum > Integer.MAX_VALUE){
            this.pageNum = 1;
            return;
        }
        this.pageNum = pageNum;
    }


    public void setAmount(int amount){ 
   
        this.amount = amount;
    }
}