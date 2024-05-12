package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import spring.model.LoginBean;
import spring.model.RegisterBean;
import spring.model.UserBean;

import java.util.List;
import java.util.ArrayList;

import spring.model.LoginDTO;
import spring.model.PriceCardDTO;
import spring.model.UserDTO;

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

}
