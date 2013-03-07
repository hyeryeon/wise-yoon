package yoon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import yoon.jdbc.JdbcUtil;
import yoon.model.Book;

public class BookDao {

	private static BookDao instance = new BookDao();

	public static BookDao getInstance() {
		return instance;
	}

	private BookDao() {
	}
	
	public int insert(Connection conn, Book book) throws SQLException {
		
		PreparedStatement pstmt = null;
	
		try {
			pstmt = conn.prepareStatement("insert into wookbook (guest_name, password, message, reg_date, admin_name) " +
				"values(?,?,?,?,?)");
			pstmt.setString(1, book.getGuestName());
			pstmt.setString(2, book.getPassword());
			pstmt.setString(3, book.getMessage());
			pstmt.setString(4, book.getRegDate());
			pstmt.setString(5, book.getAdminName());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}	

	public Book select(Connection conn, int id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("select* from wookbook where message_id= ? ");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	protected Book makeMessageFromResultSet(ResultSet rs) throws SQLException {
		Book book = new Book();
		book.setId(rs.getInt("message_id"));
		book.setGuestName(rs.getString("guest_name"));
		book.setPassword(rs.getString("password"));
		book.setMessage(rs.getString("message"));
		book.setRegDate(rs.getString("reg_date"));
		book.setAdminName(rs.getString("admin_name"));
		return book;
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from wookbook");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Book> selectList(Connection conn, int firstRow,
			int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from wookbook order by message_id desc limit ?, ?");
			pstmt.setInt(1, firstRow-1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				List<Book> bookList = new ArrayList<Book>();
				do {
					bookList.add(makeMessageFromResultSet(rs));
				} while(rs.next());
				return bookList;
			} else {
				return Collections.emptyList();
			}
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		} 
	}

	public int delete(Connection conn, int id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn
					.prepareStatement("delete from wookbook where message_id = ?");
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}
}
