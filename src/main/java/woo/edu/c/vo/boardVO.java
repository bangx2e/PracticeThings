package woo.edu.c.vo;

public class boardVO {
	private int boardNum;
	private String title;
	private String boardContent;
	private String writer;
	private String writeDate;

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "boardVO [boardNum=" + boardNum + ", title=" + title + ", boardContent=" + boardContent + ", writer="
				+ writer + ", writeDate=" + writeDate + "]";
	}

}
