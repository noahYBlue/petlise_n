package recipe;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

@Mapper
public interface RecipeDAO {
    public void insertRecipe(RecipeDTO recipe);      
    
    int likeUp(String recipe_id);
   	int likeDown(String recipe_id);
   	int insertLike(HashMap<String, String> map);
    int deleteLike(HashMap<String, String> map);  	
   	int likeCntRecipe(String recipe_id);
   	boolean isRecipeLiked(@Param("user_id") String user_id, @Param("recipe_id") String recipe_id);
    public void updateUserPoint(@Param("user_id") String user_id, @Param("amount") int amount);
    int updateRecipeOfMonth(@Param("recipe_id") String recipe_id, @Param("value") int value);
    
    RecipeDTO getRecipeDetailById(String recipe_id);

     
   
}
