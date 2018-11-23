package cn.sc.service.Impl;

import cn.sc.mapper.BookMapper;
import cn.sc.pojo.Book;
import cn.sc.service.BookService;
import cn.sc.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by SONG on 2018/11/20.
 */
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    BookMapper bookMapper;

    @Override
    public List<Book> list() {
        return bookMapper.list();
    }

    @Override
    public Book getById(int id) {
        return bookMapper.getById(id);
    }

    @Override
    public void update(Book book) {
        bookMapper.update(book);
    }

    @Override
    public void insert(Book book) {
        bookMapper.insert(book);
    }

    @Override
    public void deleteById(int id) {
        bookMapper.deleteById(id);
    }

    @Override
    public List<Book> getByMore(Book book) {
        return bookMapper.getByMore(book);
    }

    @Override
    public List<String> getAllAuthor() {
        return bookMapper.getAllAuthor();
    }
}
