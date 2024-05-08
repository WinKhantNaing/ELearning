package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import spring.model.LoginDTO;
import spring.model.PriceCardDTO;
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
	
	public boolean checkPayment(int userId) {
		
		boolean status = false;
		
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select user_id from payment where user_id = ?;");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
				status = true;
			}
			
		} catch (SQLException e) {
			System.out.println("Payment check : " + e.getMessage());
		}
		
		return status;
		
	}
	
	public List<PriceCardDTO> showPrice() {
		
		PriceCardDTO priceCard = null;
		List<PriceCardDTO> priceCardList = new ArrayList<PriceCardDTO>();
		
		
		Connection con = ConnectionClass.getConnection();
	    try {
			PreparedStatement ps = con.prepareStatement("select * from subscription");
			ResultSet rs = ps.executeQuery();
			int i = 0;
			while(rs.next()) {
				priceCard = new PriceCardDTO();
				priceCard.setPlan(rs.getString("subscriptionplan"));
				priceCard.setPrice(rs.getDouble("price"));
				priceCard.setDuration(rs.getString("duration"));
				
				priceCardList.add(priceCard);
				System.out.println(priceCard);
				System.out.println(priceCardList.get(i++).getPlan());
			}
			
		} catch (SQLException e) {
			
			System.out.println("Select from subscription : "+ e.getMessage());
		}
	    
	    System.out.println("pcl"+ priceCardList.size());
		priceCardList.forEach(c->System.out.println(c.getPlan()));
		return priceCardList;
		
		
	}

}
