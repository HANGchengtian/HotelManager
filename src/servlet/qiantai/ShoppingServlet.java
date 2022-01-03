package servlet.qiantai;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SelectBean;

public class ShoppingServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ShoppingServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookId = request.getParameter("bookId");//��ȡbooks_id
		String m = request.getParameter("i");
		String num = request.getParameter("num"+m);//��ȡ���ﳵ�޸�����
		String str = "";//mapping��תʱ��ֵ
		String sql = "select * from books where id="+bookId;//sql���
		String[] args = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath"};
		String del = request.getParameter("del");//��ȡɾ����Ʒ�ļǺ�
		String remove = request.getParameter("remove");//��ȡ��չ��ﳵ�ļǺ�
		HttpSession session = request.getSession();
		ArrayList login = (ArrayList)session.getAttribute("login");//��ȡ�û���Ϣ
		SelectBean ib = new SelectBean();
		ArrayList al = ib.select(sql, args);//��ѯͼ����Ϣ
		int sum = 1;//����һ��ͼ�������
		if(login == null || login.size() == 0){
			str = "/servlet/SessLoginServlet";//�û���Ϣ������������ҳ
		}else{
			str = "/qiantai/shopping.jsp";//�������ﳵҳ��
			ArrayList shopping = (ArrayList)session.getAttribute("shopping");//��ȡ���ﳵ��Ϣ
			if(bookId !=null && !bookId.equals("")){
				ArrayList altem = (ArrayList)al.get(0);
				if(shopping == null || shopping.size() == 0){//���ﳵΪ��ʱ
					ArrayList alShop = new ArrayList();
					alShop.add(altem.get(0));
					alShop.add(altem.get(1));
					alShop.add(altem.get(5));
					alShop.add(""+sum);
					shopping = new ArrayList();
					shopping.add(alShop);
				}else{
					boolean bool = true;
					for(int i = 0;i < shopping.size();i++){//�����Ƿ�����ͬ����Ʒ���еĻ���Ŀ��1
						ArrayList alShop = (ArrayList)shopping.get(i);
						if(alShop.get(0).equals(bookId)){
							sum = Integer.parseInt(alShop.get(3).toString())+sum;
							if(num != null && !num.equals("")){
								sum = Integer.parseInt(num);
							}
							alShop.set(3,""+sum);
							bool = false;
							break;
						}
					}
					if(bool){//û�еĻ�������һ������Ʒ
						ArrayList alShop = new ArrayList();
						alShop.add(altem.get(0));
						alShop.add(altem.get(1));
						alShop.add(altem.get(5));
						alShop.add(""+sum);
						shopping.add(alShop);
					}
				}
			}
			if(del != null && !del.equals("") && shopping !=null && shopping.size()!= 0){
				shopping.remove(Integer.parseInt(del));//ɾ����Ʒ
			}
			session.setAttribute("shopping",shopping);
			if(remove != null && !remove.equals("") && session.getAttribute("shopping") != null && !session.getAttribute("shopping").equals("")){
				session.removeAttribute("shopping");//��չ��ﳵ
			}
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
