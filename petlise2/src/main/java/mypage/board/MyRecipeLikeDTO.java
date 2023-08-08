package mypage.board;

import org.springframework.stereotype.Component;

@Component
public class MyRecipeLikeDTO {
	String like_id, recipe_id, user_id, comment_id, like_type;
	boolean is_like;
	
	MyRecipeDTO recipe;

	public String getLike_id() {
		return like_id;
	}

	public void setLike_id(String like_id) {
		this.like_id = like_id;
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

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public boolean isIs_like() {
		return is_like;
	}

	public void setIs_like(boolean is_like) {
		this.is_like = is_like;
	}

	public MyRecipeDTO getRecipe() {
		return recipe;
	}

	public void setRecipe(MyRecipeDTO recipe) {
		this.recipe = recipe;
	}

	public String getLike_type() {
		return like_type;
	}

	public void setLike_type(String like_type) {
		this.like_type = like_type;
	}
	
	
	
}
