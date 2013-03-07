package yoon.service;

import java.sql.Connection;
import java.sql.SQLException;

import test.InvalidMessagePasswordException;
import test.MessageNotFoundException;
import yoon.ServiceException;
import yoon.dao.BookDao;
import yoon.jdbc.ConnectionProvider;
import yoon.jdbc.JdbcUtil;
import yoon.model.Book;

public class DeleteMessageService {
	private static DeleteMessageService instance = new DeleteMessageService();

	public static DeleteMessageService getInstance() {
		return instance;
	}

	private DeleteMessageService() {
	}
	
	public void deleteMessage(int messageId, String password) throws ServiceException, InvalidMessagePasswordException,
	MessageNotFoundException{
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			BookDao bookDao = BookDao.getInstance();
			Book book = bookDao.select(conn, messageId);
			if (book == null) {
				throw new MessageNotFoundException("메시지가 없습니다." + messageId);
			}
			if (!book.hasPassword()) {
				throw new InvalidMessagePasswordException();
			}
			if (!book.getPassword().equals(password)) {
				throw new InvalidMessagePasswordException();
			}
			bookDao.delete(conn, messageId);
			conn.commit();
		} catch (SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 처리 중 에러가 발생했습니다.:" + ex.getMessage(),
					ex);
		} catch (InvalidMessagePasswordException ex) {
			JdbcUtil.rollback(conn);
			throw ex;
		} catch (MessageNotFoundException ex) {
			JdbcUtil.rollback(conn);
			throw ex;
		} finally {
			if (conn != null) {
				try {
					conn.setAutoCommit(false);
				} catch (SQLException e) {
				}
			JdbcUtil.close(conn);
			}
		}	
	}
}
