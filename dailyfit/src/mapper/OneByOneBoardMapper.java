package mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

import bean.QuestionBoard;

public interface OneByOneBoardMapper {
	void insertBoard(QuestionBoard board);
	ArrayList<QuestionBoard> quesListByUserId(@Param("userID")String userID);
	ArrayList<QuestionBoard> quesList();
	QuestionBoard quesItem(@Param("boardNo")int no);
	void updateRecieveRelpy(@Param("boardNo")int no);
}
