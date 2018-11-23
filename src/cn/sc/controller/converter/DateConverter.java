package cn.sc.controller.converter;


import org.springframework.core.convert.converter.Converter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * Created by SONG on 2018/11/18.
 */

//需要实现Converter接口，这里是将String类型转换成Date类型
public class DateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String source) {
        //实现 将日期串转成日期类型(格式是yyyy-MM-dd HH:mm:ss)
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        if (source.indexOf("T") != -1){
            try {
                //转成直接返回
                //由于jsp页面控件使用的是html5自带控件,传进来的值形如'2018-11-18T13:56'
                //所以需要去掉中间的多余字符
                StringBuffer trueDate = new StringBuffer();
                trueDate.append(source.replace("T"," ")).append(":00");
                return simpleDateFormat.parse(trueDate.toString());
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }else {
            try {
                //转成直接返回
                //由于jsp页面控件使用的是html5自带控件,传进来的值形如'2018-11-18T13:56'
                //所以需要去掉中间的多余字符
                StringBuffer trueDate = new StringBuffer();
                trueDate.append(source).append(" ").append("00:00:00");
                return simpleDateFormat.parse(trueDate.toString());
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        //如果参数绑定失败返回null
        return null;
    }

}
