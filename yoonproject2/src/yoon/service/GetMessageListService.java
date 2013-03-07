package yoon.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;


import yoon.ServiceException;
import yoon.dao.BookDao;
import yoon.jdbc.ConnectionProvider;
import yoon.jdbc.JdbcUtil;
import yoon.model.Book;
import yoon.model.MessageListView;



public class GetMessageListService {
	
	private static GetMessageListService instance = new GetMessageListService();
		
	public static GetMessageListService getInstance() {
		return instance;
	}
	
	private GetMessageListService() {
	}
	
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	public MessageListView getMessageList(int pageNumber) throws ServiceException {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			BookDao bookDao = BookDao.getInstance();
			
			int messageTotalCount = bookDao.selectCount(conn);
			
			List<Book> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			
			if(messageTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				messageList = bookDao.selectList(conn, firstRow, endRow);
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			} 
			return new MessageListView(messageList, messageTotalCount, currentPageNumber, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch(SQLException e) {
			throw new ServiceException("메시지 목록 구하기 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
