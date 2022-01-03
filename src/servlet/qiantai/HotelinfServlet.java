package servlet.qiantai;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Validate;
import bean.SelectBean;

public class HotelinfServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HotelinfServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
SelectBean ib = new SelectBean();
Validate vd = new Validate();
String id = vd.getUnicode(request.getParameter("id"));
String adminshow = vd.getUnicode(request.getParameter("adminshow"));
String adminupdate = vd.getUnicode(request.getParameter("adminupdate"));
String str = "/qiantai/hotelinf.jsp";
String sql2 = "select * from hotel where id='"+id+"'";
String[] args2 = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath"};
ArrayList al2 = ib.select(sql2, args2);
request.setAttribute("bookinf", al2);
if(adminshow != null && !adminshow.equals("")){
	str ="/admin/showhotel.jsp";
}
if(adminupdate != null && !adminupdate.equals("")){
	str ="/admin/updatehotel.jsp";
}
RequestDispatcher rd=request.getRequestDispatcher(str);
rd.forward(request,response);
}

public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
doGet(request,response);
}

/**
* Initialization of the servlet. <br>
*
* @throws ServletException if an error occure
*/
public void init() throws ServletException {
// Put your code here
}

}
