/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier.Builder;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import java.io.IOException;

import java.security.GeneralSecurityException;
import java.util.Collections;
import DTO.AccountInfo;

/**
 *
 * @author Minh
 */
public class GoogleSignIn {

    private static final String CLIENT_ID = "15935712647-nge50dcde86pqvnulkvpiumetofdu05r.apps.googleusercontent.com";

    public static AccountInfo authenticate(String idTokenString) throws IOException {
        try {
            // Set up the Google ID token verifier
            GoogleIdTokenVerifier verifier = new Builder(GoogleNetHttpTransport.newTrustedTransport(), JacksonFactory.getDefaultInstance())
                    //                    chỗ này thay bằng biến constant
                    .setAudience(Collections.singletonList(CLIENT_ID))
                    .build();

            // Verify the ID token
            GoogleIdToken idToken = verifier.verify(idTokenString);
            if (idToken != null) {
                Payload payload = idToken.getPayload();

                // Get the user's Google account information
                String email = payload.getEmail();
                String name = (String) payload.get("name");
             
//                String pictureUrl = (String) payload.get("picture");
                return new AccountInfo(email, name);
            } else {
                // Invalid token
                return null;
            }
        } catch (GeneralSecurityException | IllegalArgumentException | IOException e) {
            // Error occurred while verifying the token
            return null;
        }
    }

}
