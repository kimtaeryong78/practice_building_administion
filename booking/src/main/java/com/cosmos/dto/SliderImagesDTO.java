package com.cosmos.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SliderImagesDTO {
	private int no;
	private String file_name;
	private String sort_no;
	private String activity;
	private String delete_flag;
	private Date created_at;
	private Date updated_at;
	private int build_code;
}
