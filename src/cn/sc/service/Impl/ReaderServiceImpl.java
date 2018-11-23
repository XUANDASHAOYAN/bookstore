package cn.sc.service.Impl;

import cn.sc.mapper.ReaderMapper;
import cn.sc.pojo.Reader;
import cn.sc.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by SONG on 2018/11/18.
 */
@Service
public class ReaderServiceImpl implements ReaderService{

    @Autowired
    ReaderMapper readerMapper;

    @Override
    public Reader getByName(String name) {
        return readerMapper.getByName(name);
    }

    @Override
    public void add(Reader reader) {
        readerMapper.add(reader);
    }

    @Override
    public void update(Reader reader) {
        readerMapper.update(reader);
    }

    @Override
    public void updatePWD(Reader reader) {
        readerMapper.updatePWD(reader);
    }
}
