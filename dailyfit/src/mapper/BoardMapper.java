package mapper;

import bean.Board;

public interface BoardMapper {
	void updateEvent(Board board);
	Board curEvent();
}
