package mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

import bean.QuestionBoard;

public interface OneByOneBoardMapper {
	void insertBoard(QuestionBoard board);
	ArrayList<QuestionBoard> quesList(@Param("userID")String userID);
}
