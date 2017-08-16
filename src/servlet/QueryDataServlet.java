package servlet;

import Bean.QueryDataBean;
import Bean.WeekJson;
import DB.StaticHibernate;
import com.google.gson.Gson;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

@WebServlet("/QueryData")
public class QueryDataServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        QueryDataBean resultBean = new QueryDataBean();
        String week = request.getParameter("week");
        int weekInt;
        if(week == null){
            weekInt = Calendar.getInstance().get(Calendar.WEEK_OF_YEAR);
        }else{
            weekInt = Integer.valueOf(week);
        }
        //创建工厂
        SessionFactory sf= StaticHibernate.sessionFactory;
        //取得session
        Session session=sf.openSession();
        Query query = session.createQuery("from WeekJson");
        List<WeekJson> list = query.list();
        WeekJson result = null;
        for(WeekJson weekJson :list){
            if(weekJson.getWeek() == weekInt){
                result = weekJson;
                break;
            }
        }
        session.close();
        if(result == null){
            resultBean.setSuccess(false);
            resultBean.setMessage("没有查到数据");
        }else{
            resultBean.setBody(result);
        }
        String resultString = new Gson().toJson(resultBean);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        try {
            writer.append(resultString);
        }finally {
            writer.close();
        }
    }
}
