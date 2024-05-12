package spring.repository;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import spring.model.CoursesBean;
import spring.model.PaySubBean;
import spring.model.PhotoDto;
import spring.model.ProfileDto;
import spring.model.UserBean;



public class UserdbRepository {
	
	public String uploadFile(MultipartFile file) {
		String filePath=null;
		try {
			String path="C:\\JAVA.51\\ELearning\\src\\main\\webapp\\resources\\images\\profilephoto";
			String filename=file.getOriginalFilename();
			byte[] bytes=file.getBytes();
			BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(path + File.separator +filename)));
			stream.write(bytes);
			stream.flush();
			stream.close();
			filePath=path + File.separator +filename;
		}catch(Exception e) {
			System.out.println("file upload :"+e.getMessage());
		}
		return filePath;
	}
	
	
	public int insertPhoto(PhotoDto photo) {
		int result=0;
		Connection con = ConnectionClass.getConnection();
			
		try {
		PreparedStatement ps =con.prepareStatement("UPDATE user SET img = ? WHERE id = 1");
		String filePath=uploadFile(photo.getFile());
		photo.setFilepath(filePath);
		ps.setString(1,photo.getFilepath());
		result=ps.executeUpdate();
		}catch(SQLException e) {
				System.out.println("photo insert :"+e.getMessage());
		}
		
		return result;
	}
	
	public ProfileDto profileUser() {
		
		ProfileDto user=null;
		
		Connection con = ConnectionClass.getConnection();
		try {
		PreparedStatement ps =con.prepareStatement("select * from user where id=1");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			user=new ProfileDto();
			user.setUserId(rs.getInt("id"));
			user.setUserName(rs.getString("username"));
			user.setUserEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setGender(rs.getString("gender"));
		}
		
		
		}catch(SQLException e) {
			System.out.println("Select ProfileUser:"+e.getMessage());
	}
	
		return user;
		
	}
	
	public int levelCount() {
			
			int level=0;
			
			Connection con = ConnectionClass.getConnection();
			try {
			PreparedStatement ps =con.prepareStatement("select count(*) from enrollment where unit_status=1 and user_id=1");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				level=1;
			}
			
			
			}catch(SQLException e) {
				System.out.println("Select LevelCount:"+e.getMessage());
		}
		
			return level;
			
		}
	
		public boolean  subscription() {
			
			boolean status=false;			
			Connection con = ConnectionClass.getConnection();
			try {
			PreparedStatement ps =con.prepareStatement("select subscription_id from payment where user_id=1");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				status=true;
			}
			
			
			}catch(SQLException e) {
				System.out.println("Select LevelCount:"+e.getMessage());
		}
		
			return status;
			
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
					courseBean.setCourseStatus(rs.getString("purchase_status"));
					courseBean.setCourseDescription(rs.getString("description"));
					courseCompleteList.add(courseBean);
				}
			} catch (SQLException e) {
				System.out.println("Get Courses :" +e.getMessage());
			}
			return courseCompleteList; 
		}
		
		
		
		
		public int updateProfile(ProfileDto user) {
			Connection con = ConnectionClass.getConnection();
			int i=0;
			try {
				PreparedStatement ps = con.prepareStatement("update user set username=?,email=?,password=?,gender=? where id=1");
				ps.setString(1, user.getUserName());
				ps.setString(2, user.getUserEmail());
				ps.setString(3, user.getPassword());
				ps.setString(4,user.getGender());
				ps.setInt(5, user.getUserId());
				i=ps.executeUpdate();		
			} catch (SQLException e) {
				System.out.println("Profile Update : " + e.getMessage());
			}
			
			
			return i;
			
		}
		
		
		
	
		public int addUser(UserBean bean) {
			int result=0;
			Connection con = ConnectionClass.getConnection();
			if (!checkEmail(bean.getUserEmail())) {
				
			try {
				PreparedStatement ps =con.prepareStatement("insert into user(username,email,password,gender,role) values(?,?,?,?,?)");
				ps.setString(1, bean.getUserName());
				ps.setString(2, bean.getUserEmail());
				ps.setString(3, bean.getPassword());
				ps.setString(4, bean.getGender());
				ps.setString(5, bean.getUserRole());
				result=ps.executeUpdate();
				}catch(SQLException e) {
					System.out.println("user insert :"+e.getMessage());
			}
			
			}else {
				System.out.println("Email already exits!!");	
			}
			
			return result;
		}
		
		public boolean checkEmail(String UserEmail) {
			boolean status=false;
			
			Connection con = ConnectionClass.getConnection();
			try {
				PreparedStatement ps = con.prepareStatement("select email from user where email=?");
				ps.setString(1,UserEmail);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					status=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("check email :"+e.getMessage());
			}
			
			return status;
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
	
	
	
}
