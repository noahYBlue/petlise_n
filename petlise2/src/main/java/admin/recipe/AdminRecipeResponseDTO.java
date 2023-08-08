package admin.recipe;

public class AdminRecipeResponseDTO {
	int count;
	String recipe_id, recipe_title, recipe_created_at, recipe_category,
			pet_category, main_category, sub_category;
	boolean recipe_of_the_month;

	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	public String getRecipe_id() {
		return recipe_id;
	}

	public void setRecipe_id(String recipe_id) {
		this.recipe_id = recipe_id;
	}

	public String getRecipe_title() {
		return recipe_title;
	}

	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}

	public String getRecipe_created_at() {
		return recipe_created_at;
	}

	public void setRecipe_created_at(String recipe_created_at) {
		this.recipe_created_at = recipe_created_at;
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

}
