package bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import util.DBConn;

public class  ReckoningBean {
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	Boolean autoCommit = false; 
	int temp = 0;
	
	public int insert(ArrayList al,String id){
		int i = 0;
		conn = DBConn.getConn();
		try {
			autoCommit = conn.getAutoCommit();
			conn.setAutoCommit(false);
			st = conn.createStatement();
			for(i = 0;i < al.size();i++){
				ArrayList alRow = (ArrayList)al.get(i);
				st.executeUpdate("update books set storage=storage-"+alRow.get(3)+",sums=sums+"+alRow.get(3)+" where id='"+alRow.get(0)+"'");
				st.executeUpdate("insert into orders(userid,bookid,booksum) values('"+id+"','"+alRow.get(0)+"','"+alRow.get(3)+"')");
				rs = st.executeQuery("select * from paihang where name='"+alRow.get(1)+"'");
				if(rs.next()){
					st.executeUpdate("delete from paihang where name='"+alRow.get(1)+"'");
					st.executeUpdate("insert into paihang(bookid,name) values('"+alRow.get(0)+"','"+alRow.get(1)+"')");
				}else{
					st.executeUpdate("insert into paihang(bookid,name) values('"+alRow.get(0)+"','"+alRow.get(1)+"')");
				}
			}
			if(i == al.size()){
				conn.commit();
			}
		} catch (SQLException e) {
			// TODO �Զ����� catch ��
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO �Զ����� catch ��
				e1.printStackTrace();
			}
			e.printStackTrace();
			temp = -1;			
		} finally{
			try {
				conn.setAutoCommit(autoCommit);
			} catch (SQLException e) {
				// TODO �Զ����� catch ��
				e.printStackTrace();
			}
			DBConn.close(conn,st,rs);
		} 
		return temp;
	}
}
