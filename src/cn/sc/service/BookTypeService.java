package cn.sc.service;

import cn.sc.pojo.BookType;

import java.util.List;

/**
 * Created by SONG on 2018/11/20.
 */
public interface BookTypeService {
    BookType getById(int tid);
    void update(BookType bookType);
    BookType getByName(String name);
    List<String> getAll();
}
