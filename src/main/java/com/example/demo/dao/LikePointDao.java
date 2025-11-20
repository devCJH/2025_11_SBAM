package com.example.demo.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.dto.LikePoint;
@Mapper
public interface LikePointDao {

	@Select("""
			SELECT COUNT(*)
				FROM likePoint
				WHERE relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	int getLikePointCnt(String relTypeCode, int relId);

	@Delete("""
			DELETE FROM likePoint
				WHERE memberId = #{memberId}
				AND relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	void deleteLikePoint(int memberId, String relTypeCode, int relId);

	@Insert("""
			INSERT INTO likePoint
				SET memberId = #{memberId}
					, relTypeCode = #{relTypeCode}
					, relId = #{relId}
			""")
	void insertLikePoint(int memberId, String relTypeCode, int relId);

	@Select("""
			SELECT *
				FROM likePoint
				WHERE memberId = #{memberId}
				AND relTypeCode = #{relTypeCode}
				AND relId = #{relId}
			""")
	LikePoint getLikePoint(int memberId, String relTypeCode, int relId);
	
}
