package com.cosmos.dto;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;
	private int paginationNum;

	public Criteria() {
		this(1, 15);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
