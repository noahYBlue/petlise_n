package recipe.detail;

import java.util.Date;

public class RecipeCommentDTO {
	
	String comment_id, recipe_id, user_id, comment_contents, comment_image, parent_id, profile_image, name;
	Date comment_created_at;
	
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(String recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
	}
	public String getComment_image() {
		return comment_image;
	}
	public void setComment_image(String comment_image) {
		this.comment_image = comment_image;
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
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	
}
