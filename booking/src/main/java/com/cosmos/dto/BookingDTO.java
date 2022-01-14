package com.cosmos.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BookingDTO {
	private int no; // booking number
	private int room_no; // room number
	private String name; // name
	private String phone; // phone number
	private String adult; // confirm adult
	private String child; // confirm child
	private String start_date; // reservation start date
	private String end_date; // reservation end date
	private String options; // plus options
	private String payment_flag; // confirm payment
	private int total_cost; // total cost
	private String cancel_flag; // confirm transparent
	private String bank_name; // bank name
	private String bank_branch_code;// bank branch code
	private String bank_account_number;// bank account number
	private String delete_flag; // confirm deleting
	private Date created_at; // date of creation
	private Date updated_at; // date of updation
	private int build_code; // build code
}
