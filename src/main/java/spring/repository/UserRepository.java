package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import spring.model.LoginDTO;
import spring.model.PriceCardDTO;
import spring.model.SingleLessonDTO;
import spring.model.UserDTO;


public class UserRepository {
	
	public UserDTO loginUser(LoginDTO bean) {

		Connection con = ConnectionClass.getConnection();
		UserDTO user = null;
		
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where email=? and password=?");
			ps.setString(1, bean.getEmail());
			ps.setString(2, bean.getPassword());
			System.out.println("ps:"+ bean);
			ResultSet rs = ps.executeQuery();
			System.out.println("exe successfully:"+rs);
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
		
		System.out.println("User Info : "+ user);
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
				System.out.println("Preminum user : "+ status);
			}
			
		} catch (SQLException e) {
			System.out.println("Payment check : " + e.getMessage());
		}
		System.out.println("User status : "+ status);
		return status;
		
	}
	
	public List<PriceCardDTO> showPrice() {
		
		PriceCardDTO priceCard = null;
		List<PriceCardDTO> priceCardList = new ArrayList<PriceCardDTO>();
		
		
		Connection con = ConnectionClass.getConnection();
	    try {
			PreparedStatement ps = con.prepareStatement("select * from subscription");
			ResultSet rs = ps.executeQuery();
//			int i = 0;
			while(rs.next()) {
				priceCard = new PriceCardDTO();
				priceCard.setPlan(rs.getString("subscriptionplan"));
				priceCard.setPrice(rs.getDouble("price"));
				priceCard.setDuration(rs.getString("duration"));
				
				priceCardList.add(priceCard);
				/*
				 * System.out.println(priceCard);
				 * System.out.println(priceCardList.get(i++).getPlan());
				 */
			}
			
		} catch (SQLException e) {
			
			System.out.println("Select from subscription : "+ e.getMessage());
		}
	    
//	    System.out.println("pcl"+ priceCardList.size());
//		priceCardList.forEach(c->System.out.println(c.getPlan()));
		return priceCardList;
		
		
	}
	
	public SingleLessonDTO selectOneLesson(int lessonId) {
		
		SingleLessonDTO slDTO = null;
		
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson where id = ?");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				slDTO = new SingleLessonDTO();
				slDTO.setLessonId(rs.getInt("id"));
				slDTO.setName(rs.getString("name"));
				slDTO.setDescription(rs.getString("description"));
				slDTO.setPurStatus(rs.getString("purchase_status"));
				
			}
		} catch (SQLException e) {
			System.out.println("Select single lesson : "+ e.getMessage());
		}
		
		return slDTO;
				
	}

}
