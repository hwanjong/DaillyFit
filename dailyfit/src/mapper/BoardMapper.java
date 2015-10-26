package mapper;

import java.util.ArrayList;

import bean.Board;

public interface BoardMapper {
	void updateEvent(Board board);
	ArrayList<Board> noticeList();
	ArrayList<Board> ADList();
	void insertNotice(Board board);
	Board curEvent();
	Board getNotice(Board Board);
	void updateNotice(Board board);
	void deleteNotice(Board board);
	void insertQestion(Board board);
}
