package spring.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionClass {

	static Connection con = null;

	public static Connection getConnection() {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning", "root", "refresh");
			System.out.println("con : " + con);
		} catch (ClassNotFoundException e) {
			System.out.println("Driver : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("aDtabase Coonectin not found" + e.getMessage());
		}
		return con;
	}

}
