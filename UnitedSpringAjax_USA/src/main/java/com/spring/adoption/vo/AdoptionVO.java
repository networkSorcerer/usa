package com.spring.adoption.vo;

import org.springframework.web.multipart.MultipartFile;


import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class AdoptionVO extends CommonVO{
	private int adoptionId=0;
	private String adoptionContent="";
	private String adoptionDate;
	private String adoptionTitle="";
	private int adoptionCnt=0;
	private String adoptionStatus="";
	private String adoptionLevel="";
	private String adoptionPasswd="";
	private String adminId;

	
	private MultipartFile file;
	private String adoptionFile = "";
}