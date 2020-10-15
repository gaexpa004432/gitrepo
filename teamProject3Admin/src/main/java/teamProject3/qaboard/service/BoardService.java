package teamProject3.qaboard.service;

import java.util.ArrayList;

import teamProject3.qaboard.BoardVO;

public interface BoardService {

	//등록 
	int insert(BoardVO freeboardVO);

	//전체조회 (페이징처리가 되는)
	ArrayList<BoardVO> selectAll(BoardVO freeboardVO);

	//삭제
	int delete(BoardVO freeboardVO);

	//수정
	int update(BoardVO freeboardVO);

	//단건조회(게시물view) 
	BoardVO selectOne(BoardVO freeboardVO);

	int count(BoardVO freeboard);

	void updateReadCount(String num);

	BoardVO selectOneBoardByNum(String num);
	
	ArrayList<BoardVO> commntSelectAll(BoardVO freeboardVO);

}