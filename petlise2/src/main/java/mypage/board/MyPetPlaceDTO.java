package mypage.board;

import java.util.Date;

import user.UserDTO;

public class MyPetPlaceDTO {
	private String place_id;
	private String user_id;
	private String title;
	private int view_count;
	private String category;
	private String petplace_contents;
	private String petplace_address;
	private Date petplace_created;
	private Date petplace_updated;
	private Date deleted_at;
	private int seq;
	private int likes;

	public String getPlace_id() {
		return place_id;
	}

	public void setPlace_id(String place_id) {
		this.place_id = place_id;
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

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPetplace_contents() {
		return petplace_contents;
	}

	public void setPetplace_contents(String petplace_contents) {
		this.petplace_contents = petplace_contents;
	}

	public String getPetplace_address() {
		return petplace_address;
	}

	public void setPetplace_address(String petplace_address) {
		this.petplace_address = petplace_address;
	}

	public Date getPetplace_created() {
		return petplace_created;
	}

	public void setPetplace_created(Date petplace_created) {
		this.petplace_created = petplace_created;
	}

	public Date getPetplace_updated() {
		return petplace_updated;
	}

	public void setPetplace_updated(Date petplace_updated) {
		this.petplace_updated = petplace_updated;
	}

	public Date getDeleted_at() {
		return deleted_at;
	}

	public void setDeleted_at(Date deleted_at) {
		this.deleted_at = deleted_at;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

}