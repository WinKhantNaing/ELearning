package spring.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionClass {
	
	
	static Connection con = null;
	
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_learning","root","root");
			System.out.println("con : "+con);
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("Driver : "+ e.getMessage());
		}
		catch(SQLException e) {
			System.out.println("Connection Error : "+ e.getMessage());
		}
		
		return con;
		
	}

}
