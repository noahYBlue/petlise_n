package recipe.list;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import user.UserDTO;

@Component
public class RecipeListDTO {
	private String recipe_id, user_id, recipe_title, recipe_contents, image, recipe_category, pet_category, main_category,
			sub_category;
	private int view_cnt, likes, comments;
	private boolean recipe_of_the_month;
	private String recipe_of_the_month_registration_date;
	private Timestamp recipe_created_at, recipe_updated_at;
	private boolean is_like;
	private String limitedContent;
	private String limitedTitle;
	
	private UserDTO user;
	
		
	
	public String getLimitedTitle() {
		return limitedTitle;
	}
	public void setLimitedTitle(String limitedTitle) {
		this.limitedTitle = limitedTitle;
	}
	public String getLimitedContent() {
		return limitedContent;
	}
	public void setLimitedContent(String limitedContent) {
		this.limitedContent = limitedContent;
	}
	public boolean isRecipe_of_the_month() {
		return recipe_of_the_month;
	}
	public void setRecipe_of_the_month(boolean recipe_of_the_month) {
		this.recipe_of_the_month = recipe_of_the_month;
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
	public int getComments() {
		return comments;
	}
	public void setComments(int comments) {
		this.comments = comments;
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
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	public String getRecipe_contents() {
		return recipe_contents;
	}
	public void setRecipe_contents(String recipe_contents) {
		this.recipe_contents = recipe_contents;
	}
	public Timestamp getRecipe_created_at() {
		return recipe_created_at;
	}
	public void setRecipe_created_at(Timestamp recipe_created_at) {
		this.recipe_created_at = recipe_created_at;
	}
	public Timestamp getRecipe_updated_at() {
		return recipe_updated_at;
	}
	public void setRecipe_updated_at(Timestamp recipe_updated_at) {
		this.recipe_updated_at = recipe_updated_at;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRecipe_category() {
		return recipe_category;
	}
	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}
	public String getPet_category() {
		return pet_category;
	}
	public void setPet_category(String pet_category) {
		this.pet_category = pet_category;
	}
	public String getMain_category() {
		return main_category;
	}
	public void setMain_category(String main_category) {
		this.main_category = main_category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	
	public String getRecipe_of_the_month_registration_date() {
		return recipe_of_the_month_registration_date;
	}
	public void setRecipe_of_the_month_registration_date(String recipe_of_the_month_registration_date) {
		this.recipe_of_the_month_registration_date = recipe_of_the_month_registration_date;
	} 
	
	public UserDTO getUser() {
		return user;
	}
	public void setUser(UserDTO user) {
		this.user = user;
	}

	
}
