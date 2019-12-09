package util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBConnection {
	public static Connection getConnection(){
		Connection connection = null;
		ComboPooledDataSource dataSource = new ComboPooledDataSource("mysql-config");
		try {
			connection = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
