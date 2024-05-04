package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import spring.model.CourseBean;

public class CourseRepository {
	public int insertcourse(CourseBean cbean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into lesson (name , description, status, imagepath) values (?,?,?,?)");
			ps.setString(1, cbean.getCourseName());
			ps.setString(2, cbean.getCourseDescription());
			ps.setString(3, cbean.getCourseStatus());
			ps.setString(4, cbean.getCourseImagePath());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert course : " + e.getMessage());
		}
		return result;
		
	}
}
