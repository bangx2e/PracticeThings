package woo.edu.c.service;

import java.util.*;

import woo.edu.c.vo.*;
import woo.edu.c.vo.Calendar;

public interface BoardService {

	List<boardVO> test();
	List<boardVO> list() throws Exception;
	boardVO detail(int boardNum);
	void update(boardVO vo);
	int delete(int boardNum);
	int deletelist(ArrayList<Integer> boardNums);
	void write(boardVO vo);
	int saveSchedule(Calendar cal);
	List<YearMonthDay> getMonth(String date);
	List<Calendar> getSchedule(String date);
	int delSchedule(int calNo);
}
