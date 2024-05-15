package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import spring.model.FeedbakBean;

public class FeedbackRepository {

	
	public int insertFeedback(FeedbakBean bean, int userId) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into feedback(rating,comment,user_id1) values(?,?,?)");
			ps.setInt(1, bean.getRating());
			ps.setString(2, bean.getComment());
			ps.setInt(3, userId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
