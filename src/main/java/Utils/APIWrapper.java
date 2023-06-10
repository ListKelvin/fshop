/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import DTO.AccountInfo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;

/**
 *
 * @author 03lin
 */
public class APIWrapper {
    private static String appID = "6126359010808248";
    private static String appSerect = "914d2033816e46ae3d8c0b6ea0347cf6";
    private static String redirectURL = "http://localhost:8080/PRJ301_FShop/FacebookServlet";
    private String accessToken;
    private Gson gson;

    public APIWrapper() {
        gson = new Gson();
    }
    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }
    
    
    
    public static String getDiaLogLink(){
        String dialogLink = "https://www.facebook.com/v17.0/dialog/oauth?client_id=%s&redirect_uri=%s";
        return String.format(dialogLink, appID, redirectURL);
    }
    
    public String getAccessToken(String code){
        String accessTokenLink = "https://graph.facebook.com/oauth/access_token?"
                +"client_id=%s"
                +"&client_secret=%s"
                +"&redirect_uri=%s"
                +"&code=%s";
        accessTokenLink = String.format(accessTokenLink, appID,appSerect,redirectURL, code);
        String result = NetUtils.GetResult(accessTokenLink);
        JsonObject jobj = new Gson().fromJson(result, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
      
//        String token = result.substring(result.indexOf(":") + 3, result.indexOf("\""));
//        return token;
    }
    
    public AccountInfo getAccountInfo(){
        String infoUrl= "https://graph.facebook.com/me?access_token=%s";
        infoUrl = String.format(infoUrl, this.accessToken);
        String result = NetUtils.GetResult(infoUrl);

        AccountInfo accountInfo = gson.fromJson(result, AccountInfo.class);
        return accountInfo;
    }
}
