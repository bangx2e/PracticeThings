package woo.edu.c.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.YearMonthDay;
import woo.edu.c.vo.boardVO;
import woo.edu.c.vo.Calendar;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// mybatis
	@Inject
	private SqlSession sql;

	private static String namespace = "boardMapper";


	@Override
	public int update(boardVO vo) {
		int cnt = sql.update(namespace + ".iOrU", vo);
		return cnt;
	}
//	@Override
//	public int update(boardVO vo) {
//		int cnt = sql.update(namespace + ".update", vo);
//		return cnt;
//	}

	@Override
	public List<boardVO> list() {
		List<boardVO> list = sql.selectList(namespace + ".list");
		return list;
	}

	@Override
	public List<boardVO> test() {
		return null;
	}

	@Override
	public boardVO detail(int boardNum) {
		boardVO vo = sql.selectOne(namespace + ".detail", boardNum);
		return vo;
	}

//	@Override
//	public int write(boardVO vo) {
//		int cnt = sql.insert(namespace + ".insert", vo);
//		return cnt;
//	}
	@Override
	public int write(boardVO vo) {
		int cnt = sql.insert(namespace + ".iOrU", vo);
		return cnt;
	}

	@Override
	public int delete(int boardNum) {
		int cnt = sql.delete(namespace + ".delete", boardNum);
		return cnt;
	}

	@Override
	public int deletelist(ArrayList<Integer> boardNums) {
		int cnt = 0;
		for(int i=0; i<boardNums.size();i++) {
			cnt+=sql.delete(namespace+".deletelist", boardNums.get(i));
		}
		return cnt;
	}

	@Override
	public List<YearMonthDay> getMonth(String date) {
		System.out.println("몬쓰 : "+date);
		List<YearMonthDay> ymd = sql.selectList(namespace+".getMonth",date);
		return ymd;
	}

	@Override
	public int saveSchedule(Calendar cal) {
		int cnt = sql.insert(namespace+".saveSchedule", cal);
		return cnt;
	}

	@Override
	public List<Calendar> getSchedule(String date) {
		System.out.println("겟스케쥴 다오 데이트: "+date);
		List<Calendar> list = sql.selectList(namespace+".getSchedule", date);
		return list;
	}

	@Override
	public int delSchedule(int calNo) {
		int cnt = sql.delete(namespace + ".delSchedule", calNo);
		return cnt;
	}

}
