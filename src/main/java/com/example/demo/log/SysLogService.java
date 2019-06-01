package com.example.demo.log;

import com.example.demo.entity.SysLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class SysLogService {
    @Autowired
    private SysLogMapper sysLogMapper;

    public void save(SysLog log) {
        sysLogMapper.save(log);
    }

    public List<SysLog> findAll() {
        return sysLogMapper.findAll();
    }
}
