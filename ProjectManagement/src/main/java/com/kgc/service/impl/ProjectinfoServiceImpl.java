package com.kgc.service.impl;

import com.github.pagehelper.PageHelper;
import com.kgc.mapper.ProjectinfoMapper;
import com.kgc.pojo.Projectinfo;
import com.kgc.pojo.ProjectinfoExample;
import com.kgc.service.ProjectinfoService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProjectinfoServiceImpl implements ProjectinfoService {
    @Resource
    ProjectinfoMapper projectinfoMapper;

    @Override
    public List<Projectinfo> selectBystatus(Integer status, Integer pageNum, Integer pageSize) {
        ProjectinfoExample example = new ProjectinfoExample();
        ProjectinfoExample.Criteria criteria = example.createCriteria();
        if (status != 3) {
            criteria.andStatusEqualTo(status);
        }
        PageHelper.startPage(pageNum, pageSize);
        PageHelper.orderBy("id desc");
        List<Projectinfo> projectinfos = projectinfoMapper.selectByExample(example);
        return projectinfos;
    }

    @Override
    public Projectinfo selectByid(Long id) {
        Projectinfo projectinfo = projectinfoMapper.selectByPrimaryKey(id);
        return projectinfo;
    }

    @Override
    public int upd(Projectinfo projectinfo) {
        int i = projectinfoMapper.updateByPrimaryKeySelective(projectinfo);
        return i;
    }
}
