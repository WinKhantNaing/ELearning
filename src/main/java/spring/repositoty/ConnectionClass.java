package spring.repositoty;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionClass {
	static Connection con=null;
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_learning","root","root");
					System.out.println("con :"+con);

			} catch (ClassNotFoundException ex) {
			System.out.println("Driver :"+ex.getMessage());

			} catch (SQLException ex) {
			System.out.println("Error :"+ex.getMessage());
			}
		return con;
	    }
    }
