package admin.recipe;

public class AdminFindAllRecipeRequestDTO {
	String recipe_category, pet_category, main_category, keyword, name;
	boolean recipe_of_the_month;
	int page;
	
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isRecipe_of_the_month() {
		return recipe_of_the_month;
	}
	public void setRecipe_of_the_month(boolean recipe_of_the_month) {
		this.recipe_of_the_month = recipe_of_the_month;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

}
