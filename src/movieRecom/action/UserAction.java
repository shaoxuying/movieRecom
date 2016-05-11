package movieRecom.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;

import movieRecom.pojo.User;
import movieRecom.service.UserService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/user")
public class UserAction extends BaseAction implements ModelDriven<User>{
	
	private User user=new User();
	
	@Autowired
	private UserService userService;
	
	int startId;
	
	public int getStartId() {
		return startId;
	}

	public void setStartId(int startId) {
		this.startId = startId;
	}

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Action("checkUserId")
	public String checkUserId() throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		User u= userService.checkUserId(user.getUserId());
		if(u!=null){
			out.write("false");
			return null;
		}
		out.write("ok");
		return null;
	}
	
	
	@Action(value = "queryUserId", results = { @Result(name = "success", location = "/pages/adminIndex.jsp", type = "dispatcher") })
	public String queryUserId() throws IOException{
		System.out.println("startId="+startId);
		
		List<String> userIdList = userService.queryUserId(startId);
		request.setAttribute("userIdList", userIdList);
		request.setAttribute("nextStartId", startId+30);
		return "success";
	}


	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

}
