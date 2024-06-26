package com.fz.followme.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class OrganizationDto {

	private String memNo;
	private String memName;
	private String deptNo;
	private String deptName;
	private String autLevel;
	private String memGrade;
	private String enrollDate;
	private String email;
	private String extensionNumber;				   
	private String phone;
	private String deptUpstair;
	private String profileImgPath;
	
	
}
