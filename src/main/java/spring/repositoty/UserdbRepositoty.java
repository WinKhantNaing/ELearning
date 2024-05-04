package spring.repositoty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import spring.model.UserBean;


public class UserdbRepositoty {

		public int addUser(UserBean bean) {
			int result=0;
			Connection con = ConnectionClass.getConnection();
				
			try {
			PreparedStatement ps =con.prepareStatement("insert into user(name,email,password,role,gender) value(?,?,?,?,?);");
			ps.setString(1, bean.getUserName());
			ps.setString(2, bean.getUserEmail());
			ps.setString(3, bean.getPassword());
			ps.setString(4, bean.getUserRole());
			ps.setString(5, bean.getGender());
			result=ps.executeUpdate();
			}catch(SQLException e) {
					System.out.println("user insert :"+e.getMessage());
			
			}
			
			return result;
		}}