package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import spring.model.LoginDTO;
import spring.model.PaymentDTO;
import spring.model.UserDTO;


public class UserRepository {
	
	public UserDTO loginUser(LoginDTO bean) {

		Connection con = ConnectionClass.getConnection();
		UserDTO user = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where email=? and password=?");
			ps.setString(1, bean.getEmail());
			ps.setString(2, bean.getPassword());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new UserDTO();
				user.setUserId(rs.getInt("id"));
				user.setUserName(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setRole(rs.getString("role"));
				user.setImage(rs.getString("img"));
			}
		} catch (SQLException e) {
			System.out.println("login user : " + e.getMessage());
		}

		return user;

	}
	
	public PaymentDTO checkPayment(int userId) {
		
		Connection con = ConnectionClass.getConnection();
		PaymentDTO payment = null;
		try {
			PreparedStatement ps = con.prepareStatement("select user_id from payment where user_id = ?;");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				payment = new PaymentDTO();
				payment.setUserId(rs.getInt("user_id"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("Payment check : " + e.getMessage());
		}
		
		return payment;
		
	}

}
