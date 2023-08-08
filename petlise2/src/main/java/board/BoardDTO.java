package board;

import java.util.Date;


import user.UserDTO;
public class BoardDTO {
    private String board_id;
    private String user_id;

	private String board_title;
    private String board_contents;
    private Date board_created;
    private Date board_updated;
    private int board_view;
    private Date deleted_at;
    private int comments;
    private int seq;
    private UserDTO user;
    private BoardLikeDTO boardlike;
    private BoardCommentDTO boardcomment;
    
    public BoardCommentDTO getBoardcomment() {
    	return boardcomment;
    }
    
    public BoardLikeDTO getBoardlike() {
		return boardlike;
	}

	public void setBoardlike(BoardLikeDTO boardlike) {
		this.boardlike = boardlike;
	}

	public void setBoardcomment(BoardCommentDTO boardcomment) {
    	this.boardcomment = boardcomment;
    }
    public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_contents() {
		return board_contents;
	}

	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}

	public Date getBoard_created() {
		return board_created;
	}

	public void setBoard_created(Date board_created) {
		this.board_created = board_created;
	}

	public Date getBoard_updated() {
		return board_updated;
	}

	public void setBoard_updated(Date board_updated) {
		this.board_updated = board_updated;
	}

	public int getBoard_view() {
		return board_view;
	}

	public void setBoard_view(int board_view) {
		this.board_view = board_view;
	}

	public Date getDeleted_at() {
		return deleted_at;
	}

	public void setDeleted_at(Date deleted_at) {
		this.deleted_at = deleted_at;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	

}