package yoon.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import yoon.ServiceException;
import yoon.dao.BookDao;
import yoon.jdbc.ConnectionProvider;
import yoon.jdbc.JdbcUtil;
import yoon.model.Book;


public class WriteMessageService {

	private static WriteMessageService instance = new WriteMessageService();

	public static WriteMessageService getInstance() {
		return instance;
	}

	private WriteMessageService() {
	}
	
	public void write(Book book) throws ServiceException {
		Date date = new Date();
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			BookDao bookDao = BookDao.getInstance();
			book.setRegDate(date.toString());
			bookDao.insert(conn, book);
		} catch(SQLException e) {
			throw new ServiceException("메시지 등록 실패 : " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
