package com.cosmos.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int total;
	private Criteria cri;

	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;

		int realEnd = Math.floorDiv(total, cri.getAmount()) + (Math.floorMod(total, cri.getAmount()) > 0 ? 1 : 0);

		if (cri.getPageNum() <= Math.floorDiv(5, 2)) {
			if (realEnd < 5) {
				this.endPage = realEnd;
			} else {
				this.endPage = 5;
			}
			this.startPage = 1;
		} else if ((realEnd - Math.floorDiv(5, 2)) < cri.getPageNum()) {
			this.endPage = realEnd;
			this.startPage = realEnd - 3;
		} else {
			this.endPage = cri.getPageNum() + Math.floorDiv(5, 2);
			this.startPage = cri.getPageNum() - Math.floorDiv(5, 2);
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

}
