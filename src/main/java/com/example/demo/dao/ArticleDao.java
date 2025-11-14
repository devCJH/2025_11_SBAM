package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.Article;
@Mapper
public interface ArticleDao {

	@Insert("""
			INSERT INTO article
				SET regDate = NOW()
					, updateDate = NOW()
					, memberId = #{loginedMemberId}
					, title = #{title}
					, content = #{content}
			""")
	public void writeArticle(String title, String content, int loginedMemberId);

	@Select("""
			SELECT a.id
			        , a.regDate
			        , a.title
			        , m.loginId AS `writerName`
			    FROM article AS a
			    INNER JOIN `member` AS m
			    ON a.memberId = m.id
			    WHERE a.boardId = #{boardId}
			    ORDER BY a.id DESC
			""")
	public List<Article> showList(int boardId);

	@Select("""
			SELECT a.*
					, m.loginId AS `writerName`
				FROM article AS a
			    INNER JOIN `member` AS m
			    ON a.memberId = m.id
				WHERE a.id = #{id}
			""")
	public Article getArticleById(int id);

	@Update("""
			<script>
			UPDATE article
				SET updateDate = NOW()
					<if test="title != null and title != ''">
						, title = #{title}
					</if>
					<if test="content != null and content != ''">
						, content = #{content}
					</if>
				WHERE id = #{id}
			</script>
			""")
	public void modifyArticle(int id, String title, String content);

	@Delete("""
			DELETE FROM article
				WHERE id = #{id}
			""")
	public void deleteArticle(int id);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();
}
