package teamProject3.qaboard.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamProject3.qaboard.BoardVO;
import teamProject3.qaboard.mapper.BoardDAO;
import teamProject3.qaboard.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDAO boarddao;
	
	@Override
	public int insert(BoardVO freeboardVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardVO> selectAll(BoardVO freeboardVO) {
		// TODO Auto-generated method stub
		return boarddao.selectAll(null);
	}

	@Override
	public int delete(BoardVO freeboardVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardVO freeboardVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVO selectOne(BoardVO freeboardVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count(BoardVO freeboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReadCount(String num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO selectOneBoardByNum(String num) {
		// TODO Auto-generated method stub
		return null;
	}

}
