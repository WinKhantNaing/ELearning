package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spring.model.CourseStatusTDO;
import spring.model.CoursesBean;
import spring.model.EnrollmentBean;
import spring.model.UnitBean;
import spring.model.UserBean;

public class CoursesRepository {

	public List <CoursesBean> getCourses() {
		Connection con = ConnectionClass.getConnection();
		List <CoursesBean> courseList = new ArrayList<CoursesBean>();
		CoursesBean courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				courseBean = new CoursesBean();
				courseBean.setCourseId(rs.getInt("id"));
				courseBean.setCoursePrefix(rs.getString("prefix"));
				courseBean.setCourseName(rs.getString("name"));
				courseBean.setCourseStatus(rs.getString("status"));
				courseBean.setCourseImagePath(rs.getString("image"));
				courseBean.setCourseDescription(rs.getString("description"));
				courseList.add(courseBean);
			}
		} catch (SQLException e) {
			System.out.println("Get Courses :" +e.getMessage());
		}
		return courseList; 
	}
	
	public List<CoursesBean> getCompleteCourses(/* UserBean bean */) {
		Connection con = ConnectionClass.getConnection();
		List<CoursesBean> courseCompleteList = new ArrayList<CoursesBean>();
		CoursesBean courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT lesson.*\r\n"
					+ "FROM lesson\r\n"
					+ "JOIN (\r\n"
					+ "    SELECT unit.lesson_id, COUNT(*) AS total_units, SUM(CASE WHEN enrollment.unit_status = 'complete' THEN 1 ELSE 0 END) AS completed_units\r\n"
					+ "    FROM unit\r\n"
					+ "    JOIN enrollment ON unit.id = enrollment.unit_id AND enrollment.user_id = 1\r\n"
					+ "    GROUP BY unit.lesson_id\r\n"
					+ ") eu ON eu.lesson_id = lesson.id\r\n"
					+ "WHERE eu.total_units = eu.completed_units");
			/* ps.setInt(1, bean.getUserId()); */
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				courseBean = new CoursesBean();
				courseBean.setCourseId(rs.getInt("id"));
				courseBean.setCoursePrefix(rs.getString("prefix"));
				courseBean.setCourseName(rs.getString("name"));
				courseBean.setCourseStatus(rs.getString("status"));
				courseBean.setCourseImagePath(rs.getString("image"));
				courseBean.setCourseDescription(rs.getString("description"));
				courseCompleteList.add(courseBean);
			}
		} catch (SQLException e) {
			System.out.println("Get Courses :" +e.getMessage());
		}
		return courseCompleteList; 
	}
	
	public List<CoursesBean> getProgressCourses(/* UserBean bean */) {
		Connection con = ConnectionClass.getConnection();
		List<CoursesBean> courseProgressList = new ArrayList<CoursesBean>();
		CoursesBean courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT lesson.*\r\n"
					+ "FROM lesson\r\n"
					+ "JOIN (\r\n"
					+ "    SELECT unit.lesson_id, COUNT(*) AS total_units, SUM(CASE WHEN enrollment.unit_status = 'complete' THEN 1 ELSE 0 END) AS completed_units\r\n"
					+ "    FROM unit\r\n"
					+ "    JOIN enrollment ON unit.id = enrollment.unit_id AND enrollment.user_id = 1\r\n"
					+ "    GROUP BY unit.lesson_id\r\n"
					+ ") eu ON eu.lesson_id = lesson.id\r\n"
					+ "WHERE eu.total_units <> eu.completed_units");
			/* ps.setInt(1, bean.getUserId()); */
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				courseBean = new CoursesBean();
				courseBean.setCourseId(rs.getInt("id"));
				courseBean.setCoursePrefix(rs.getString("prefix"));
				courseBean.setCourseName(rs.getString("name"));
				courseBean.setCourseStatus(rs.getString("status"));
				courseBean.setCourseImagePath(rs.getString("image"));
				courseBean.setCourseDescription(rs.getString("description"));
				courseProgressList.add(courseBean);
			}
		} catch (SQLException e) {
			System.out.println("Get Courses :" +e.getMessage());
		}
		return courseProgressList; 
	}
	
	public List<CoursesBean> getSearchCourses(CoursesBean course){
		List<CoursesBean> searchList = new ArrayList<CoursesBean>();
		Connection con = ConnectionClass.getConnection();
		CoursesBean bean = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson where name like ?");
		    ps.setString(1, "%"+course.getCourseName()+"%");
		    ResultSet rs = ps.executeQuery();
		    while(rs.next()) {
		    	bean = new CoursesBean();
		    	bean.setCourseId(rs.getInt("id"));
		    	bean.setCoursePrefix(rs.getString("prefix"));
		    	bean.setCourseName(rs.getString("name"));
		    	bean.setCourseStatus(rs.getString("status"));
		    	bean.setCourseImagePath(rs.getString("image"));
		    	bean.setCourseDescription(rs.getString("description"));
		    	searchList.add(bean);
		    }
		} catch (SQLException e) {
			System.out.println("Get search course :" + e.getMessage());
		}
		return searchList;
	}
	

}
