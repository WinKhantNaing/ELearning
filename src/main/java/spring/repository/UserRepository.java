package spring.repository;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import spring.model.CoursesBean;
import spring.model.FeedbakBean;
import spring.model.LoginBean;
import spring.model.RegisterBean;
import spring.model.SingleLessonDTO;
import spring.model.UserBean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

import spring.model.LoginDTO;
import spring.model.PaySubBean;
import spring.model.PhotoDto;
import spring.model.PriceCardDTO;
import spring.model.ProfileDto;
import spring.model.UserDTO;

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

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return ubean;
	}
	

	public boolean checkPayment(int userId) {

		boolean status = false;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select user_id from payment where user_id = ?;");
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

	/*
	 * public List<PriceCardDTO> showPrice() {
	 * 
	 * PriceCardDTO priceCard = null; List<PriceCardDTO> priceCardList = new
	 * ArrayList<PriceCardDTO>();
	 * 
	 * 
	 * Connection con = ConnectionClass.getConnection(); try { PreparedStatement ps
	 * = con.prepareStatement("select * from subscription"); ResultSet rs =
	 * ps.executeQuery(); // int i = 0; while(rs.next()) { priceCard = new
	 * PriceCardDTO(); priceCard.setPlan(rs.getString("subscriptionplan"));
	 * priceCard.setPrice(rs.getDouble("price"));
	 * priceCard.setDuration(rs.getString("duration"));
	 * 
	 * priceCardList.add(priceCard);
	 * 
	 * System.out.println(priceCard);
	 * System.out.println(priceCardList.get(i++).getPlan());
	 * 
	 * }
	 * 
	 * } catch (SQLException e) {
	 * 
	 * System.out.println("Select from subscription : "+ e.getMessage()); }
	 * 
	 * // System.out.println("pcl"+ priceCardList.size()); //
	 * priceCardList.forEach(c->System.out.println(c.getPlan())); return
	 * priceCardList;
	 * 
	 * 
	 * }
	 */
	public int addUser(UserBean bean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		if (!checkEmail(bean.getUserEmail())) {
			try {
				PreparedStatement ps = con
						.prepareStatement("insert into user(username,email,password,gender,role) value(?,?,?,?,?);");
				ps.setString(1, bean.getUserName());
				ps.setString(2, bean.getUserEmail());
				ps.setString(3, bean.getPassword());
				ps.setString(4, bean.getGender());
				ps.setString(5, bean.getUserRole());
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
			PreparedStatement ps = con.prepareStatement("select email from user where email=?");
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
				user.setUserName(rs.getString("username"));
				user.setUserEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setUserRole(rs.getString("role"));
				userlst.add(user);
			}
		} catch (SQLException e) {
			System.out.println("User Select : " + e.getMessage());
		}
		return userlst;
	}

	public UserBean selectOne(int userEmail) {
		UserBean bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from from user where email=?");
			ps.setInt(2, userEmail);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean = new UserBean();
				bean.setUserName(rs.getString("username"));
				bean.setUserEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setGender(rs.getString("gender"));
				bean.setUserRole(rs.getString("role"));

			}
		} catch (SQLException e) {
			System.out.println("select one User : " + e.getMessage());
		}
		return bean;
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
			filePath = path + File.separator + filename;
		} catch (Exception e) {
			System.out.println("file upload :" + e.getMessage());
		}
		return filePath;
	}

	public int insertPhoto(PhotoDto photo, int id) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement("UPDATE user SET img = ? WHERE id = ?");

			String filePath = uploadFile(photo.getFile());
			photo.setFilepath(filePath);
			ps.setString(1, photo.getFilepath());
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
				user.setGender(rs.getString("gender"));
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
			PreparedStatement ps = con.prepareStatement("select count(*) from enrollment where unit_status=1 and user_id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				level = 1;
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
			PreparedStatement ps = con
					.prepareStatement("update user set username=?,email=?,password=?,gender=? where id=1");
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getUserEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setInt(5, user.getUserId());
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
				System.out.println("get list "+ paySubList);
			}
		} catch (SQLException e) {
			System.out.println("Getting payment and description : " + e.getMessage());
		}
		return paySubList;
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
	
public SingleLessonDTO selectOneLesson(int lessonId) {
		
		SingleLessonDTO slDTO = null;
		
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from lesson where id = ?");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				slDTO = new SingleLessonDTO();
				slDTO.setLessonId(rs.getInt("id"));
				slDTO.setName(rs.getString("name"));
				slDTO.setDescription(rs.getString("description"));
				slDTO.setPurStatus(rs.getString("purchase_status"));
				
			}
		} catch (SQLException e) {
			System.out.println("Select single lesson : "+ e.getMessage());
		}
		
		return slDTO;
				
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
	
}
