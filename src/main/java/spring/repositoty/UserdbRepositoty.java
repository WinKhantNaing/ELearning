package spring.repositoty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import spring.model.UserBean;

public class UserdbRepositoty {

		public int addUser(UserBean bean) {
			int result=0;
			Connection con = ConnectionClass.getConnection();
			if (!checkEmail(bean.getUserEmail())) {
			try {
			PreparedStatement ps =con.prepareStatement("insert into user(name,email,password,gender,role) value(?,?,?,?,?);");
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
				while(rs.next()) {
					status=true;
				}
			} catch (SQLException ex) {	
				System.out.println("check email :"+ex.getMessage());
			    }
			return status;
	    	} }