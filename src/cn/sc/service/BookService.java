package cn.sc.service;

import cn.sc.pojo.Book;
import cn.sc.util.Page;

import java.util.List;

/**
 * Created by SONG on 2018/11/20.
 */
public interface BookService {
    List<Book> list();
    Book getById(int id);
    void update(Book book);
    void insert(Book book);
    void deleteById(int id);
    List<Book> getByMore(Book book);
    List<String> getAllAuthor();
}
