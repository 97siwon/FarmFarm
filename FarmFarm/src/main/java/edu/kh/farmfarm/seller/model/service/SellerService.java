package edu.kh.farmfarm.seller.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.farmfarm.member.model.VO.Member;
import edu.kh.farmfarm.postDetail.model.vo.Post;

public interface SellerService {

	
	/** 판매자 기본정보 조회
	 * @param memberNo
	 * @return memberInfo
	 */
	Member selectMemberInfo(int memberNo);

	
	/** 판매글 리스트 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectPostList(int cp, int memberNo);


	/** 게시글 등록
	 * @param post
	 * @param postImgList
	 * @param webPath
	 * @return postNo
	 * @throws IOException 
	 */
	int enrollPost(Post post, List<MultipartFile> postImgList, String webPath, String folderPath) throws IOException;


	/** 판매완료처리
	 * @param postNo
	 * @return result
	 */
	int soldoutPost(int postNo);


	/** 상품삭제처리
	 * @param postNo
	 * @return result
	 */
	int deletePost(int postNo);

	
	/** 판매글 수정페이지로 이동
	 * @param postNo
	 * @return post
	 */
	Post selectPostDetail(int postNo);

	/** 판매글 수정
	 * @param post
	 * @param postImgList
	 * @param webPath
	 * @param folderPath
	 * @param deleteList
	 * @return result
	 * @throws Exception 
	 */
	int postUpdate(Post post, List<MultipartFile> postImgList, String webPath, String folderPath, String deleteList) throws Exception;


	

}
