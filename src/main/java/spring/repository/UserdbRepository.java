package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import spring.model.UserBean;
import spring.model.LoginBean;


public class UserdbRepository {
	
	public UserBean loginUser(LoginBean bean) {
		
		UserBean user=null;
		
		Connection con = ConnectionClass.getConnection();
		try {
		PreparedStatement ps =con.prepareStatement("select * from user where username=?,email=?,password=? and gender=?;");
		ps.setString(1, bean.getUserEmail());
		ps.setString(2, bean.getPassword());
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			user=new UserBean();
			user.setUserId(rs.getInt("id"));
			user.setUserName(rs.getString("name"));
			user.setUserEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			
		}
		
		
		}catch(SQLException e) {
			System.out.println("User Select :"+e.getMessage());
	}
	
		return user;
		
	}
	
	public int addUser(UserBean bean) {
		int result=0;
		Connection con = ConnectionClass.getConnection();
		if (!checkEmail(bean.getUserEmail())) {
			
		try {
		PreparedStatement ps =con.prepareStatement("insert into user(username,email,password,gender,role) values(?,?,?,?,?)");
		ps.setString(1, bean.getUserName());
		ps.setString(2, bean.getUserEmail());
		ps.setString(3, bean.getPassword());
		ps.setString(4, bean.getGender());
		ps.setString(5, bean.getUserRole());
		result=ps.executeUpdate();
		}catch(SQLException e) {
				System.out.println("user insert :"+e.getMessage());
		}
		
		}else {
			System.out.println("Email already exits!!");	
		}
		
		return result;
	}
	
	public boolean checkEmail(String UserEmail) {
		boolean status=false;
		
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select email from user where email=?");
			ps.setString(1,UserEmail);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				status=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("check email :"+e.getMessage());
		}
		
		return status;
	}
	
	
	public List<UserBean> selectAllUser() {

		List<UserBean> userLst = new ArrayList<UserBean>();
		UserBean user = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select* from user where id=?");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new UserBean();
				user.setUserId(rs.getInt("id"));
				user.setUserName(rs.getString("username"));
				user.setUserEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setUserRole(rs.getString("role"));	
				userLst.add(user);
			}

		} catch (SQLException e) {
			System.out.println("User Select : " + e.getMessage());
		}

		return userLst;

	}

	public UserBean selectOne(String userName) {
		UserBean bean=null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where username=?");
			ps.setString(1, userName);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				bean=new UserBean();
				bean.setUserId(rs.getInt("id"));
				bean.setUserName(rs.getString("username"));
				bean.setUserEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setUserRole(rs.getString("role"));	
			}
					
		} catch (SQLException e) {
			System.out.println("select one profileUser : " + e.getMessage());
		}
		
		
		return bean;
	}
	
	
}
