package board.petplace;


import java.util.Date;

import user.UserDTO;

public class PetPlaceCommentDTO {
	private String comment_id;
    private String user_id;
    private String place_id;
    private String comment_contents;
    private String parent_id;
    private Date comment_created_at;
    private Date comment_updated;
    private Date deleted_at;
    
    private PetPlaceLikeDTO petplacelike;
    private UserDTO user;
    private PetPlaceDTO petPlace;
    
    
    public PetPlaceLikeDTO getPetplacelike() {
		return petplacelike;
	}
	public void setPetplacelike(PetPlaceLikeDTO petplacelike) {
		this.petplacelike = petplacelike;
	}
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}
	public PetPlaceDTO getPetplace() {
		return petPlace;
	}
	public void setPetplace(PetPlaceDTO petPlace) {
		this.petPlace = petPlace;
	}
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
	public String getPlace_id() {
		return place_id;
	}
	public void setPlace_id(String place_id) {
		this.place_id = place_id;
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
	public Date getDeleted_at() {
		return deleted_at;
	}
	public void setDeleted_at(Date deleted_at) {
		this.deleted_at = deleted_at;
	}
	public static void deleteByPlaceId(String placeId) {
		// TODO Auto-generated method stub
		
	}
	


}

	
