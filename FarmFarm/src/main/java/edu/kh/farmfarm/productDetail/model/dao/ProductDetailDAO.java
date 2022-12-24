package edu.kh.farmfarm.productDetail.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.farmfarm.productDetail.model.vo.Product;
import edu.kh.farmfarm.productDetail.model.vo.Review;
import edu.kh.farmfarm.productDetail.model.vo.ReviewImg;
import edu.kh.farmfarm.productDetail.model.vo.ReviewPagination;

@Repository
public class ProductDetailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	/** 상품 조회
	 * @param param
	 * @return product
	 */
	public Product selectProduct(Product param) {
				
		return sqlSession.selectOne("productDetailMapper.selectProduct", param);
	}

	
	
	/** 리뷰 개수 조회
	 * @param param
	 * @return
	 */
	public int reviewCount(Product param) {
		
		return sqlSession.selectOne("productDetailMapper.reviewCount", param);
	}

	
	
	/** 리뷰 목록 조회
	 * @param param
	 * @param pagination
	 * @return reviewList
	 */
	public List<Review> selectReviewList(Product param, ReviewPagination pagination) {
		
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		
		return sqlSession.selectList("productDetailMapper.selectReviewList", param, rowBounds);
		
	}



	public int addWish(Product product) {
		return sqlSession.insert("productDetailMapper.addWish", product);
	}



	public int removeWish(Product product) {
		return sqlSession.delete("productDetailMapper.removeWish", product);
	}



	public Review selectReview(Map<String, Object> map) {
		return sqlSession.selectOne("productDetailMapper.selectReview", map);
	}



	public List<Review> selectImgReview(int productNo) {
		return sqlSession.selectList("productDetailMapper.selectImgReview", productNo);
	}



	/** 리뷰 도움돼요 추가
	 * @param map
	 * @return
	 */
	public int addHelp(Map<String, Object> map) {
		return sqlSession.insert("productDetailMapper.addHelp", map);
	}



	/** 리뷰 도움돼요 취소
	 * @param map
	 * @return
	 */
	public int removeHelp(Map<String, Object> map) {
		return sqlSession.delete("productDetailMapper.removeHelp", map);
	}



	public int reviewCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("productDetailMapper.reviewCount", paramMap);
	}



	public List<Review> selectReviewList(Map<String, Object> paramMap, ReviewPagination pagination) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		
		return sqlSession.selectList("productDetailMapper.selectReviewList", paramMap, rowBounds);
	}



}
