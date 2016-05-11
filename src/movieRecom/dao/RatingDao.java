package movieRecom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movieRecom.pojo.Rating;


@Repository
public class RatingDao {

	@Autowired
	private SqlSessionFactory factory;
	
	public void insert(Rating rating) {
		SqlSession session = factory.openSession();
		session.insert("RATING.insert", rating);
	}
	
	public void update(Rating rating) {
		SqlSession session = factory.openSession();
		session.update("RATING.update", rating);
	}
	
	public void delete(Integer id) {
		SqlSession session = factory.openSession();
		session.delete("RATING.delete", id);
	}
	
	public List<Rating> queryByUserIdRankTime(String userId) {
		SqlSession session = factory.openSession();
		return session.selectList("RATING.queryByUserIdRankTime", userId);
	}
	
	public List<Rating> queryByUserIdRankRate(String userId) {
		SqlSession session = factory.openSession();
		return session.selectList("RATING.queryByUserIdRankRate", userId);
	}
	
	public List<Rating> queryByUserAndMovieId(Map map) {
		SqlSession session = factory.openSession();
		return session.selectList("RATING.queryByUserAndMovieId", map);
	}
}
