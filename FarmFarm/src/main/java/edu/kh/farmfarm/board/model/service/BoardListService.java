package edu.kh.farmfarm.board.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.farmfarm.board.model.vo.Board;
import edu.kh.farmfarm.member.model.VO.Member;

public interface BoardListService {
	
	// 와글와글 게시판 네브 조회
	List<Map<String, Object>> boardTypeList();


	// 와글와글 게시판 목록 조회
	Map<String, Object> selectBoardList(Map<String, Object> pm, int cp);

	// 와글와글 게시판 검색 + 목록 조회
	Map<String, Object> selecBoardtListSearch(Map<String, Object> pm, int cp);

	// 프로필 클릭시 모달  
	Member selectMember(int memberNo);


	/** 게시판 이미지 이름 조회
	 * @return
	 */
	List<String> selectBoardImageList();





}
