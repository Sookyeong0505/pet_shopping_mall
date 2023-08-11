package com.shop.app.admin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.shop.app.member.entity.Member;
@Mapper
public interface AdminRepository {
	
	@Select("select * from member where member_id = #{memberId}")
	List<Member> findMemberById(String memberId);
	
	@Insert("insert into member values ()")
	int insertMember(Member member);
	
	@Update("update member set birthday =")
	int updateMember(Member member);
	
	@Delete("delete memeber where id = #{memberId}")
	int deleteMember(Member member);

}