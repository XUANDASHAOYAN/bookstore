package cn.sc.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by SONG on 2018/11/20.
 */
public class ConvertDate {

    public static Date parseDate (String sourceDate){
        SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
        Date date = null;
        //java.util.Date对象
        try{
            date = (Date) sdf.parse(sourceDate);
        }catch (ParseException e){
            e.printStackTrace();
        }
        System.out.println(date);
        return date;
    }
}
