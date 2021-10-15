package com.morganj.memo.user.bo;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morganj.memo.common.EncryptUtils;
import com.morganj.memo.user.dao.UserDAO;
import com.morganj.memo.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int signUp(String loginId, String password, String name, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUP] 암호화 실패!");
			return 0;
		}
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectCountById(loginId) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User signIn(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		//암호
		
		return userDAO.selectUserByIdPassword(loginId, encryptPassword);
	
	}
}
