package com.sonkabin.service.impl;

import com.sonkabin.entity.Skill;
import com.sonkabin.mapper.SkillMapper;
import com.sonkabin.service.SkillService;
import com.sonkabin.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author sonkabin
 * @since 2019-01-24
 */
@Service
public class SkillServiceImpl implements SkillService {
    @Autowired
    private SkillMapper skillMapper;


    @Override
    public List<String> getAllSkillNames() {
        return skillMapper.selectAllSkillNames();
    }

    @Override
    public Message getThreeSkillNames() {
        List<Skill> skills = skillMapper.selectList(null);
        List<String> frontEndSkills = new LinkedList<>();
        List<String> backEndSkills = new LinkedList<>();
        List<String> dbSkills = new LinkedList<>();
        skills.forEach((skill) -> {
            if (skill.getDomain().equals("前端")) {
                frontEndSkills.add(skill.getSkillName());
            } else if (skill.getDomain().equals("后端")) {
                backEndSkills.add(skill.getSkillName());
            } else {
                dbSkills.add(skill.getSkillName());
            }
        });
        return Message.success().put("frontEndSkills", frontEndSkills).put("backEndSkills", backEndSkills).put("dbSkills", dbSkills);
    }
}
