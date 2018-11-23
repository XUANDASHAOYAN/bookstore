package cn.sc.service;

import cn.sc.pojo.Reader;

/**
 * Created by SONG on 2018/11/18.
 */
public interface ReaderService {
    Reader getByName(String name);
    void add(Reader reader);
    void update(Reader reader);
    void updatePWD(Reader reader);
}
