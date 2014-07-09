import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public class IdentityServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public IdentityServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	
	public static final char[] CHARS={'2','3','4','5','6','7','8','9','0',
        '1'};//随机字符的字典
public static Random random = new Random();//随机数

public static String getRandomString(){
//字符的缓存
StringBuffer buf= new StringBuffer();
for(int i=0;i<5;i++){//循环 六次
buf.append(CHARS[random.nextInt(CHARS.length)]);
}
return buf.toString();
}

public static Color getRandomColor(){
return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
}

public static Color getReverseColor(Color c){
return new Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue());
}

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

		response.setContentType("image/jpeg");//设置输出的类型
		  String randomString =getRandomString();//得到返回的字符集
	
		  int with=100;int hight=30;//生成图片的大小
		  Color color=getRandomColor();//用于背景色
		  Color reverse =getReverseColor(color);//用于前景色
		  BufferedImage bi = new BufferedImage(with, hight, BufferedImage.TYPE_INT_RGB);//创建一个彩色的图片
		  Graphics2D g = bi.createGraphics();//获取到绘图对象
		  g.setFont(new Font(Font.SANS_SERIF,Font.BOLD,16));//设置字体
		  g.setColor(color);//设置颜色
		  g.fillRect(0, 0, with, hight);//绘制背景
		  g.setColor(reverse);//设置颜色
		  g.drawString(randomString, 18, 20);//绘制随机字符
		  for(int i=0,n=random.nextInt(100);i<n;i++){//画最多100个噪音点
		   g.drawRect(random.nextInt(with), random.nextInt(hight), 1, 1);//随机噪音点
		  }
		     ServletOutputStream  out =response.getOutputStream();
		                                                         //转换图片格式
		     JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		     encoder.encode(bi);//对图片进行编码
		     out.flush();//输出
			  request.getSession(true).setAttribute("randomString", randomString);
		     
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
