package woo.edu.c.service;

import java.util.*;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.*;
import woo.edu.c.vo.Calendar;


@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private BoardDao boardDao;

	@Override
	public List<boardVO> test() {
		return null;
	}

	@Override
	public List<boardVO> list() throws Exception {
		return boardDao.list();
	}

	@Override
	public boardVO detail(int boardNum) {
		//객체 생성 없이 바로 리턴해준다.
		return boardDao.detail(boardNum);
	}

	@Override
	public void update(boardVO vo) {
		boardDao.update(vo);
	}

	@Override
	public void write(boardVO vo) {
		boardDao.write(vo);
	}

	@Override
	public int delete(int boardNum) {
		return boardDao.delete(boardNum);
	}

	@Override
	public int deletelist(ArrayList<Integer> boardNums) {
		return boardDao.deletelist(boardNums);
	}

	@Override
	public List<YearMonthDay> getMonth(String date) {
		return boardDao.getMonth(date);
	}

	@Override
	public int saveSchedule(Calendar cal) {
		return boardDao.saveSchedule(cal);
	}

	@Override
	public List<Calendar> getSchedule(String date) {
		return boardDao.getSchedule(date);
	}

	@Override
	public int delSchedule(int calNo) {
		return boardDao.delSchedule(calNo);
	}

	
}
