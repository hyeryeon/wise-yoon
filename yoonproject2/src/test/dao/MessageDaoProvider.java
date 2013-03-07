package test.dao;


public class MessageDaoProvider {
	private static MessageDaoProvider instance = new MessageDaoProvider();

	public static MessageDaoProvider getInstance() {
		return instance;
	}

	private MessageDaoProvider() {
	}

	private MySQLMessageDao mysqlDao = new MySQLMessageDao();
	
	private String dbms;

	void setDbms(String dbms) {
		this.dbms = dbms;
	}

	public MessageDao getMessageDao() {
		if ("mysql".equals(dbms)) {
			return mysqlDao;
		} else {
			return null;
		}
	}
}
