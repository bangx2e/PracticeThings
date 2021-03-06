package woo.edu.c.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import woo.edu.c.dao.BoardDao;
import woo.edu.c.dao.BoardDaoImpl;
import woo.edu.c.service.BoardService;
import woo.edu.c.vo.Calendar;
import woo.edu.c.vo.YearMonthDay;
import woo.edu.c.vo.boardVO;
import woo.edu.c.vo.testVo;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private BoardService boardService;

	// 메인 화면
	@RequestMapping(value = "/board/home")
	public String home(Model model) throws Exception {
		logger.info("/board/home");
		model.addAttribute("list", boardService.list());
		return "/board/boardhome";
	}

	// Ajax 보드
	@RequestMapping(value = "/board/ajax")
	public String ajax(Model model) throws Exception {
		logger.info("/board/ajax");
		model.addAttribute("list", boardService.list());
		return "/board/ajax";
	}

	// test
	@RequestMapping(value = "/board/test", method = RequestMethod.GET)
	public String boardList() throws Exception {
		logger.info("/board/test");
		return "/board/test";
	}
	// 계산기
	@RequestMapping(value = "/board/calculator", method = RequestMethod.GET)
	public String calculator() throws Exception {
		logger.info("/board/calculator");
		return "/board/calculator";
	}
	// 달력 페이지 이동
	@RequestMapping(value = "/board/calendar", method = RequestMethod.GET)
	public String calendar(@RequestParam(value="ywitm" , required=false)String ym, Model model) throws Exception {
		logger.info("/board/calendar");
		// ywitm이 null값이 들어올 경우 calendar에 현재 시스템의 년,월을 셋팅 해주는 코드
		Date date_now = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
		String date = format.format(date_now);
//		System.out.println(date);
		
		List<YearMonthDay> lists;
		if(ym==null) {
			lists=boardService.getMonth(date);
		}else {
			lists=boardService.getMonth(ym);
		}
		model.addAttribute("getmonth",lists.get(0).getMonth());
		model.addAttribute("getyear",lists.get(0).getYear());
		model.addAttribute("ymd",lists);
		return "/board/calendar";
	}
	
	// 글 작성페이지
	@RequestMapping(value = "/board/reg", method = RequestMethod.GET)
	public String reg(Model model) throws Exception {
		logger.info("/reg");
		return "/board/boardreg";
	}

	// 글 상세보기 페이지
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public String detail(Model model, int boardNum) throws Exception {
		logger.info("/detail");
		boardVO vo = boardService.detail(boardNum);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "/board/detail";
	}
	// 글 상세보기 페이지 Ajax 버전
	@RequestMapping(value = "/board/detailAjax", method = RequestMethod.GET)
	@ResponseBody
		public boardVO detailAjax(Model model, int boardNum) throws Exception {
			logger.info("/detailAjax");
			boardVO vo = boardService.detail(boardNum);
			model.addAttribute("vo", vo);
			logger.info("/detailAjax 호출 성공");
			return vo;
	}
	// 글 작성
	@RequestMapping(value = "/board/reg", method = RequestMethod.POST)
	public String write(boardVO vo) throws Exception {
		logger.info("/write");
		boardService.write(vo);
		return "redirect:/board/home";
	}

	@RequestMapping(value = "/board/regajax", method = RequestMethod.POST)
	@ResponseBody
	public String writeajax(@RequestBody boardVO vo) throws Exception {
		logger.info("/write");
		boardService.write(vo);
		System.out.println("글써짐" + vo);
		return vo.getTitle() + vo.getWriter() + vo.getBoardContent();
//		return "/board/ajax";
	}
	// 스케쥴 가져오기
	@RequestMapping(value = "/board/getSchedule", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public List<Calendar> getSchedule(String date) throws Exception {
		logger.info("/getSchedule");
		List<Calendar> cal = boardService.getSchedule(date);
		//model.addAttribute("sche", cal); //Ajax Json으로 하기때문에 model로 해줄 필요가 없다.
		System.out.println(cal);
		logger.info("/getSchedule 호출 성공");
		// return 한 값은 ajax의 success : function(data)의 data로 넘어간다
		return cal;
	}

	//스케쥴 저장
	@RequestMapping(value = "/board/saveschedule", method = RequestMethod.POST)
	@ResponseBody
	public String saveschedule(@RequestBody Calendar cal) throws Exception {
		logger.info("/saveschedule");
		boardService.saveSchedule(cal);
		System.out.println("글써짐" + cal);
		return "/board/saveschedule";
	}	
	//스케쥴 삭제
	@RequestMapping(value = "/board/delSchedule", method = RequestMethod.GET)
	@ResponseBody
	public String delSchedule(int calNo) throws Exception {
		logger.info("/saveschedule");
		boardService.delSchedule(calNo);
		System.out.println("지워짐" + calNo);
		return "/board/delSchedule";
	}

	// 글 수정페이지 이동
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String update(Model model, int boardNum) throws Exception {
		logger.info("/update");
		boardVO vo = boardService.detail(boardNum);
		model.addAttribute("vo", vo);
		return "/board/update";
	}

	// 글 수정 작업 완료
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String postupdate(boardVO vo) throws Exception {
		logger.info("/postUpdate");
		boardService.update(vo);
		return "redirect:/board/home";
	}

	// 글 삭제
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String delete(int boardNum) throws Exception {
		logger.info("/delete");
		boardService.delete(boardNum);
		return "redirect:/board/home";
	}

	// 글 삭제
	@RequestMapping(value = "/board/deleteAjax", method = RequestMethod.GET)
	@ResponseBody
	public String deleteAjax(int boardNum) throws Exception {
		logger.info("/deleteAjax");
		boardService.delete(boardNum);
		logger.info("/삭제됨");
		return "redirect:/board/ajax";
	}
	
	@ResponseBody
	@RequestMapping(value = "/board/deleteListAjax", method = RequestMethod.POST)
	public String deleteList(@RequestParam(value="testArray") ArrayList<Integer> arraylist) throws Exception {
		logger.info("/deleteListAjax");
		for(int no : arraylist) {
			System.out.println(no);
		}
		boardService.deletelist(arraylist);
		logger.info("/삭제됨");
		return "redirect:/board/ajax";
	}
}
