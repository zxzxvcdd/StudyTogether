package com.spring.kgstudy.common.paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

@Getter @Setter @Log4j2 @ToString
public class PageMaker {

    // 한번에 표시할 페이지 숫자
    private static final int PAGE_COUNT = 10;
    // 렌더링시 페이지 시작값, 페이지 끝값
    private int beginPage, endPage, finalPage;
    // 이전, 다음 버튼 활성화 여부
    private boolean prev, next;

    // 현재 위치 페이지
    private Page page;
    // 총 게시물 수
    private Integer totalCount;

    public PageMaker(Page page, int totalCount){
        this.page = page;
        this.totalCount = totalCount;
        makePageInfo();
    }

    public void makePageInfo(){

        // end 페이지 계산
        this.endPage = (int)(Math.ceil(page.getPageNum() / (double)PAGE_COUNT) * PAGE_COUNT);

        // begin 페이지 계산
        this.beginPage = endPage - PAGE_COUNT + 1;

        // 진짜 마지막 페이지
        int realEnd = (int)Math.ceil(totalCount / (double)page.getAmount());
        this.finalPage = realEnd;

        // 마지막 페이지 보정
        if (realEnd < endPage) {
            this.endPage = realEnd;
        }

        // 이전 활성화
        this.prev = beginPage > 1;
        // 다음 활성화
        this.next = endPage < realEnd;
    }

}