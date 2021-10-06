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
    private String useriD;
    private int chapterID;
    private String videoURL;
    private String blog;

    public ContentDTO(int contentID, String useriD, int chapterID, String videoURL, String blog) {
        this.contentID = contentID;
        this.useriD = useriD;
        this.chapterID = chapterID;
        this.videoURL = videoURL;
        this.blog = blog;
    }

    public ContentDTO() {
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

    public String getUseriD() {
        return useriD;
    }

    public int getChapterID() {
        return chapterID;
    }
    
}
