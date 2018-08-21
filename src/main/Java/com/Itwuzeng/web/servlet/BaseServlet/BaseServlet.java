package com.Itwuzeng.web.servlet.BaseServlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2018-08-21.
 * <p>
 * by author wz
 * <p>
 * com.Itwuzeng.web.servlet.BaseServlet
 */

public class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
        //得到方法名参数
        String method = req.getParameter("method");
        if (method==null)
        {
            method="execute";
        }

        try {
            //得到这个方法

            Method method1 = this.getClass().getMethod(method, ServletRequest.class, ServletResponse.class);

            //执行这个方法

            String invokeJsp = (String)method1.invoke(this, req, resp);

            //返回String 跳转
            if (invokeJsp!=null)
            {
                req.getRequestDispatcher(invokeJsp).forward(req,resp);
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

    }

    protected String execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        return null;
    }
}
