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
			PreparedStatement ps = con.prepareStatement("select * from lesson where isactive=1");
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
		return allCourseLst;
		
	}
	
	public CourseBean getOneCourse(int CourseId) {
		Connection con = ConnectionClass.getConnection();
		CourseBean cbean = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson where id = ?");
			ps.setInt(1, CourseId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				cbean = new CourseBean();
				cbean.setCourseId(rs.getInt("id"));
				cbean.setPrefix(rs.getString("prefix"));
				cbean.setCourseName(rs.getString("name"));
				cbean.setCourseStatus(rs.getString("status"));
				cbean.setCourseDescription(rs.getString("description"));
				cbean.setCourseImagePath(rs.getString("imagepath"));
				cbean.setIsActive(rs.getInt("isactive"));			}
		} catch (SQLException e) {
			System.out.println("get one course: " + e.getMessage());
		}
		
		return cbean;
		
	}
	
	public int updatecourse(CourseBean bean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE lesson SET name = ?, description = ?,status = ?, imagepath = ? WHERE id = ?");
			ps.setString(1,bean.getCourseName());
			ps.setString(2, bean.getCourseDescription());
			ps.setString(3, bean.getCourseStatus());
			ps.setString(4, bean.getCourseImagePath());
			ps.setInt(5, bean.getCourseId());
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("update course: " + e.getMessage());
		}
		return result;
		
	}
	
	public int delete(int id) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update lesson set isactive = 0 where id = ?");
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete course: " + e.getMessage());
		}
		return result;
		
	}
	
}
