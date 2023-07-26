package com.spring.kgstudy.menu.vo;

import com.spring.kgstudy.common.pass.PassType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MenuVO {

	
	private int menuId;
	
	private String menuName;
	
	private PassType passType;
	
	private int passTime;
	
	private int passPrice;
	
	
	
	
	
	
	
	
}
