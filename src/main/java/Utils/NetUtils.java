/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;


/**
 *
 * @author 03lin
 */
public class NetUtils {
    public static String GetResult(String url){
        try {
            return Request.Get(url)
                    .setHeader("Accept-Charset","utf-8")
                    .execute().returnContent().asString();
        } catch (ClientProtocolException ex) {
            Logger.getLogger(NetUtils.class.getName()).log(Level.SEVERE,null,ex);
        } catch (IOException ex) {
            Logger.getLogger(NetUtils.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }
}
