package cn.sc.mapper;

import cn.sc.pojo.Admin;

/**
 * Created by SONG on 2018/11/17.
 */
public interface AdminMapper {
    Admin getByName(String name);
    void update(Admin admin);
}
