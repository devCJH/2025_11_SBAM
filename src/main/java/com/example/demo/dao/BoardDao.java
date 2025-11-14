package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
@Mapper
public interface BoardDao {

	@Select("""
			SELECT boardName
				FROM board
				WHERE id = #{boardId}
			""")
	String getBoardNameById(int boardId);
}
