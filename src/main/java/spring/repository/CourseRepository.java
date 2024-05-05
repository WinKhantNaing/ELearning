package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<CourseBean> getAllCourse(){
		List<CourseBean> allCourseLst = new ArrayList<>();
		CourseBean cbean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				 cbean = new CourseBean();
				 cbean.setCourseId(rs.getInt("id"));
				 cbean.setPrefix(rs.getString("prefix"));
				 cbean.setCourseName(rs.getString("name"));
				 cbean.setCourseDescription(rs.getString("description"));
				 cbean.setCourseStatus(rs.getString("status"));
				 cbean.setCourseImagePath(rs.getString("imagepath"));
				 allCourseLst.add(cbean);
				
			}
			
		} catch (SQLException e) {
			System.out.println("get all course: " + e.getMessage());
		}
		System.out.println(allCourseLst);
		return allCourseLst;
		
	}
}
