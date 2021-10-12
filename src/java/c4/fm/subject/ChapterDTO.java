/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.subject;

import java.util.List;
/**
 *
 * @author hoang
 */
public class ChapterDTO {
    private int chapterID;
    private int subjectID;
    private String chapterName;
    private String description;
    private List<ContentDTO> list;
                          
    public ChapterDTO(int chapterID, int subjectID, String chapterName, String description) {
        this.chapterID = chapterID;
        this.subjectID = subjectID;
        this.chapterName = chapterName;
        this.description = description;
    }

    public ChapterDTO(int chapterID, int subjectID, String chapterName, String description, List<ContentDTO> list) {
        this.chapterID = chapterID;
        this.subjectID = subjectID;
        this.chapterName = chapterName;
        this.description = description;
        this.list = list;
    }

    public ChapterDTO() {
    }

    public List<ContentDTO> getList() {
        return list;
    }

    public void setList(List<ContentDTO> list) {
        this.list = list;
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
