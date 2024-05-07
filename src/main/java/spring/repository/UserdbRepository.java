package spring.repository;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.web.multipart.MultipartFile;

import spring.model.PhotoDto;
import spring.model.ProfileDto;
import spring.model.UserBean;


public class UserdbRepository {
	
	public String uploadFile(MultipartFile file) {
		String filePath=null;
		try {
			String path="C:\\JAVA.51\\ELearning\\src\\main\\webapp\\resources\\images";
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
		PreparedStatement ps =con.prepareStatement("insert into user img values=?");
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
		PreparedStatement ps =con.prepareStatement("select * from user where id=2");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			user=new ProfileDto();
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
	
	
	
	
	
}
