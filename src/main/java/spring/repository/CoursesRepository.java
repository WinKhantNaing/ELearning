package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spring.model.CoursesModel;

public class CoursesRepository {

	public List <CoursesModel> getCourses() {
		Connection con = ConnectionClass.getConnection();
		List <CoursesModel> courseList = new ArrayList<CoursesModel>();
		CoursesModel courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				courseBean = new CoursesModel();
				courseBean.setCourseId(rs.getInt("id"));
				courseBean.setCoursePrefix(rs.getString("prefix"));
				courseBean.setCourseName(rs.getString("name"));
				courseBean.setCourseImagePath(rs.getString("image"));
				courseBean.setCourseDescription(rs.getString("description"));
				courseList.add(courseBean);
			}
		} catch (SQLException e) {
			System.out.println("Get Courses :" +e.getMessage());
		}
		return courseList; 
	}
}
