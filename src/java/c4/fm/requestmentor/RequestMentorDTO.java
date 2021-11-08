/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.requestmentor;

import java.io.Serializable;

/**
 *
 * @author cunpl
 */
public class RequestMentorDTO implements Serializable {

    private int requestId;
    private String userId;
    private String name;
    private String certificate;
    private String description;
    private String status;

    public RequestMentorDTO(int requestId, String userId, String name, String certificate, String description, String status) {
        this.requestId = requestId;
        this.userId = userId;
        this.name = name;
        this.certificate = certificate;
        this.description = description;
        this.status = status;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
