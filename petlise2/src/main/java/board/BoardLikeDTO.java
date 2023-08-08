package board;


public class BoardLikeDTO {
    private String like_id;
    private String user_id;
    private String board_id;
    private String comment_id;
    private String like_type;
    private boolean is_like;
    private int likes;
	public String getLike_id() {
		return like_id;
	}
	public void setLike_id(String like_id) {
		this.like_id = like_id;
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
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getLike_type() {
		return like_type;
	}
	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}
	public boolean isIs_like() {
		return is_like;
	}
	public void setIs_like(boolean is_like) {
		this.is_like = is_like;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
}