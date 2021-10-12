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
public class ContentDTO {

    private int contentID;
    private String contentName;
    private int chapterID;
    private String videoURL;
    private String blog;

    public ContentDTO() {
    }

    public ContentDTO(String contentName, int chapterID, String videoURL, String blog) {
        this.contentName = contentName;
        this.chapterID = chapterID;
        this.videoURL = videoURL;
        this.blog = blog;
    }

    public ContentDTO(int contentID, String contentName, int chapterID, String videoURL, String blog) {
        this.contentID = contentID;
        this.contentName = contentName;
        this.chapterID = chapterID;
        this.videoURL = videoURL;
        this.blog = blog;
    }

    public String getContentName() {
        return contentName;
    }

    public void setContentName(String contentName) {
        this.contentName = contentName;
    }

    public String getVideoURL() {
        return videoURL;
    }

    public void setVideoURL(String videoURL) {
        this.videoURL = videoURL;
    }

    public String getBlog() {
        return blog;
    }

    public void setBlog(String blog) {
        this.blog = blog;
    }

    public int getContentID() {
        return contentID;
    }

    public int getChapterID() {
        return chapterID;
    }
}
