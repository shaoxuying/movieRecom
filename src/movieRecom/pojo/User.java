package movieRecom.pojo;

public class User {

	private Integer id;
	private String  userId;
	private String  userPwd;
	private String  userRole;
	
	
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	
	public User() {
		super();
	}
	
	
	public User(String userId, String userPwd, String userRole) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userRole = userRole;
	}
	public User(Integer id, String userId, String userPwd, String userRole) {
		super();
		this.id = id;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userRole = userRole;
	}
	public User(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	
	public User(String userId) {
		super();
		this.userId = userId;
		this.userPwd= "123456";
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userId=" + userId + ", userPwd=" + userPwd + ", userRole=" + userRole + "]";
	}
	


}
