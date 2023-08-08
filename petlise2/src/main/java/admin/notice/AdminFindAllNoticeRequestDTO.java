package admin.notice;

public class AdminFindAllNoticeRequestDTO {
	String category, keyword;
	int page;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "AdminFindAllNoticeRequestDTO [category=" + category + ", keyword=" + keyword + ", page=" + page + "]";
	}

}
