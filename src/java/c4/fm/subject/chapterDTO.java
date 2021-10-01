/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.subject;

/**
 *
 * @author hoang
 */
public class chapterDTO {
    private int chapterID;
    private int subjectID;
    private String chapterName;
    private String description;

    public chapterDTO(int chapterID, int subjectID, String chapterName, String description) {
        this.chapterID = chapterID;
        this.subjectID = subjectID;
        this.chapterName = chapterName;
        this.description = description;
    }

    public chapterDTO() {
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getChapterID() {
        return chapterID;
    }

    public int getSubjectID() {
        return subjectID;
    }
    
}
