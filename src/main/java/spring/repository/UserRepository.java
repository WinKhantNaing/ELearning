package spring.repository;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import spring.model.CommentDto;
import spring.model.CoursesBean;

import spring.model.FeedbakBean;

import spring.model.CurrentPlanDTO;

import spring.model.LoginBean;
import spring.model.RegisterBean;
import spring.model.SingleLessonDTO;
import spring.model.SubscriptionDTO;
import spring.model.UnitNameListDTO;
import spring.model.UserBean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

import spring.model.PaySubBean;
import spring.model.ProfileDto;
import spring.model.UserDTO;
import user.model.CourseBean;
import user.repositoty.ConnectionClass;

public class UserRepository {

	public int insertUser(RegisterBean bean) {
		int result = 0;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select email from user where email=?");
			ps.setString(1, bean.getUemail());
			ResultSet rs = ps.executeQuery();
			if (!rs.next()) {
				PreparedStatement lps = con.prepareStatement("insert into user(username,email,password) values(?,?,?)");
				lps.setString(1, bean.getUname());
				lps.setString(2, bean.getUemail());
				lps.setString(3, bean.getUpassword());
				result = lps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("user insert : " + e.getMessage());
		}
		return result;
	}
	
	
	public UserBean selectUser(LoginBean bean) {
		UserBean ubean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where email=? and password=?");
			ps.setString(1, bean.getEmail());
			ps.setString(2, bean.getPassword());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ubean = new UserBean();
				ubean.setUserId(rs.getInt("id"));
				ubean.setUserEmail(rs.getString("email"));
				ubean.setPassword(rs.getString("password"));
				ubean.setFilePath(rs.getString("img"));
				ubean.setUserRole(rs.getString("role"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return ubean;
	}
	


	public int checkExpiration() {
		
		Connection con = ConnectionClass.getConnection();
		int result = 0;
		
		try {
			PreparedStatement ps = con.prepareStatement("update payment set is_expired = 0 where end_date < CURRENT_DATE");
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Change Purchase Status : "+ e.getMessage());
		}
		
		return result;	
		
	}


	public boolean checkPayment(int userId) {

		boolean status = false;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select id from payment where user_id = ? and is_expired <> 0");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				status = true;
				System.out.println("Preminum user : " + status);
			}

		} catch (SQLException e) {
			System.out.println("Payment check : " + e.getMessage());
		}
		System.out.println("User status : " + status);
		return status;

	}

	//for admin (Add subscription plan)
	public int addSubscriptionPlan(SubscriptionDTO bean) {
		Connection con = ConnectionClass.getConnection();
		int result = 0;
		try {
			PreparedStatement ps = con.prepareStatement("insert into subscription (subscriptionplan , duration, price) value(?,?,?)");
			ps.setString(1, bean.getSubPlan());
			ps.setString(2, bean.getDuration());
			ps.setDouble(3, bean.getPrice());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Adding subscription plan :"+ e.getMessage());
		}
		return result;
	}
	
	public int addUser(UserBean bean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		if (!checkEmail(bean.getUserEmail())) {
			try {
				PreparedStatement ps = con.prepareStatement("insert into user(username,email,password,role) value(?,?,?,?);");
				ps.setString(1, bean.getUserName());
				ps.setString(2, bean.getUserEmail());
				ps.setString(3, bean.getPassword());
				ps.setString(4, bean.getUserRole());
				result = ps.executeUpdate();

			} catch (SQLException e) {
				System.out.println("user insert :" + e.getMessage());

			}

		} else {
			System.out.println("Email already exist!!");
		}
		return result;
	}

