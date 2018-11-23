package cn.sc.service.Impl;

import cn.sc.mapper.AdminMapper;
import cn.sc.pojo.Admin;
import cn.sc.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by SONG on 2018/11/18.
 */

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin getByName(String name) {
        return adminMapper.getByName(name);
    }

    @Override
    public void update(Admin admin) {
        adminMapper.update(admin);
    }
}
