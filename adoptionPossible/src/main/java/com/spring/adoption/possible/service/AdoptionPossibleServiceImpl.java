package com.spring.adoption.possible.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.adoption.dao.AdoptionDAO;
import com.spring.adoption.possible.dao.AdoptionPossibleDAO;
import com.spring.adoption.possible.vo.AdoptionPossibleVO;
import com.spring.adoption.vo.AdoptionVO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class AdoptionPossibleServiceImpl implements AdoptionPossibleService{
	
	@Setter(onMethod_=@Autowired)
	private AdoptionPossibleDAO apDAO;
	
	@Override
	public List<AdoptionPossibleVO> apList(AdoptionPossibleVO apvo) {
		List<AdoptionPossibleVO> list = null;
		list = apDAO.apList(apvo);
		return list;
	}
	
	@Override
	public int apListCnt(AdoptionPossibleVO apvo) {
		return 0;
	}
	
	@Override
	public AdoptionPossibleVO apDetail(AdoptionPossibleVO apvo) {
		apDAO.readCntUpdate(apvo);
		
		AdoptionPossibleVO detail = apDAO.apDetail(apvo);
		if(detail != null) {
			detail.setAdoptionContent(detail.getAdoptionContent().replaceAll("\n","<br/>"));
		}
		return detail;
	}
	
	@Override
	public int apInsert(AdoptionPossibleVO apvo) throws Exception {
		int result=0;
		if(apvo.getFile().getSize() >0) {
			String fileName = FileUploadUtil.fileUpload(apvo.getFile(), "ap");
			apvo.setAdoptionFile(fileName);
		}
		result = apDAO.apInsert(apvo);
		return result;
	}

	@Override
	public int pwdConfirm(AdoptionPossibleVO apvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AdoptionPossibleVO updateForm(AdoptionPossibleVO apvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int apUpdate(AdoptionPossibleVO apvo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int apDelete(AdoptionPossibleVO apvo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
