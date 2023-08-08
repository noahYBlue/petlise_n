package board;


import java.util.Date;

import user.UserDTO;

public class BoardCommentDTO {
	
	
	private String comment_id;
    private String user_id;
    private String board_id;
    private String comment_contents;
    private String parent_id;
    private Date comment_created_at;
    private Date comment_updated;
    private Date deleted_at;
   
    private UserDTO user;
    private BoardDTO board;
    
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public Date getComment_created_at() {
		return comment_created_at;
	}
	public void setComment_created_at(Date comment_created_at) {
		this.comment_created_at = comment_created_at;
	}
	public Date getComment_updated() {
		return comment_updated;
	}
	public void setComment_updated(Date comment_updated) {
		this.comment_updated = comment_updated;
	}
	public BoardDTO getBoard() {
		return board;
	}
	public void setBoard(BoardDTO board) {
		this.board = board;
	}
	public Date getDeleted_at() {
		return deleted_at;
	}
	public void setDeleted_at(Date deleted_at) {
		this.deleted_at = deleted_at;
	}
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}
	
	
    
}