package c4.fm.category;

import java.io.Serializable;

/**
 *
 * @author cunpl
 */
public class CategoryDTO implements Serializable {

    private String categoryId;
    private String categoryName;

    public CategoryDTO(String categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

}