	public boolean checkEmail(String UserEmail) {
		boolean status = false;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select count(*) from user where email=?");
			ps.setString(1, UserEmail);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = true;
			}

		} catch (SQLException e) {
			System.out.println("check email :" + e.getMessage());
		}
		return status;
	}

	public List<UserBean> selectAllUser() {
		List<UserBean> userlst = new ArrayList<UserBean>();
		UserBean user = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where status<>0");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new UserBean();
				user.setPrefix(rs.getString("prefix"));
				user.setUserId(rs.getInt("id"));
				user.setUserName(rs.getString("username"));
				user.setUserEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setUserRole(rs.getString("role"));
				userlst.add(user);
			}
		} catch (SQLException e) {
			System.out.println("User Select : " + e.getMessage());
		}
		return userlst;
	}

	public UserBean selectOne(int userid) {
		UserBean bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where id=?");
			ps.setInt(1, userid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean = new UserBean();
				bean.setUserId(rs.getInt("id"));
	public ProfileDto selectOne(int userId) {
		ProfileDto bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select *  from user where id=?");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean = new ProfileDto();
				bean.setUserName(rs.getString("username"));
				bean.setUserEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setUserRole(rs.getString("role"));
				bean.setUserId(rs.getInt("id"));
				bean.setFilePath(rs.getString("img"));

			}
		} catch (SQLException e) {
			System.out.println("select one User : " + e.getMessage());
		}
		return bean;
	}
	public int updateUser(UserBean bean) {
	    int result = 0;
	    Connection con = ConnectionClass.getConnection();
	    try {
	        PreparedStatement ps = con.prepareStatement("update user set username=?, email=? where id=?");
	        ps.setString(1, bean.getUserName());
	        ps.setString(2, bean.getUserEmail());
	        ps.setInt(3, bean.getUserId());
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println("User update: " + e.getMessage());
	    }
	    return result;
	}
	
	public int deleteUser(int userId) {
	    int result = 0;
	    Connection con = ConnectionClass.getConnection();
	    try {
	        PreparedStatement ps = con.prepareStatement("delete from user where id=?");
	        ps.setInt(1, userId);
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println("user delete :" + e.getMessage());
	    }
	    return result;
	}
	
	
	
	public String uploadFile(MultipartFile file) {
		String filePath = null;
		try {
			String path = "C:\\\\JAVA.51\\\\ELearning\\\\src\\\\main\\\\webapp\\\\resources\\\\images\\\\profilephoto";
			String filename = file.getOriginalFilename();
			byte[] bytes = file.getBytes();
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(new File(path + File.separator + filename)));
			stream.write(bytes);
			stream.flush();
			stream.close();
			String url = path + File.separator +filename;
            int index = url.indexOf("resources");
            String extractedPath = index >= 0 ? url.substring(index) : "did when it was false.";
            filePath = extractedPath;
		} catch (Exception e) {
			System.out.println("file upload :" + e.getMessage());
		}
		return filePath;
	}

	public int insertPhoto(ProfileDto photo, int id) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement("UPDATE user SET img = ? WHERE id = ?");

			String filePath = uploadFile(photo.getFile());
			photo.setFilePath(filePath);
			ps.setString(1, photo.getFilePath());
			ps.setInt(2, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("photo insert :" + e.getMessage());
		}

		return result;
	}

	public ProfileDto profileUser(int id) {

		ProfileDto user = null;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new ProfileDto();
				user.setUserId(rs.getInt("id"));
				user.setUserName(rs.getString("username"));
				user.setUserEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setFilePath(rs.getString("img"));
			}

		} catch (SQLException e) {
			System.out.println("Select ProfileUser:" + e.getMessage());
		}

		return user;

	}

	public int levelCount(int id) {

		int level = 0;

		Connection con = ConnectionClass.getConnection();
		try {

			PreparedStatement ps = con
					.prepareStatement("select count(*) from enrollment where unit_status='complete' and user_id=?");

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				level=rs.getInt("count(*)");
			}

		} catch (SQLException e) {
			System.out.println("Select LevelCount:" + e.getMessage());
		}

		return level;

	}

