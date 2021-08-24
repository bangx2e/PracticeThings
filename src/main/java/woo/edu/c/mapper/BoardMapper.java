package woo.edu.c.mapper;

import java.util.List;

import woo.edu.c.vo.boardVO;

public interface BoardMapper {
	public List<boardVO> getList();
	public boardVO getView();
}
