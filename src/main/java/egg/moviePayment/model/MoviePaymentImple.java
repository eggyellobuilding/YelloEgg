package egg.moviePayment.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MoviePaymentImple implements MoviePaymentDAO {

	private SqlSessionTemplate sqlMap;
	
	public MoviePaymentImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int moviePaymentInfo(MoviePaymentDTO dto) {
		int result = 1;
		return result;
	}

}
