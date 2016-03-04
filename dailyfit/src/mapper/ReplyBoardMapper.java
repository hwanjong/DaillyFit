package mapper;

import org.apache.ibatis.annotations.Param;

import bean.ReplyBoard;

public interface ReplyBoardMapper {
	void insertReple(ReplyBoard board);
	ReplyBoard getRipleByNo(@Param("boardNo")int boardNo);
}
