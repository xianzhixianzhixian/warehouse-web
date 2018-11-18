package com.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.bean.Userinfo;
import com.warehouse.bean.UserinfoExample;
import com.warehouse.bean.UserinfoExample.Criteria;
import com.warehouse.mapper.UserinfoMapper;
import com.warehouse.service.UserLoginService;
import com.warehouse.utils.MD5;

@Service
public class UserLoginServiceImpl implements UserLoginService{

	@Autowired
	private UserinfoMapper userinfoMapper;
	
	@Override
	public Integer checkUserGetLevel(Userinfo user) throws Exception{
		Integer level=-1;
		UserinfoExample example=new UserinfoExample();
		Criteria criteria=example.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPasswordEqualTo(MD5.getMD5(user.getPassword()));
		
		List<Userinfo> list=userinfoMapper.selectByExample(example);
		if(list.size()>0) {
			return list.get(0).getLevel();
		}
		return level;
	}
}
