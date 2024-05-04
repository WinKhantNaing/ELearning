package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spring.model.CoursesBean;
import spring.model.UnitBean;

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
	
	public List <UnitBean> getUnitStatus(){
		List<UnitBean> unitStatusList  = new ArrayList<UnitBean>();
		UnitBean bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select purchase_status from unit");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
		    	bean = new UnitBean();
		    	bean.setUnitStatus(rs.getString("purchase_status"));
		    	unitStatusList.add(bean);
		    }
		} catch (SQLException e) {
			System.out.println("Getting unit status List : " +e.getMessage());
		}
		return unitStatusList;
	}
	
	
}
