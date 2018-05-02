package com.warehouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.bean.Userinfo;
import com.warehouse.bean.UserinfoExample;
import com.warehouse.bean.UserinfoExample.Criteria;
import com.warehouse.mapper.UserinfoMapper;
import com.warehouse.service.UserLoginService;
import com.warehouse.service.UserManageService;
import com.warehouse.utils.MD5;

@Service
public class UserManageServiceImpl implements UserManageService {

	@Autowired
	private UserinfoMapper userinfoMapper;
	
	@Override
	public Integer updatePassword(Userinfo userinfo) throws Exception {
		
		return userinfoMapper.updatePasswordByUsername(userinfo);
	}

	@Override
	public Boolean checkPasswdIsSameByUsername(Userinfo userinfo) throws Exception {
		
		UserinfoExample example=new UserinfoExample();
		Criteria criteria=example.createCriteria();
		criteria.andUsernameEqualTo(userinfo.getUsername());
		
		List<Userinfo> list=userinfoMapper.selectByExample(example);
		
		if(list.size()>0) {
			if(list.get(0).getPassword().equals(MD5.getMD5(userinfo.getPassword()))) {
				return true;
			}
		}
		
		return false;
	}
	
}
