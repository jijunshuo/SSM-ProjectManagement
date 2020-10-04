package com.kgc.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.pojo.Projectinfo;
import com.kgc.service.ProjectinfoService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AppController {
    @Resource
    ProjectinfoService projectinfoService;

    @RequestMapping("/")
    public String index(Model model,
                        @RequestParam(value = "status", required = false, defaultValue = "3") Integer status,
                        @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum) {
        Integer pageSize = 3;
        List<Projectinfo> projectinfos = projectinfoService.selectBystatus(status, pageNum, pageSize);
        PageInfo<Projectinfo> projectinfoPageInfo = new PageInfo<>(projectinfos);
        model.addAttribute("projectinfoPageInfo", projectinfoPageInfo);
        return "index";
    }

    @RequestMapping("/selectByid")
    public String upd(Long id, Model model) {
        Projectinfo projectinfo = projectinfoService.selectByid(id);
        model.addAttribute("projectinfo", projectinfo);
        return "upd";
    }

    @RequestMapping("/upd")
    public String upd(Projectinfo projectinfo, HttpSession session) {
        int upd = projectinfoService.upd(projectinfo);
        if (upd > 0) {
            session.setAttribute("success", "更新成功");
        } else {
            session.setAttribute("success", "更新失败");
        }
        return "redirect:/";
    }
}
