package com.spring.adoption.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.adoption.service.AdoptionService;
import com.spring.adoption.vo.AdoptionVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/adoption/*")
@Slf4j
public class AdoptionController {
	
	@Setter(onMethod_=@Autowired)
	private AdoptionService adoptionService;
		
	
	@GetMapping("/adoptionList")
	public String adoptionList(@ModelAttribute AdoptionVO adoptionvo, Model model) {
		log.info("adoptionList 호출 성공");
		
		List<AdoptionVO> adoptionList = adoptionService.adoptionList(adoptionvo);
		model.addAttribute("adoptionList", adoptionList);
		return "project/adoption/adoptionList";
	}
	
	@GetMapping("/adoptionDetail")
	public String adoptionDetail(@ModelAttribute AdoptionVO adoptionvo, Model model) {
		log.info("adoptionDetail 호출 성공");
		
		AdoptionVO detail = adoptionService.adoptionDetail(adoptionvo);
		model.addAttribute("detail", detail);
		
		return "project/adoption/adoptionDetail";
	}
	
	@PostMapping("/adoptionInsert")
	public String adoptionInsert(AdoptionVO adoptionvo)throws Exception{
		log.info("adoptionInsert 호출 성공 ");
		adoptionService.adoptionInsert(adoptionvo);
		return "redirect:/adoption/adoptionList";
	}
	
	@GetMapping(value="/writeForm")
	public String adoptionWriteForm() {
		log.info("writeForm 호출 성공");
		
		return "project/adoption/writeForm"; //  /WEB-INF/views/client/board/writeForm.jsp
	}
	
	@GetMapping(value="/updateForm")
	public String updateForm(@ModelAttribute AdoptionVO adoptionvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("adoptionId = " + adoptionvo.getAdoptionId());
		
		AdoptionVO updateData = adoptionService.updateForm(adoptionvo);
		
		model.addAttribute("updateData", updateData);
		return "project/adoption/updateForm";
	}
	
	@PostMapping("/adoptionUpdate")
	public String adoptionUpdate(@ModelAttribute AdoptionVO adoptionvo)throws Exception {
		log.info("adoptionUpdate 호출 성공");
		
		int result=0;
		String url ="";
		
		result = adoptionService.adoptionUpdate(adoptionvo);
		
		if(result == 1) {
			url ="/adoption/adoptionDetail?adoptionId="+adoptionvo.getAdoptionId();
		}else {
			url="/adoption/adoptionUpdateForm?adoptionId=" +adoptionvo.getAdoptionId();
		}
		return "redirect:" + url;
	}
	
//	@PostMapping(value="/animalDelete")
//	public String animalDelete(@ModelAttribute AnimalVO avo, RedirectAttributes ras)throws Exception {
//		log.info("animalDelete 호출 성공");
//		
//		int result = 0;
//		String url = "";
//		result = animalService.animalDelete(avo);
//		
//		if(result == 1) {
//			url ="/animal/animalList";
//		}else {
//			ras.addFlashAttribute("errorMsg", "삭제에 문제가 있어 다시 진행해 주세요");
//			url="/animal/animalDetail?animalId="+avo.getAnimalId();
//		}
//		return "redirect:"+url;
//	}
	@PostMapping(value="/adoptionDelete")
	public String adoptionDelete(@ModelAttribute AdoptionVO adoptionvo) throws Exception {
		log.info("adoptionDelete 호출 성공");
		adoptionService.adoptionDelete(adoptionvo);
		return "redirect:/adoption/adoptionList";
	}
	
	@ResponseBody
	@PostMapping(value="/pwdConfirm", produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(AdoptionVO adoptionvo) {
		log.info("pwdConfirm 호출 성공");
		
		int result = adoptionService.pwdConfirm(adoptionvo);
		String value="";
		if(result==1) {
			value="일치";
		}else {
			value="불일치";
		}
		log.info("result= " + result);
		return value;
	}	
}