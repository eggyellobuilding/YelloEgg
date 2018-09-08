package egg.store.admin.controller;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egg.store.admin.model.AdminStoreDAO;
import egg.store.admin.model.AdminStoreDTO;

@Controller
public class AdminStoreController {
	@Autowired 
	private AdminStoreDAO dao;
	
	
	private String copyInto(MultipartFile storeImg) {
		
		try {
			byte bytes[]=storeImg.getBytes();
			String path = "C:\\file\\storeimg\\"+storeImg.getOriginalFilename();
			File outFile =new File(path);
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
			
			return path;
		} catch (IOException e) {
			
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping("/adStore.do")
	public String adminStore() {
		
		return "admin/store/adSotreForm";
	}
	@RequestMapping(value="/adminStoreAdd.do",method=RequestMethod.GET)
	public String adminStoreAdd() {
		return "admin/store/adminStoreAdd";
	}

	@RequestMapping(value="/adminStoreAdd.do",method=RequestMethod.POST)
	public ModelAndView adminStoreAdd(AdminStoreDTO dto) {
		String storeImg=copyInto(dto.getStoreTitleImg());
		dto.setStoreImg(storeImg);
		dto.setStoreCtg(dto.getStorectg());
		dto.setStoreName(dto.getStorename());
		dto.setStoreCount(Integer.parseInt(dto.getStorecount()));
		dto.setStorePrice(Integer.parseInt(dto.getStoreprice()));
		dto.setStoreDate(dto.getStoreDate());
		dto.setStoreInfo(dto.getStoreinfo());
		ModelAndView mav=new ModelAndView();
		int result=dao.adminStoreadd(dto);
		
		if(result>0) {
			mav.addObject("msg","등록성공");
			mav.addObject("gopage","adminStoreList.do");
			mav.setViewName("admin/store/adminStoreMsg");
		}else {
			mav.addObject("msg","등록실패");
			mav.addObject("gopage","adminStoreAdd.do");
			mav.setViewName("admin/store/adminStoreMsg");
		}
		return mav;
	}
	@RequestMapping("/adminStoreList.do")
	public ModelAndView adminStoreList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalcnt=dao.getTotalcnt();
		int listsize=15;
		int pagesize=5;
		String pagestr=egg.commons.PageModule.makepage("adminStoreList.do", totalcnt, listsize, pagesize, cp);
		List<AdminStoreDTO> list=dao.adminstorelist(cp,listsize);
		ModelAndView mav= new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pagestr", pagestr);
		mav.setViewName("admin/store/adminStoreList");
		return mav;
	}
	@RequestMapping("/adminStoreDelete.do")
	public ModelAndView StoreDelete(@RequestParam("storeIdx")int storeIdx) {
		int result=dao.adminStoreDelete(storeIdx);
		ModelAndView mav=new ModelAndView();
		if(result>0) {
			mav.addObject("msg","삭제성공");
			mav.addObject("gopage","adminStoreList.do");
		}else {
			mav.addObject("msg","삭제실패");
			mav.addObject("gopage","adminStoreList.do");
		}
		mav.addObject("result", result);
		mav.setViewName("admin/store/adminStoreDelete");
		return mav;
	}
}	
