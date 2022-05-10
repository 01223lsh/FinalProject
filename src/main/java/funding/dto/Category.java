package funding.dto;

public class Category {
	
	private int CategoryNo;
	private String CategoryName;
	
	@Override
	public String toString() {
		return "Category [CategoryNo=" + CategoryNo + ", CategoryName=" + CategoryName + "]";
	}

	public int getCategoryNo() {
		return CategoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		CategoryNo = categoryNo;
	}

	public String getCategoryName() {
		return CategoryName;
	}

	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	
	

}
