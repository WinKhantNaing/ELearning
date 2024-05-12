package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import spring.model.LoginBean;
import spring.model.RegisterBean;
import spring.model.UserBean;

public class UserRepository {
	
	
	public int insertUser(RegisterBean bean) {
		int result = 0;
		
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select email from user where email=?");
			ps.setString(1, bean.getUemail());
			ResultSet rs= ps.executeQuery();
			if(!rs.next()) {
				PreparedStatement  lps= con.prepareStatement("insert into user(username,email,password) values(?,?,?)");
				lps.setString(1, bean.getUname());
				lps.setString(2, bean.getUemail());
				lps.setString(3, bean.getUpassword());
				result = lps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("user insert : " + e.getMessage());        
		}
		return result;
	}

	
		public UserBean selectUser(LoginBean bean) {
			UserBean ubean = null;
			Connection con = ConnectionClass.getConnection();
			try {
				PreparedStatement ps = con.prepareStatement("select * from user where email=? and password=?");
				ps.setString(1, bean.getEmail());
				ps.setString(2, bean.getPassword());
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					ubean = new UserBean();
					ubean.setUseremail(rs.getString("email"));
					ubean.setUserpassword(rs.getString("password"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
			return ubean;
		}
}
