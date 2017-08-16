package servlet;


import Bean.BaseBean;
import Bean.QueryDataBean;
import Bean.WeekJson;
import DB.StaticHibernate;
import com.google.gson.Gson;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.UUID;

@WebServlet("/SaveData")
public class SaveDataServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        BaseBean resultBean = new BaseBean();
        String jsonData = request.getParameter("jsonData");
        String week = request.getParameter("week");
        int weekInt;
        if(jsonData == null){
            resultBean.setSuccess(false);
            resultBean.setMessage("缺少参数jsonData");
        } else{
            if(week == null){
                weekInt = Calendar.getInstance().get(Calendar.WEEK_OF_YEAR);
            }else{
                weekInt = Integer.valueOf(week);
            }
            WeekJson  weekJson = new WeekJson();
            weekJson.setJsonData(jsonData);
            weekJson.setWeek(weekInt);
            SessionFactory sf= StaticHibernate.sessionFactory;
            //取得session
            Session session=sf.openSession();
            session.beginTransaction();
            session.saveOrUpdate(weekJson);
            session.getTransaction().commit();
            session.close();
            resultBean.setMessage("保存成功");
        }
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        try {
            writer.append(new Gson().toJson(resultBean));
        }finally {
            writer.close();
        }
    }
}
