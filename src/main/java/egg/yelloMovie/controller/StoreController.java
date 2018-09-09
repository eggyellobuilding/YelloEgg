package egg.yelloMovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egg.store.model.StoreDAO;
import egg.store.model.StoreDTO;

@Controller
public class StoreController {
	@Autowired
	private StoreDAO storeDAO;
	
	@RequestMapping("/storeView.do")
	public ModelAndView storeForm() {
		ModelAndView mav = new ModelAndView();
		
		List<StoreDTO> ticketLists = storeDAO.ticket();
		List<StoreDTO> eventLists = storeDAO.event();
		List<StoreDTO> accessorisLists = storeDAO.accessories();
		List<StoreDTO> popcornLists = storeDAO.popcorn();
		
		mav.setViewName("view/store/storeForm");
		
		mav.addObject("ticketLists",ticketLists);
		mav.addObject("eventLists",eventLists);
		mav.addObject("accessorisLists",accessorisLists);
		mav.addObject("popcornLists",popcornLists);
		
		return mav;
	}
	@RequestMapping("/Payment.do")
	public ModelAndView storePaymentSubmit(StoreDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		int midx = Integer.parseInt(dto.getmIdx());
		List<StoreDTO> mList = storeDAO.memberInfo(midx);
		int storePayMileage = storeDAO.storePaymileage(midx);

		int result = mList.get(0).getMileagePrice() - storePayMileage;
		
		mList.get(0).setMileagePrice(result);
		
		mav.addObject("memberInfo",mList);
		mav.addObject("payMentInfo",dto);
		mav.setViewName("view/store/storePayment");
		return mav;
	}
	@RequestMapping("/storePaymentOk.do")
	public ModelAndView storePaymentOk(StoreDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		dto.setMileagePrice(dto.getPayMoney()/300);
		dto.setMileageReason("스토어결제");
		storeDAO.paymentOk(dto);
		int storePayIdx = storeDAO.storePayIdx(dto.getStorePayMemberIdx());
		dto.setStorePayIdx(storePayIdx);
		int storeIdx = storeDAO.storeIdx(dto.getStorePayStoreIdx());
		dto.setStoreIdx(storeIdx);
		List<StoreDTO> lists = storeDAO.paymentOkForm(dto);
		int storeP = lists.get(0).getStorePrice() * lists.get(0).getStorePayCount() - lists.get(0).getStorePayMileage();
		lists.get(0).setStorePrice(storeP);
		
		storeDAO.grade(dto.getStorePayMemberIdx());
		
		mav.addObject("lists", lists);
		mav.setViewName("view/store/storePaymentOk");
		return mav;
	}
}
