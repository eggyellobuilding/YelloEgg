package egg.qaboard.model;

import org.mybatis.spring.SqlSessionTemplate;

public class QaBoardDAOImple implements QaBoardDAO {

	 private SqlSessionTemplate sqlMap;

	public QaBoardDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	 
	 
}
