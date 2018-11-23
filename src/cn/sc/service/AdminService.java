package cn.sc.service;


import cn.sc.pojo.Admin;

/**
 * Created by SONG on 2018/11/18.
 */
public interface AdminService {
    Admin getByName(String name);
    void update(Admin admin);
}
