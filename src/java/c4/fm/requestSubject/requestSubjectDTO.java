/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.requestSubject;

import java.io.Serializable;

/**
 *
 * @author Khang
 */
public class requestSubjectDTO implements Serializable{
    String userID;
    int requestCourseID; 
    String courseName;
    String categoryName;
    String images;
    String description;
    boolean status;

    public requestSubjectDTO(String userID, String CourseName, String CategoryName, String Images, String Description, boolean status) {
        this.userID = userID;
        this.courseName = CourseName;
        this.categoryName = CategoryName;
        this.images = Images;
        this.description = Description;
        this.status = status;
    }

    public requestSubjectDTO(String userID, int RequestCourseID, String CourseName, String CategoryName, String Images, String Description, boolean status) {
        this.userID = userID;
        this.requestCourseID = RequestCourseID;
        this.courseName = CourseName;
        this.categoryName = CategoryName;
        this.images = Images;
        this.description = Description;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public int getRequestCourseID() {
        return requestCourseID;
    }

    public void setRequestCourseID(int requestCourseID) {
        this.requestCourseID = requestCourseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    

    
}
