package mypage.board;

import java.util.Date;

public class MyQnADTO {
    private String notice_id;
    private String user_id;
    private String title;
    private String contents;
    private String writer;
    private Date qna_created;
    private int view_count;
    private int like;
    private String category;
    
    private boolean is_answer;
    
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getQna_created() {
		return qna_created;
	}
	public void setQna_created(Date qna_created) {
		this.qna_created = qna_created;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public boolean isIs_answer() {
		return is_answer;
	}
	public void setIs_answer(boolean is_answer) {
		this.is_answer = is_answer;
	}
    
    
}