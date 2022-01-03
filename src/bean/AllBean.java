package bean;

import java.util.ArrayList;

public class AllBean {
	SelectBean sb = new SelectBean();
	ArrayList al = null;
	
	public ArrayList getHotel(){
		String sql = "select * from hotel";
		String args[] = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getPutup(){
		String sql = "select a.*,b.name as hotelname from putup a,hotel b where a.hotel=b.id";
		String args[] = {"id","name","code","phone","hotel","number","begindate","enddate","money","hotelname"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getBadness(){
		String sql = "select a.*,b.realname as realname,b.card as card from badness a,users b where a.users=b.id";
		String args[] = {"id","users","explain","dates","realname","card"};
		al = sb.select(sql, args);
		return al;
	}
	public ArrayList getUsers(){
		String sql = "select * from users";
		String args[] = {"id","name","pwd","realname","sex","age","card","address","phone","email","code","type"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getPutupO(){
		String sql = "select a.*,b.name as hotelname,b.price as price,datediff(day,a.begindate,a.enddate)*b.price as sumprice from putup a,hotel b where a.hotel=b.id";
		String args[] = {"id","name","code","phone","hotel","number","begindate","enddate","money","hotelname","price","sumprice"};
		al = sb.select(sql, args);
		return al;
	}
	
	public ArrayList getPutup(String begin,String end){
		String sql = "select a.*,b.name as hotelname,b.price as price,datediff(day,a.begindate,a.enddate)*b.price as sumprice from putup a,hotel b where a.hotel=b.id and datediff(day,begindate,'"+begin+"')<=0 and  datediff(day,begindate,'"+end+"')>=0";
		String args[] = {"id","name","code","phone","hotel","number","begindate","enddate","money","hotelname","price","sumprice"};
		al = sb.select(sql, args);
		return al;
	}
}
