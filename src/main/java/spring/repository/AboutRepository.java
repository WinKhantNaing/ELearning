package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spring.model.FeedbakBean;
import spring.model.ReviewBean;


public class AboutRepository {

	public int studentAbout() {
		int scount = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select count(distinct email) from user");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				scount = rs.getInt("count(distinct email)");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Count:" + e.getMessage());
		}

		return scount;
	}
	
	public int courseAbout() {
		int ccount = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select count(distinct description) from lesson");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ccount = rs.getInt("count(distinct description)");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Count:" + e.getMessage());
		}

		return ccount;
	}

	
	public int clientAbout() {
		int clcount = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select count(rating) from feedback where rating > 2");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				clcount = rs.getInt("count(rating)");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Count:" + e.getMessage());
		}

		return clcount;
	}
	
	public List<ReviewBean> showReview() {
		List<ReviewBean> reviewlst = new ArrayList<ReviewBean>();
		ReviewBean review = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select user.username,  user.img, feedback.rating, feedback.comment, feedback.date from feedback inner join user on feedback.user_id1=user.id");
			//ps.setInt(1, bean.getRating());
			//ps.setString(2, bean.getComment());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				review = new ReviewBean();
				review.setViewname(rs.getString("username"));
				review.setImage(rs.getString("img"));
				review.setRatingview(rs.getInt("rating"));
				review.setCommentview(rs.getString("comment"));
				review.setReviewdate(rs.getDate("date"));
				reviewlst.add(review);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Review:" + e.getMessage());
		}
		return reviewlst;
	}
	
}
