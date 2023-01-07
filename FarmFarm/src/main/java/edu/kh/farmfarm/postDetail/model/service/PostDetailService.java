package edu.kh.farmfarm.postDetail.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.farmfarm.postDetail.model.dao.PostDetailDAO;
import edu.kh.farmfarm.postDetail.model.vo.Post;

public interface PostDetailService {


	/** 판매글 상세 조회
	 * @param postNo
	 * @return
	 */
	public Post selectPost(int postNo);

	/** 판매글 이미지 목록 조회
	 * @return
	 */
	public List<String> selectPostImageList();

	/** 판매글 조회수 증가
	 * @param postNo
	 * @return
	 */
	public int updateViewCount(int postNo);
}
