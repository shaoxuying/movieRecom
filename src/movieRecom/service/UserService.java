package movieRecom.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import movieRecom.dao.UserDao;
import movieRecom.pojo.User;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserService {

	@Autowired
	private UserDao userDao;
	
	
	/*
	public void insert(User user) throws IOException{
		
		userDao.insert(user);
	}*/
	
	
	/**
	 * 传入用户id和密码
	 * 
	 * @return 返回1 用户名不存在 2 密码错误 3 登陆成功
	 */
	
	public Map checkUser(User user) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		User userObj = userDao.queryByUserId(user.getUserId());
//		System.out.println(userObj);
		if (userObj == null) {
			map.put("flag", 1);
		} else if (!user.getUserPwd().equals(userObj.getUserPwd())) {
			map.put("flag", 2);
		} else {
			map.put("flag", 3);
		}

		map.put("user", userObj);

		return map;
	}
	
	/**
	 * 传入用户ID
	 * @return user
	 */
	public User checkUserId(String userId){
		User user= userDao.queryByUserId(userId);
		return user;
	}
	
	public void insert(	User user){
		userDao.insert(user);
	}
	public List<String> queryUserId(int startId){
		return userDao.queryUserId(startId);
	}
		
}
