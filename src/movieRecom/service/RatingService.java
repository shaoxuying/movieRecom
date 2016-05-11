package movieRecom.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import movieRecom.dao.RatingDao;
import movieRecom.pojo.Rating;

@Service
@Transactional(rollbackFor = Exception.class)
public class RatingService {
	
	@Autowired
	private RatingDao ratingDao;
	
	public void insert(	Rating rating){
		Map<String,String> map =new HashMap<String,String>();
		map.put("userId", rating.getUserId());
		map.put("movieId", rating.getMovieId());
		if(ratingDao.queryByUserAndMovieId(map).isEmpty()){
			ratingDao.insert(rating);
		}
		else{
			ratingDao.update(rating);
		}
	}
	
	public void delete(Integer id){
		ratingDao.delete(id);
		
	}
	
	public List<Rating> queryRatingByUserIdRankTime(String userId){
		return ratingDao.queryByUserIdRankTime(userId);
		
	}
	
	public List<Rating> queryRatingByUserIdRankRate(String userId){
		return ratingDao.queryByUserIdRankRate(userId);
		
	}

}
