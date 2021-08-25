package woo.edu.c.dao;

import java.util.*;

import woo.edu.c.vo.YearMonthDay;
import woo.edu.c.vo.boardVO;
import woo.edu.c.vo.Calendar;

public interface BoardDao {
	
	
	public List<boardVO> test();
	public int update(boardVO vo);
	public List<boardVO> list();
	public boardVO detail(int boardNum);
	public int write(boardVO vo);
	public int delete(int boardNum);
	public int deletelist(ArrayList<Integer> boardNums);
	public List<YearMonthDay> getMonth(String date);
	public int saveSchedule(Calendar cal);
	public int delSchedule(int calNo);
	public List<Calendar> getSchedule(String date);
	
}
