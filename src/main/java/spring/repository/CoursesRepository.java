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
import spring.model.PaySubBean;
import spring.model.PaymentDTO;
import spring.model.PriceCardDTO;
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
	
	// FOR MA MYO LAE OO(show course subscription plan history)
	public List<PaySubBean> getUserHistoryPlan(/* UserBean user */){
		List<PaySubBean> paySubList = new ArrayList<PaySubBean>();
		 PaySubBean bean = null;
		 Connection con = ConnectionClass.getConnection();
		 try {
			PreparedStatement ps = con.prepareStatement("select sub.subscriptionplan, sub.duration , pay.start_date , pay.end_date \r\n"
					+ "from subscription sub  join payment pay on pay.subscription_id=sub.id and pay.user_id=1 order by  pay.start_date desc");
			/* ps.setInt(1, user.getUserId()); */
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				bean = new PaySubBean();
				bean.setSubPlan(rs.getString("subscriptionplan"));
				bean.setDuration(rs.getString("duration"));
				bean.setStartDate(rs.getString("start_date"));
				bean.setEndDate(rs.getString("end_date"));
				paySubList.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("Getting payment and description : " + e.getMessage());
		}
		 return paySubList;
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
			ps.setString(3, bean.getMethod());
			ps.setString(4, bean.getStartDate());
			ps.setString(5, bean.getEndDate());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Adding subscription plan : " + e.getMessage());
		}
		return result;
	}
}
