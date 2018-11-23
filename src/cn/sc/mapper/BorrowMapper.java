package cn.sc.mapper;

import cn.sc.pojo.Borrow;

import java.util.List;

/**
 * Created by SONG on 2018/11/23.
 */
public interface BorrowMapper {
    void add(Borrow borrow);
    List<Borrow> list(int rid);
    List<Borrow> getByMore(Borrow borrow);
    Borrow getById(int id);
    void deleteById(int id);
}
