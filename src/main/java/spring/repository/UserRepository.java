package spring.repository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.Date;
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
import spring.model.UnitNameListDTO;
import spring.model.UserBean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import spring.model.PaySubBean;
import spring.model.PriceCardDTO;
import spring.model.ProfileDto;

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
				ubean.setUserRole(rs.getString("role"));
				ubean.setFilePath(rs.getString("img"));
				

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return ubean;
	}
	
	public boolean selectEmail(String email) {
		boolean check = false;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Select Email" + e.getMessage());
		}
		return check;
	}

	public int checkExpiration() {

		Connection con = ConnectionClass.getConnection();
		int result = 0;

		try {
			PreparedStatement ps = con
					.prepareStatement("update payment set is_expired = 0 where end_date < CURRENT_DATE");
			result = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("Change Purchase Status : " + e.getMessage());
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
		return status;

	}

	public int addUser(UserBean bean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		if (!checkEmail(bean.getUserEmail())) {
			try {
				PreparedStatement ps = con
						.prepareStatement("insert into user(username,email,password,role) value(?,?,?,?);");
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
	          PreparedStatement ps = con.prepareStatement("update user set status = 0 where id = ?");
	          ps.setInt(1, userId);
	          result = ps.executeUpdate();
	      } catch (SQLException e) {
	          System.out.println("user soft delete :" + e.getMessage());
	      }
	      return result;
	  }
	
	public String fileStorage(MultipartFile file) {
		
		String uploadDir = "./images/profilephoto";
		Path fileStorageLocation = Paths.get(uploadDir ).toAbsolutePath().normalize();
        try {
            if (!Files.exists(fileStorageLocation)) {
                Files.createDirectories(fileStorageLocation);
            }
        } catch (Exception ex) {
            throw new RuntimeException("Could not create the directory where the uploaded files will be stored.", ex);
        }
        
        // Normalize file name
        String fileName = file.getOriginalFilename();

        try {
            if (fileName.contains("..")) {
                throw new RuntimeException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            // Copy file to the target location (Replacing existing file with the same name)
            Path targetLocation = fileStorageLocation.resolve(fileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return uploadDir+"/"+fileName;
            
        } catch (IOException ex) {
            throw new RuntimeException("Could not store file " + fileName + ". Please try again!", ex);
        }
		
	}

	public int insertPhoto(ProfileDto photo, int id) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement("UPDATE user SET img = ? WHERE id = ?");

			String filePath = fileStorage(photo.getFile());
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
				level = rs.getInt("count(*)");
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
			PreparedStatement ps = con.prepareStatement(
					"select u.username,u.img,f.comment,f.date,f.rating from feedback f join user u on f.user_id1=u.id");
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
					.prepareStatement("select count(username) from user where status=1 and role='User'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				usercount = rs.getInt("count(username)");
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
			PreparedStatement ps = con.prepareStatement("select count(distinct user_id) from payment;");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				subusercount = rs.getInt("count(distinct user_id)");
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
			PreparedStatement ps = con.prepareStatement("select count(comment) from feedback");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				feedbackcount = rs.getInt("count(comment)");
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
			PreparedStatement ps = con
					.prepareStatement("select name from lesson where id = ? and purchase_status = 'Free'");
			ps.setInt(1, lessonId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				status = true;
			}

		} catch (SQLException e) {
			System.out.println("Get Unit Status : " + e.getMessage());
		}

		return status;

	}

	public int insertFeedback(FeedbakBean bean, int userId) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into feedback(rating,comment,user_id1,date) values(?,?,?,?)");
			ps.setInt(1, bean.getRating());
			ps.setString(2, bean.getComment());
			ps.setInt(3, userId);
			ps.setDate(4, Date.valueOf(bean.getDate()));
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Feedback : " + e.getMessage());
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

	// for admin to delete subscription plan
	public int deleteSubscriptionPlan(int cid) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update subscription set isactive=0 where id=?");
			ps.setInt(1, cid);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Delete subscription plan :" + e.getMessage());
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

	public boolean checkCurrentPassword(int userId, String password, String newPassword) {
	    Connection con = ConnectionClass.getConnection();
	    boolean result = false;

	    try {
	      PreparedStatement ps = con
	          .prepareStatement("select user.password from user where user.id = ? and user.password = ?");
	      ps.setInt(1, userId);
	      ps.setString(2, password);
	      ResultSet rs = ps.executeQuery();

	      if (rs.next()) {
	        ps = con.prepareStatement("update user set user.password = ? where user.id = ?");
	        ps.setString(1, newPassword);
	        ps.setInt(2, userId);
	        ps.executeUpdate();
	        result = true;
	      }

	    } catch (SQLException e) {
	      System.out.println("Check Current Password: " + e.getMessage());
	    }
	    return result;
	  }

	// for admin to active subscription plan
	public int activeSubscriptionPlan(int cid) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("update subscription set isactive=1 where id=?");
			ps.setInt(1, cid);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Active subscription plan :" + e.getMessage());
		}
		return result;
	}

	// for admin to select subscription plan
	public PriceCardDTO selectSubscriptionPlan(int cid) {
		PriceCardDTO bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from subscription where id=?");
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean = new PriceCardDTO();
				bean.setSubId(rs.getInt("id"));
				bean.setPlan(rs.getString("subscriptionplan"));
				bean.setDuration(rs.getString("duration"));
				bean.setPrice(rs.getDouble("price"));
				bean.setIsActive(rs.getInt("isactive"));
			}
		} catch (SQLException e) {
			System.out.println("Select subscription plan :" + e.getMessage());
		}
		return bean;
	}

	// for admin to update subscription plan
	public int updateSubscriptionPlan(PriceCardDTO bean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(
					"update subscription set subscriptionplan=?,duration=?,price=?,isactive=? where id = ?");
			ps.setString(1, bean.getPlan());
			ps.setString(2, bean.getDuration());
			ps.setDouble(3, bean.getPrice());
			ps.setInt(4, bean.getIsActive());
			ps.setInt(5, bean.getSubId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Update subscription plan :" + e.getMessage());
		}
		return result;
	}

	// for admin (Add subscription plan)
	public int addSubscriptionPlan(PriceCardDTO bean) {
		Connection con = ConnectionClass.getConnection();
		int result = 0;
		try {
			PreparedStatement ps = con
					.prepareStatement("insert into subscription (subscriptionplan , duration, price) value(?,?,?)");
			ps.setString(1, bean.getPlan());
			ps.setString(2, bean.getDuration());
			ps.setDouble(3, bean.getPrice());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Adding subscription plan :" + e.getMessage());
		}
		return result;
	}
	
	public int updateOtp(String otp, String time, String email) {
	    int result = 0;
	    try (Connection con = ConnectionClass.getConnection();
	         PreparedStatement ps = con.prepareStatement("UPDATE User SET otp = ?, otp_created_at = ? WHERE email = ?")) {
	        ps.setString(1, otp);
	        ps.setString(2, time);
	        ps.setString(3, email);
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println("Failed to update OTP: " + e.getMessage());
	    }
	    return result;
	}

	public boolean checkOtpNumber(String otp,String email) {
		boolean check = false;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where otp = ? and email = ?");
			  ps.setString(1, otp);
			  ps.setString(2, email);
		      ResultSet rs = ps.executeQuery();

		        // If there is at least one row in the ResultSet, the OTP exists
		        if (rs.next()) {
		            check = true;
		        }
		} catch (SQLException e) {
			System.out.println("check otp number:  " + e.getMessage());
		}
		
		return check;
		
	}

	public boolean isEmailRegistered(String email) {
		boolean result = false;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            result = true;
		        }
			
		} catch (SQLException e) {
			System.out.println("is email registered: + "+ e.getMessage());
		}
		return result;
		
	}

	public int updatePassword(String psw,String email) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE user SET password = ? WHERE email = ?");
			ps.setString(1, psw);
			ps.setString(2, email);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update user password: " + e.getMessage());
		}
		return result;
	}
}
