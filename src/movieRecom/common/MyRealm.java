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
 * �Զ���realm
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
	 * �����Ȩ��Ϣ
	 */
	protected AuthorizationInfo doGetAuthorizationInfo( PrincipalCollection principals) {
		System.out.println("������Ȩ...");
		String userName = (String)getAvailablePrincipal(principals);//��õ�ǰ�û���
		// ͨ���û���ȥ����û���������Դ��������Դ����info��
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		/*//����Ȩ��
		Set<String> p = new HashSet<String>();
		List<Map<String, Object>> list = permissionService.queryByUsername(userName);
		for(Map<String, Object> map: list){
			System.out.println("PERM_NAME: "+map.get("PERM_NAME"));
			p.add((String)map.get("PERM_NAME"));
		}
		info.setStringPermissions(p);
		
		//���ý�ɫ
		Set<String> r = new HashSet<String>();
		list = roleService.queryByUsername(userName);
		for(Map<String, Object> map: list){
			System.out.println("ROLE_NAME: "+map.get("ROLE_NAME"));
			r.add((String)map.get("ROLE_NAME"));
		}
		info.setRoles(r);*/
		
		return info;//�����û�����Ȩ��Ϣ
	}

	/**
	 * �����֤��Ϣ
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {

		System.out.println("���е�½��֤...");

		// token�д�����������û���������
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
			// �˺Ų�����
			System.out.println("�˺Ų�����");
			throw new UnknownAccountException();
		} else if (flag == 2) {
			// �������
			System.out.println("�������");
			throw new IncorrectCredentialsException();
		} else {
			// ��¼�ɹ��򷵻�info
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo( userId, password.toCharArray(), getName());
			System.out.println("ͨ����֤��");
			return info;
		}
	}


     /**
	 * ɾ����ǰ�û��Ļ���
	 * 
	 * @param userId
	 */
	public void removeUserCache(String userId) {
		SimplePrincipalCollection pc = new SimplePrincipalCollection();
		pc.add(userId, super.getName());
		super.clearCachedAuthorizationInfo(pc);
	}

}