/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.logingoole;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author MSI
 */
public class GoogleUtils {
    public static String getToken(String code) throws IOException {
        String response = Request.Post(Constant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constant.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constant.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constant.GOOGLE_REDIRECT_URI)
                        .add("code", code).add("grant_type", Constant.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj=new Gson().fromJson(response, JsonObject.class  );
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }
    public static UserGoogleDto getUserInfo(String accessToken) throws IOException{
        String link=Constant.GOOGLE_LINK_GET_USER_INFO+accessToken;
        String respone=Request.Get(link).execute().returnContent().asString();
        UserGoogleDto user= new Gson().fromJson(respone, UserGoogleDto.class);
        System.out.println(user);
        return user;
        
    }
}
