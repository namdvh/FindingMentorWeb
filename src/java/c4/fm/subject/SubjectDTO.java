/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.subject;

import c4.fm.user.UserDTO;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author cunpl
 */
public class SubjectDTO implements Serializable {

    private int subjectId;
    private String subjectName;
    private String images;
    private String userId;
    private String categoryId;
    private String description;
    private boolean status;
    private List<UserDTO> list;

    public SubjectDTO(int subjectId, String subjectName, String images, String userId, String categoryId, String description, boolean status, List<UserDTO> list) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.images = images;
        this.userId = userId;
        this.categoryId = categoryId;
        this.description = description;
        this.status = status;
        this.list = list;
    }

    public SubjectDTO(int subjectId, String subjectName, String images, String userId, String categoryId, String description, boolean status) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.images = images;
        this.userId = userId;
        this.categoryId = categoryId;
        this.description = description;
        this.status = status;
    }

    public SubjectDTO(String subjectName, String images, String userId, String categoryId, String description, boolean status) {
        this.subjectName = subjectName;
        this.images = images;
        this.userId = userId;
        this.categoryId = categoryId;
        this.description = description;
        this.status = status;
    }

    public SubjectDTO(int subjectId, String userId) {
        this.subjectId = subjectId;
        this.userId = userId;
    }

    public List<UserDTO> getList() {
        return list;
    }

    public void setList(List<UserDTO> list) {
        this.list = list;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
