package cn.sc.service.Impl;

import cn.sc.mapper.BookTypeMapper;
import cn.sc.pojo.BookType;
import cn.sc.service.BookTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by SONG on 2018/11/20.
 */
@Service
public class BookTypeServiceImpl implements BookTypeService{
    @Autowired
    BookTypeMapper bookTypeMapper;

    @Override
    public BookType getById(int tid) {
        return bookTypeMapper.getById(tid);
    }

    @Override
    public void update(BookType bookType) {
        bookTypeMapper.update(bookType);
    }

    @Override
    public BookType getByName(String name) {
        return bookTypeMapper.getByName(name);
    }

    @Override
    public List<String> getAll() {
        return bookTypeMapper.getAll();
    }
}
