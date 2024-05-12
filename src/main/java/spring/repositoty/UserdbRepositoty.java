package spring.repositoty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import spring.model.UserBean;
import java.util.ArrayList;

public class UserdbRepositoty {

		public int addUser(UserBean bean) {
			int result=0;
			Connection con = ConnectionClass.getConnection();
			if (!checkEmail(bean.getUserEmail())) {
			try {
			PreparedStatement ps =con.prepareStatement("insert into user(username,email,password,gender,role) value(?,?,?,?,?);");
			ps.setString(1, bean.getUserName());
			ps.setString(2, bean.getUserEmail());
			ps.setString(3, bean.getPassword());
			ps.setString(4, bean.getGender());
			ps.setString(5, bean.getUserRole());
			result=ps.executeUpdate();
			
			}catch(SQLException ex) {
					System.out.println("user insert :"+ex.getMessage());
			
			}
			
			}else {
				System.out.println("Email already exist!!");
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
				if(rs.next()) {
					status=true;
				}
				
			} catch (SQLException ex) {	
				System.out.println("check email :"+ex.getMessage());
			    }
			return status;
	    	} 
		
		public List<UserBean>selectAllUser(){
			List<UserBean> userlst= new ArrayList<UserBean>();
		UserBean user=null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("select * from user where status<>0");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				user= new UserBean();
				user.setUserName(rs.getString("username"));
				user.setUserEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setUserRole(rs.getString("role"));
				userlst.add(user);
			}
		} catch (SQLException ex) {
			System.out.println ("User Select : " +ex.getMessage());
		    }
			return userlst;
		}
		
		public UserBean selectOne(int userEmail) {
			UserBean bean=null;
			Connection con= ConnectionClass.getConnection();
			try { 
				PreparedStatement ps=con.prepareStatement("select * from from user where email=?");
				ps.setInt(2, userEmail);
				ResultSet rs= ps.executeQuery();
				while(rs.next()) {
					bean=new UserBean();
					bean.setUserName(rs.getString("username"));
					bean.setUserEmail(rs.getString("email"));
					bean.setPassword(rs.getString("password"));
					bean.setGender(rs.getString("gender"));
					bean.setUserRole(rs.getString("role"));
					
				}
			} catch (SQLException ex) {
				System.out.println ("select one User : " + ex.getMessage());
			    }
			return bean;
		    }
		}