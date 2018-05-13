package com.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.warehouse.bean.Log;
import com.warehouse.bean.LogExample;
import com.warehouse.bean.LogExample.Criteria;
import com.warehouse.common.WMessage;
import com.warehouse.mapper.LogMapper;
import com.warehouse.service.LogService;
import com.warehouse.utils.TimeUtil;

@Service
@RequestMapping("/log")
public class LogServiceImpl implements LogService {

	@Autowired
	private LogMapper logMapper;

	@Override
	public Integer insertLog(Log log) {
		return logMapper.insertSelective(log);
	}

	@Override
	public Log createLog(String operator, String operationType, String operationDetail) {
		Log log=new Log();
		log.setOperatorName(operator);
		log.setOperationType(operationType);
		log.setOperationDetail(operationDetail);
		return log;
	}

	@Override
	public List<Log> selectAllLog() {
		return logMapper.selectByExample(null);
	}

	@Override
	public List<Log> selectLogByUsernameAndOperationType(String username,Integer level,String operationtype) {
		
		if(level==1) {
			LogExample example=new LogExample();
			Criteria criteria=example.createCriteria();
			criteria.andOperationTypeEqualTo(operationtype);
			return logMapper.selectByExample(example);
		}else if(level==2) {
			LogExample example=new LogExample();
			Criteria criteria=example.createCriteria();
			criteria.andOperatorNameEqualTo(username);
			criteria.andOperationTypeEqualTo(operationtype);
			return logMapper.selectByExample(example);
		}
		return null;
	}
}
