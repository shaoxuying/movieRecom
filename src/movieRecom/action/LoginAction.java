package movieRecom.action;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ModelDriven;

import movieRecom.pojo.User;
import movieRecom.service.UserService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/login")
public class LoginAction extends BaseAction implements ModelDriven<User> {
	
	private User user = new User();
	
	private String rememberMe;
	
	public String getRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(String rememberMe) {
		this.rememberMe = rememberMe;
	}

	@Autowired
	private UserService userService;
	
	@Override
	public User getModel() {
		return user;
	}
	
	@Action("checkLogin")
	public String checkLogin() throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
								
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUserId(), user.getUserPwd());// 封装用户名和密码
		
		if(rememberMe.equals("1")){
			System.out.println("记住我");
			token.setRememberMe(true);// 设置RememberMe
		}else{
			System.out.println("没有选记住我");
			token.setRememberMe(false);// 设置RememberMe
		}
		
		 //通过shiro登录 
		Subject currentUser = SecurityUtils.getSubject();
		try {
			currentUser.login(token);
		} catch (UnknownAccountException e) {
//			System.out.println("error1");
			out.print("error1");
			return null;
		} catch (IncorrectCredentialsException e) {
//			System.out.println("error2");
			out.print("error2");
			return null;
		}

		// 在Session范围存储用户信息
		HttpSession session = request.getSession();
		Map<String, Object> map = userService.checkUser(user);
		User userObj = (User) map.get("user");
		session.setAttribute("currId", userObj.getId());
		session.setAttribute("currUserId", userObj.getUserId());

		if(userObj.getUserRole().equals("admin")){
//			System.out.println("admin");
			out.print("admin");
		}else{
//			System.out.println("user");
			out.print("user");
		}
		
		return null;
	}
	

}
