package cn.sc.service.Impl;

import cn.sc.mapper.BorrowMapper;
import cn.sc.pojo.Borrow;
import cn.sc.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by SONG on 2018/11/23.
 */
@Service
public class BorrowServiceImpl implements BorrowService {

    @Autowired
    BorrowMapper borrowMapper;

    @Override
    public void add(Borrow borrow) {
        borrowMapper.add(borrow);
    }

    @Override
    public List<Borrow> list(int rid) {
        return borrowMapper.list(rid);
    }

    @Override
    public List<Borrow> getByMore(Borrow borrow) {
        return borrowMapper.getByMore(borrow);
    }

    @Override
    public Borrow getById(int id) {
        return borrowMapper.getById(id);
    }

    @Override
    public void deleteById(int id) {
        borrowMapper.deleteById(id);
    }
}
