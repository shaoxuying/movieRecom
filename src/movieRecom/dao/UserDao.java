package movieRecom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movieRecom.pojo.User;

@Repository
public class UserDao {

	@Autowired
	private SqlSessionFactory factory;
	
	public void insert(User user) {
		SqlSession session = factory.openSession();
		session.insert("USER.insert", user);
	}
	
	public User queryByUserId(String userId) {
		SqlSession session = factory.openSession();
		return session.selectOne("USER.queryByUserId", userId);
	}

	public List<String> queryUserId(int startId){
		SqlSession session = factory.openSession();
		Map<String,Integer> map =new HashMap<String,Integer>();
		map.put("startId", startId);
		map.put("endId", startId+29);
		return session.selectList("USER.queryUserId",map);
	}
	
	
}
