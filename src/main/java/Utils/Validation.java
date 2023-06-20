/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.util.regex.Pattern;

/**
 *
 * @author 03lin
 */
public class Validation {
    public static boolean readNonBlank(String s) {
        if(s == null || s.isEmpty()){
            return false;
        }
        return true;
    }
    
    public static boolean readInteger(int s) {
        if(s >0 && s<Integer.MAX_VALUE){
            return true;
        }
        return false;
    }
    public static boolean readFloat(String s) {
        String regex = "\\d+(\\.\\d+)?";  
        if(s.matches(regex)){
            return true;
        }else{
            return false;
        }
    }
     public static boolean readPassword(String s) {
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>])(?=\\S+$).{8,20}$";  
        if(s.matches(regex)){
            return true;
        }else{
            return false;
        }
    }
    public static boolean readEmail(String s) {
        String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+(?:\\.[a-zA-Z0-9_!#$%&'*+/=?`{|}~^-]+)*@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$";  
        if(s.matches(regex)){
            return true;
        }else{
            return false;
        }
    }
}
