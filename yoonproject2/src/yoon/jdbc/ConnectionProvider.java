package yoon.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException {
		String jdbcDriver="jdbc:mysql://localhost:3306/chap13?useUnicode=true&characterEncoding=utf8";
		String dbUser="jspexam";
		String dbPass="jspex";
		return DriverManager.getConnection(jdbcDriver, dbUser,dbPass);
	}
}
