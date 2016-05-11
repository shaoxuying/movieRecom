package movieRecom.common;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import movieRecom.pojo.User;
import movieRecom.service.UserService;



/**
 * 自定义realm
 */
public class MyRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;
	
	/*@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private PermissionService permissionService;
	@Autowired
	private RoleService roleService;

	*//**
	 * 获得授权信息
	 */
	protected AuthorizationInfo doGetAuthorizationInfo( PrincipalCollection principals) {
		System.out.println("进行授权...");
		String userName = (String)getAvailablePrincipal(principals);//获得当前用户名
		// 通过用户名去获得用户的所有资源，并把资源存入info中
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		/*//设置权限
		Set<String> p = new HashSet<String>();
		List<Map<String, Object>> list = permissionService.queryByUsername(userName);
		for(Map<String, Object> map: list){
			System.out.println("PERM_NAME: "+map.get("PERM_NAME"));
			p.add((String)map.get("PERM_NAME"));
		}
		info.setStringPermissions(p);
		
		//设置角色
		Set<String> r = new HashSet<String>();
		list = roleService.queryByUsername(userName);
		for(Map<String, Object> map: list){
			System.out.println("ROLE_NAME: "+map.get("ROLE_NAME"));
			r.add((String)map.get("ROLE_NAME"));
		}
		info.setRoles(r);*/
		
		return info;//返回用户的授权信息
	}

	/**
	 * 获得认证信息
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {

		System.out.println("进行登陆验证...");

		// token中储存着输入的用户名和密码
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String userId = upToken.getUsername();
		String password = String.valueOf(upToken.getPassword());
		
		
		User user=new User();

		user.setUserId(userId);
		user.setUserPwd(password);
		
		Map map = userService.checkUser(user);
		int flag = (Integer) map.get("flag");
		// System.out.println("flag: "+flag);
		if (flag == 1) {
			// 账号不存在
			System.out.println("账号不存在");
			throw new UnknownAccountException();
		} else if (flag == 2) {
			// 密码错误
			System.out.println("密码错误");
			throw new IncorrectCredentialsException();
		} else {
			// 登录成功则返回info
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo( userId, password.toCharArray(), getName());
			System.out.println("通过验证！");
			return info;
		}
	}


     /**
	 * 删除当前用户的缓存
	 * 
	 * @param userId
	 */
	public void removeUserCache(String userId) {
		SimplePrincipalCollection pc = new SimplePrincipalCollection();
		pc.add(userId, super.getName());
		super.clearCachedAuthorizationInfo(pc);
	}

}