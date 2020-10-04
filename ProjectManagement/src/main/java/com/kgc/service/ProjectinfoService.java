package com.kgc.service;

import com.kgc.pojo.Projectinfo;

import java.util.List;

public interface ProjectinfoService {
    List<Projectinfo> selectBystatus(Integer status,Integer pageNum,Integer pageSize);


    Projectinfo selectByid(Long id);

    int upd(Projectinfo projectinfo);
}
