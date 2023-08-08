package mypage.user;

public class MyTotalInfoDTO {
	
	//상품주문내역
	int orderCount;
	//상품후기
	int productCommentsCount;
	//작성한후기
	int qnaCount;
	//작성한레시피
	int recipeCount;
	//레시피후기
	int recipeCommentsCount;
	//작성한게시글
	int boardCount;
	//작성한댓글
	int boardCommentsCounts;
	
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getProductCommentsCount() {
		return productCommentsCount;
	}
	public void setProductCommentsCount(int productCommentsCount) {
		this.productCommentsCount = productCommentsCount;
	}
	public int getQnaCount() {
		return qnaCount;
	}
	public void setQnaCount(int qnaCount) {
		this.qnaCount = qnaCount;
	}
	public int getRecipeCount() {
		return recipeCount;
	}
	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}
	public int getRecipeCommentsCount() {
		return recipeCommentsCount;
	}
	public void setRecipeCommentsCount(int recipeCommentsCount) {
		this.recipeCommentsCount = recipeCommentsCount;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getBoardCommentsCounts() {
		return boardCommentsCounts;
	}
	public void setBoardCommentsCounts(int boardCommentsCounts) {
		this.boardCommentsCounts = boardCommentsCounts;
	}
}
