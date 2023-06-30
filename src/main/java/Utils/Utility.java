/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.text.SimpleDateFormat;

import java.text.ParseException;
import java.util.Date;

/**
 *
 * @author Minh
 */
public class Utility {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    private static final String pattern = "^\\d{1,2}/\\d{1,2}/\\d{4}$";

    public Utility() {
    }

    public static Date handleParseDate(String inputDate) {
        try {
            sdf.setLenient(false);
            Date date = sdf.parse(inputDate);
            return date;
        } catch (ParseException e) {
            return null;
        }
    }

    public static boolean isValidUsingDate(Date importDate, Date usingDate) {
        if (!usingDate.after(importDate)) {
            return false;
        } else {
            return true;
        }
    }

    public static boolean isValidImportDate(Date importDate) {
        Date today = new Date();
        return importDate.after(today);
    }

    public static String getPattern() {
        return pattern;
    }

    public static SimpleDateFormat getSdf() {
        return sdf;
    }
}
