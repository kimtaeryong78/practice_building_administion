package com.cosmos.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OptionsDTO {
	private int no;
	private String item;
	private int cost;
	private String activity;
	private String delete_flag;
	private Date created_at;
	private Date updated_at;
}
