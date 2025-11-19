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
					, boardId = #{boardId}
			""")
	public void writeArticle(String title, String content, int loginedMemberId, int boardId);

	@Select("""
			<script>
			SELECT a.id, a.regDate, a.title, m.loginId AS `writerName`
			    FROM article AS a
			    INNER JOIN `member` AS m
			    ON a.memberId = m.id
			    WHERE a.boardId = #{boardId} 
				<if test="keyword != null and keyword != ''">
					AND a.title LIKE CONCAT('%', #{keyword}, '%')
				</if>
			    ORDER BY a.id DESC
			    LIMIT #{limitFrom}, #{itemsInAPage}
			 </script>
			""")
	public List<Article> showList(int boardId, int limitFrom, int itemsInAPage, String keyword);

	@Select("""
			SELECT a.*, m.loginId AS `writerName`
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
	
	@Select("""
			<script>
			SELECT COUNT(id)
				FROM article
				WHERE boardId = #{boardId}
				<if test="keyword != ''">
			    	AND title LIKE CONCAT('%', #{keyword}, '%')
			    </if>
			 </script>
			""")
	public int getArticlesCnt(int boardId, String keyword);
	
	@Select("""
			SELECT COUNT(*) FROM likeIt 
				WHERE memberID = #{memberId} AND relID = #{relId}
			""")
	public int likeStatus(int memberId, int relId);
	
	@Select("""
			SELECT COUNT(*) FROM likeIt
				WHERE relId = #{relId}
			""")
	public int likeCount(int relId);
	
	@Insert("""
			INSERT INTO likeIt(memberId, relId)
				VALUES (#{memberId}, #{relId})
			""")
	public void likePlus(int memberId, int relId);
	
	@Delete("""
			DELETE FROM likeIt
				WHERE memberId = #{memberId} AND relId = #{relId}
			""")
	public void dislike(int memberId, int relId);

}