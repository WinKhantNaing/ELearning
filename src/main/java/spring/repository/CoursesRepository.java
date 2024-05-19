package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import spring.model.CoursesBean;
import spring.model.PaymentDTO;
import spring.model.PriceCardDTO;
public class CoursesRepository {

	public List <CoursesBean> getCourses() {
		Connection con = ConnectionClass.getConnection();
		List <CoursesBean> courseList = new ArrayList<CoursesBean>();
		CoursesBean courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson where isactive=1");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				courseBean = new CoursesBean();
				courseBean.setCourseId(rs.getInt("id"));
				courseBean.setCoursePrefix(rs.getString("prefix"));
				courseBean.setCourseName(rs.getString("name"));
				courseBean.setCourseStatus(rs.getString("purchase_status"));
				courseBean.setCourseImagePath(rs.getString("image"));
				courseBean.setCourseDescription(rs.getString("description"));
				
				courseList.add(courseBean);
			}
		} catch (SQLException e) {
			System.out.println("Get Courses :" +e.getMessage());
		}
		return courseList; 
	}
	
	public List <CoursesBean> getHomeCourses() {
		Connection con = ConnectionClass.getConnection();
		List <CoursesBean> courseList = new ArrayList<CoursesBean>();
		CoursesBean courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson where isactive=1 order by id  limit 6");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				courseBean = new CoursesBean();
				courseBean.setCourseId(rs.getInt("id"));
				courseBean.setCoursePrefix(rs.getString("prefix"));
				courseBean.setCourseName(rs.getString("name"));
				courseBean.setCourseStatus(rs.getString("purchase_status"));
				courseBean.setCourseImagePath(rs.getString("image"));
				courseBean.setCourseDescription(rs.getString("description"));
				
				courseList.add(courseBean);
			}
		} catch (SQLException e) {
			System.out.println("Get Courses :" +e.getMessage());
		}
		return courseList; 
	}
	
	public List<CoursesBean> getCompleteCourses(int userId) {
		Connection con = ConnectionClass.getConnection();
		List<CoursesBean> courseCompleteList = new ArrayList<CoursesBean>();
		CoursesBean courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT lesson.*\r\n"
					+ "FROM lesson\r\n"
					+ "JOIN (\r\n"
					+ "    SELECT unit.lesson_id, COUNT(*) AS total_units, SUM(CASE WHEN enrollment.unit_status = 'complete' THEN 1 ELSE 0 END) AS completed_units\r\n"
					+ "    FROM unit\r\n"
					+ "    JOIN enrollment ON unit.id = enrollment.unit_id AND enrollment.user_id = ?\r\n"
					+ "    GROUP BY unit.lesson_id\r\n"
					+ ") eu ON eu.lesson_id = lesson.id\r\n"
					+ "WHERE eu.total_units = eu.completed_units");
			 ps.setInt(1, userId); 
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				courseBean = new CoursesBean();
				courseBean.setCourseId(rs.getInt("id"));
				courseBean.setCoursePrefix(rs.getString("prefix"));
				courseBean.setCourseName(rs.getString("name"));
				courseBean.setCourseStatus(rs.getString("purchase_status"));
				courseBean.setCourseImagePath(rs.getString("image"));
				courseBean.setCourseDescription(rs.getString("description"));
				courseCompleteList.add(courseBean);
			}
		} catch (SQLException e) {
			System.out.println("Get Courses :" +e.getMessage());
		}
		return courseCompleteList; 
	}
	
	public List<CoursesBean> getProgressCourses(int userId) {
		Connection con = ConnectionClass.getConnection();
		List<CoursesBean> courseProgressList = new ArrayList<CoursesBean>();
		CoursesBean courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT lesson.*\r\n"
					+ "FROM lesson\r\n"
					+ "JOIN (\r\n"
					+ "    SELECT unit.lesson_id, COUNT(*) AS total_units, SUM(CASE WHEN enrollment.unit_status = 'complete' THEN 1 ELSE 0 END) AS completed_units\r\n"
					+ "    FROM unit\r\n"
					+ "    JOIN enrollment ON unit.id = enrollment.unit_id AND enrollment.user_id = ?\r\n"
					+ "    GROUP BY unit.lesson_id\r\n"
					+ ") eu ON eu.lesson_id = lesson.id\r\n"
					+ "WHERE eu.total_units <> eu.completed_units");
			 ps.setInt(1, userId); 
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				courseBean = new CoursesBean();
				courseBean.setCourseId(rs.getInt("id"));
				courseBean.setCoursePrefix(rs.getString("prefix"));
				courseBean.setCourseName(rs.getString("name"));
				courseBean.setCourseStatus(rs.getString("purchase_status"));
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
		    	bean.setCourseStatus(rs.getString("purchase_status"));
		    	bean.setCourseImagePath(rs.getString("image"));
		    	bean.setCourseDescription(rs.getString("description"));
		    	searchList.add(bean);
		    }
		} catch (SQLException e) {
			System.out.println("Get search course :" + e.getMessage());
		}
		return searchList;
	}
	
		
	//for ma toe yadanarkyaw (show course subscriptionplan)
	public List<PriceCardDTO> getPricePlan(){
		List<PriceCardDTO> priceList = new ArrayList<PriceCardDTO>();
		PriceCardDTO bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from subscription");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bean = new PriceCardDTO();
				bean.setSubId(rs.getInt("id"));
				bean.setPlan(rs.getString("subscriptionplan"));
				bean.setDuration(rs.getString("duration"));
				bean.setPrice(rs.getDouble("price"));
				priceList.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("Getting price plan : " +e.getMessage());
		}
		return priceList;
	}
	
	public PriceCardDTO getDuration(int cid) {
		PriceCardDTO bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from subscription where id = ?");
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bean = new PriceCardDTO();
				bean.setSubId(rs.getInt("id"));
				bean.setPlan(rs.getString("subscriptionplan"));
				bean.setDuration(rs.getString("duration"));
				bean.setPrice(rs.getDouble("price"));
			}
		} catch (Exception e) {
			System.out.println("GET Duration : " + e.getMessage());
		}
		return bean;
	}
	
	public int addSubscriptionPlan(PaymentDTO bean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps= con.prepareStatement("insert into payment (user_id,subscription_id,method,start_date, end_date) values(?,?,?,?,?)");
			ps.setInt(1, bean.getUserId());
			ps.setInt(2, bean.getSubId());
			ps.setString(3, bean.getPaymentMethod());
			ps.setString(4, bean.getStartDate());
			ps.setString(5, bean.getEndDate());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Adding subscription plan : " + e.getMessage());
		}
		return result;
	}
	public int insertcourse(CoursesBean cbean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into lesson (name , description, status, image) values (?,?,?,?)");
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
	/*
	 * public List<CourseBean> getAllCourse(){ List<CourseBean> allCourseLst = new
	 * ArrayList<>(); CourseBean cbean = null; Connection con =
	 * ConnectionClass.getConnection(); try { PreparedStatement ps =
	 * con.prepareStatement("select * from lesson where isactive=1"); ResultSet rs =
	 * ps.executeQuery(); while (rs.next()) { cbean = new CourseBean();
	 * cbean.setCourseId(rs.getInt("id")); cbean.setPrefix(rs.getString("prefix"));
	 * cbean.setCourseName(rs.getString("name"));
	 * cbean.setCourseDescription(rs.getString("description"));
	 * cbean.setCourseStatus(rs.getString("status"));
	 * cbean.setCourseImagePath(rs.getString("imagepath")); allCourseLst.add(cbean);
	 * 
	 * }
	 * 
	 * } catch (SQLException e) { System.out.println("get all course: " +
	 * e.getMessage()); } return allCourseLst;
	 * 
	 * }
	 */
	
	public CoursesBean getOneCourse(int CourseId) {
		Connection con = ConnectionClass.getConnection();
		CoursesBean cbean = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson where id = ?");
			ps.setInt(1, CourseId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				cbean = new CoursesBean();
				cbean.setCourseId(rs.getInt("id"));
				cbean.setCoursePrefix(rs.getString("prefix"));
				cbean.setCourseName(rs.getString("name"));
				cbean.setCourseStatus(rs.getString("purchase_status"));
				cbean.setCourseDescription(rs.getString("description"));
				cbean.setCourseImagePath(rs.getString("image"));
				cbean.setIsActive(rs.getInt("isactive"));			}
		} catch (SQLException e) {
			System.out.println("get one course: " + e.getMessage());
		}
		
		return cbean;
		
	}
	//for Admin
	public int updatecourse(CoursesBean bean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE lesson SET name = ?, description = ?,status = ?, image = ? WHERE id = ?");
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
	// for Adimn
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
