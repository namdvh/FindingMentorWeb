/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package c4.fm.logingoole;

/**
 *
 * @author MSI
 */
public class Constant {
    public static String GOOGLE_CLIENT_ID = "380967411552-jeldl8hjr9a2ou8e3jkbvpcrinb3an5m.apps.googleusercontent.com";

	public static String GOOGLE_CLIENT_SECRET = "QhYrVXXX38o3rwWF5UG9XS1m";

	public static String GOOGLE_REDIRECT_URI = "http://localhost:8084/FindingMentor/LoginGoogleHandler";

	public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

	public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

	public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