//	public boolean subscription() {
//
//		boolean status = false;
//		Connection con = ConnectionClass.getConnection();
//		try {
//			PreparedStatement ps = con.prepareStatement("select subscription_id from payment where user_id=?");
//			ResultSet rs = ps.executeQuery();
//			while (rs.next()) {
//				status = true;
//			}
//
//		} catch (SQLException e) {
//			System.out.println("Select LevelCount:" + e.getMessage());
//		}
//
//		return status;
//
//	}

	public int updateProfile(ProfileDto user) {
		Connection con = ConnectionClass.getConnection();
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement("update user set username=?,email=? where id=?");
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getUserEmail());
			ps.setInt(3, user.getUserId());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Profile Update : " + e.getMessage());
		}

		return i;

	}

	// FOR MA MYO LAE OO(show course subscription plan history)
	public List<PaySubBean> getUserHistoryPlan(int userId) {
		List<PaySubBean> paySubList = new ArrayList<PaySubBean>();
		PaySubBean bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("select sub.subscriptionplan, sub.duration , pay.start_date , pay.end_date \r\n"
							+ "from subscription sub  join payment pay on pay.subscription_id=sub.id and pay.user_id=? order by  pay.start_date desc");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean = new PaySubBean();
				bean.setSubPlan(rs.getString("subscriptionplan"));
				bean.setDuration(rs.getString("duration"));
				bean.setStartDate(rs.getString("start_date"));
				bean.setEndDate(rs.getString("end_date"));
				paySubList.add(bean);
				System.out.println("get list " + paySubList);
			}
		} catch (SQLException e) {
			System.out.println("Getting payment and description : " + e.getMessage());
		}
		return paySubList;
	}
	
	
	public List<CurrentPlanDTO> getCurrentPlan(int userId) {
		List<CurrentPlanDTO> paySubList = new ArrayList<CurrentPlanDTO>();
		CurrentPlanDTO bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("select sub.subscriptionplan, sub.duration , pay.start_date , pay.end_date \r\n"
							+ "from subscription sub join payment pay on pay.subscription_id=sub.id and pay.user_id=? where pay.end_date > current_date order by  pay.start_date desc");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean = new CurrentPlanDTO();
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
	
	public List<CommentDto> recentComments() {
		List<CommentDto> commentList = new ArrayList<CommentDto>();
		CommentDto bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("select u.username,u.img,f.comment,f.date,f.rating from feedback f join user u on f.user_id1=u.id");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean = new CommentDto();
				bean.setUserName(rs.getString("username"));
				bean.setComments(rs.getString("comment"));
				bean.setFilePath(rs.getString("img"));
				bean.setDate(rs.getString("date"));
				bean.setRating(rs.getInt("rating"));
				commentList.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("Getting payment and description : " + e.getMessage());
		}
		return commentList;
	} 
	
	
	public int userCount() {

		int usercount = 0;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("select count(username) from user where status=1 and role='user'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				usercount=rs.getInt("count(username)");
			}

		} catch (SQLException e) {
			System.out.println("Select LevelCount:" + e.getMessage());
		}

		return usercount;

	}
	
	public int subUserCount() {

		int subusercount = 0;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("select count(distinct user_id) from payment;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				subusercount=rs.getInt("count(distinct user_id)");
			}

		} catch (SQLException e) {
			System.out.println("Select LevelCount:" + e.getMessage());
		}

		return subusercount;

	}
	
	
	public int feedBackCount() {

		int feedbackcount = 0;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("select count(comment) from feedback");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				feedbackcount=rs.getInt("count(comment)");
			}

		} catch (SQLException e) {
			System.out.println("Select LevelCount:" + e.getMessage());
		}

		return feedbackcount;

	}

	public List<CoursesBean> getCompleteCourses(int userId) {
		Connection con = ConnectionClass.getConnection();
		List<CoursesBean> courseCompleteList = new ArrayList<CoursesBean>();
		CoursesBean courseBean = null;
		try {
			PreparedStatement ps = con.prepareStatement("SELECT lesson.*\r\n" + "FROM lesson\r\n" + "JOIN (\r\n"
					+ "    SELECT unit.lesson_id, COUNT(*) AS total_units, SUM(CASE WHEN enrollment.unit_status = 'complete' THEN 1 ELSE 0 END) AS completed_units\r\n"
					+ "    FROM unit\r\n"
					+ "    JOIN enrollment ON unit.id = enrollment.unit_id AND enrollment.user_id = ?\r\n"
					+ "    GROUP BY unit.lesson_id\r\n" + ") eu ON eu.lesson_id = lesson.id\r\n"
					+ "WHERE eu.total_units = eu.completed_units");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
			System.out.println("Get Courses :" + e.getMessage());
		}
		return courseCompleteList;
	}

	public SingleLessonDTO selectOneLesson(int lessonId) {

		SingleLessonDTO slDTO = null;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson where id = ?");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				slDTO = new SingleLessonDTO();
				slDTO.setLessonId(rs.getInt("id"));
				slDTO.setName(rs.getString("name"));
				slDTO.setDescription(rs.getString("description"));
				slDTO.setPurStatus(rs.getString("purchase_status"));
				slDTO.setImage(rs.getString("image"));

			}
		} catch (SQLException e) {
			System.out.println("Select single lesson : " + e.getMessage());
		}

		return slDTO;

	}

	public List<UnitNameListDTO> showUnitNameList(int lessonId) {

		Connection con = ConnectionClass.getConnection();
		UnitNameListDTO unlDTO;
		List<UnitNameListDTO> unitNameList = null;
		unitNameList = new ArrayList<UnitNameListDTO>();

		try {
			PreparedStatement ps = con.prepareStatement("select unit_name from unit where lesson_id = ?");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				unlDTO = new UnitNameListDTO();
				unlDTO.setUnitName(rs.getString("unit_name"));
				unitNameList.add(unlDTO);

			}

		} catch (SQLException e) {
			System.out.println("Unit Name List " + e.getMessage());
		}

		return unitNameList;
	}

	public int countUnit(int lessonId) {

		Connection con = ConnectionClass.getConnection();
//		SingleLessonDTO slDTO = null;
		int unitCount = 0;

		try {
			PreparedStatement ps = con.prepareStatement("select count(*) from unit where lesson_id = ?");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				unitCount = rs.getInt("count(*)");
			}

		} catch (SQLException e) {
			System.out.println("Count unit : " + e.getMessage());
		}

		return unitCount;

	}
	
	public boolean getUnitStatus(int lessonId) {
		
		Connection con = ConnectionClass.getConnection();
		boolean status = false;
		
		try {
			PreparedStatement ps = con.prepareStatement("select name from lesson where id = ? and purchase_status = 'Free'");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				status = true;
			}
			
		} catch (SQLException e) {
			System.out.println("Get Unit Status : "+e.getMessage());
		}
		
		return status;
		
	}


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
		System.out.println("Feedback : "+ e.getMessage());
	}
	return result;
}
	

	public int updateName(int userId, String name) {
		Connection con = ConnectionClass.getConnection();
		int result = 0;

		try {
			PreparedStatement ps = con.prepareStatement("update user set user.username = ?\r\n" + "where user.id = ?");
			ps.setString(1, name);
			ps.setInt(2, userId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Update User Name: " + e.getMessage());
		}
		return result;
	}
	
	public int updateEmail(int userId, String email) {
		Connection con = ConnectionClass.getConnection();
		int result = 0;

		try {
			PreparedStatement ps = con.prepareStatement("update user set user.email = ?\r\n" + "where user.id = ?");
			ps.setString(1, email);
			ps.setInt(2, userId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Update User Name: " + e.getMessage());
		}
		return result;
	}

}
