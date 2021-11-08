package c4.fm.registersubject;

import java.io.Serializable;

/**
 *
 * @author HuuToan
 */
public class RegisterSubjectDTO implements Serializable{
    private int subjectID;
    private String userID;
    boolean status;
    private String name;
    private String subjectName;
    private String images;
    private String description;

    public RegisterSubjectDTO() {
    }
    public RegisterSubjectDTO(int subjectID, String userID, boolean status, String name, String subjectName, String images, String description) {
        this.subjectID = subjectID;
        this.userID = userID;
        this.status = status;
        this.name = name;
        this.subjectName = subjectName;
        this.images = images;
        this.description = description;
    }
    public RegisterSubjectDTO(int subjectID, String userID, boolean status, String name) {
        this.subjectID = subjectID;
        this.userID = userID;
        this.status = status;
        this.name = name;
    }

    public RegisterSubjectDTO(String subjectName, String images, String description) {
        this.subjectName = subjectName;
        this.images = images;
        this.description = description;
    }
    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
