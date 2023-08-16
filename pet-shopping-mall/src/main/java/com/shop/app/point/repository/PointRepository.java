package com.shop.app.point.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.shop.app.point.entity.Point;

@Mapper
public interface PointRepository {

	// 포인트 전체 조회 (예라)
	@Select("select * from point order by point_id desc")
	List<Point> findPointAll(Point point);

	// 회원가입 포인트 적립 (예라)
	@Insert("insert into point (point_id, point_member_id, point_current, point_type, point_amount, point_date) values (seq_point_id.nextval, #{pointMemberId}, #{pointCurrent}, #{pointType}, #{pointAmount}, default)")
	int insertPoint(Point point);
	
	// 리뷰 쓴 사용자 포인트 적립을 위해 아이디 조회 (예라)
	@Select("select * from (select * from review where review_member_id = #{reviewMemberId} order by review_created_at desc) where rownum <= 1")
	Point findReviewPointMemberById(String reviewMemberId);
	
	// 리뷰 포인트 적립 (예라)
	int updatePoint(Point points);

	
}
