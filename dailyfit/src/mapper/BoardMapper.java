package mapper;

import java.util.ArrayList;

import bean.Board;

public interface BoardMapper {
	void updateEvent(Board board);
	ArrayList<Board> noticeList();
	void insertNotice(Board board);
	Board curEvent();
}
