package edu.kh.farmfarm.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Graph {
	
	// 회원가입자 수 
	private String signUpDate;
	private int signUpCount;
	
	// 주문 수
	private String orderDate;
	private int orderCount;
	

}
