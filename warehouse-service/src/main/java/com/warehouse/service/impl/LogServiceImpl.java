package com.warehouse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.warehouse.bean.Log;
import com.warehouse.mapper.LogMapper;
import com.warehouse.service.LogService;

@Service
@RequestMapping("/log")
public class LogServiceImpl implements LogService {

	@Autowired
	private LogMapper logMapper;

	@Override
	public Integer insertLog(Log log) {
		return logMapper.insertSelective(log);
	}
	
	
}
