package admin.recipe;

public class AdminRecipeRequestDTO {
	String user_id, recipe_title, recipe_contents, image,
			recipe_category, pet_category, main_category, sub_category;
	boolean recipe_of_the_month;

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

	public boolean isRecipe_of_the_month() {
		return recipe_of_the_month;
	}

	public void setRecipe_of_the_month(boolean recipe_of_the_month) {
		this.recipe_of_the_month = recipe_of_the_month;
	}

	@Override
	public String toString() {
		return "AdminRecipeRequestDTO [user_id=" + user_id + ", recipe_title=" + recipe_title + ", recipe_contents="
				+ recipe_contents + ", image=" + image + ", recipe_category=" + recipe_category + ", pet_category="
				+ pet_category + ", main_category=" + main_category + ", sub_category=" + sub_category
				+ ", recipe_of_the_month=" + recipe_of_the_month + "]";
	}

}
