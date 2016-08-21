/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sust_archive.service;

import com.sust_archive.databaseservice.DatabaseService;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gt
 */

public class Method {
    
    
    private static List list = new ArrayList();
    private static ResultSet resultSet;
    
    private static String defaultUserName = "admin";
    private static String defaultPassWord = "sust";
    
    
    public static void indexPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String selectedPage = request.getParameter("choiceButton");
        if(selectedPage.equals("Login")){
            request.getRequestDispatcher("/login.html").forward(request, response);
        }
    }
    public static void loginPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String userName = request.getParameter("username");
        String passWord = request.getParameter("password");
        
        if(userName.equals(defaultUserName) && passWord.equals(defaultPassWord)){
            //list = listUnitGroup();
        //request.setAttribute("listUnitGroup", list);
        request.getRequestDispatcher("/content.html").forward(request, response);
        //    request.getRequestDispatcher("project_download.jsp").forward(request, response);
        }
        else{
            request.getRequestDispatcher("/login.html").forward(request, response);
        }
    }
    public static void contentPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String selectedPage = request.getParameter("choiceButton");
        if(selectedPage.equals("PROJECT")){
            request.getRequestDispatcher("/project_option.html").forward(request, response);
        }
        else if(selectedPage.equals("QUESTION")){
            request.getRequestDispatcher("/question_option.html").forward(request, response);
        }
    }
    public static void projectOptionPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String selectedPage = request.getParameter("choiceButton");
        if(selectedPage.equals("VIEW")){
            //list = listUnitGroup();
            //request.setAttribute("listUnitGroup", list);
            //request.getRequestDispatcher("/project_view.jsp").forward(request, response);
            
            
            list = projectList();
            request.setAttribute("projectList", list);
            request.getRequestDispatcher("/project_view.jsp").forward(request, response);
        }
        else if(selectedPage.equals("UPLOAD")){
            request.getRequestDispatcher("/project_upload.jsp").forward(request, response);
        }
    }
    public static void questionOptionPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String selectedPage = request.getParameter("choiceButton");
        if(selectedPage.equals("VIEW")){
            request.getRequestDispatcher("/question_view.html").forward(request, response);
        }
//        else if(selectedPage.equals("UPDATE")){
//            request.getRequestDispatcher("/queston_update.html").forward(request, response);
//        }
    }

    public static void projectView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedPage = request.getParameter("operation");
        if(selectedPage.equals("Add")){
            //request.getRequestDispatcher("/login.html").forward(request, response);
        }
        list = listUnitGroup();
        for(Object obj: list){
            System.out.println("TEST: " + obj);
        }
        request.setAttribute("listUnitGroup", list);
        request.getRequestDispatcher("/project_view.jsp").forward(request, response);
    }

    public static List listUnitGroup() {
        DatabaseService dbService = new DatabaseService();
        
        list.clear();
        
        //for(int i=0; i<18;i++)
           //list.add(" "+i+" test");

        //String query = GetQuery.getUnitGroup();
        String query = "select merit_list_name_id, unit_name, group_name from sustarchive.test;";
        
        resultSet = dbService.getResultSet(query); 
        
        
        try { 
            while (resultSet.next()) {
                list.add(resultSet.getString("merit_list_name_id"));
                list.add(resultSet.getString("unit_name"));
                list.add(resultSet.getString("group_name"));
            }
        } catch (SQLException error) {
            error.printStackTrace();
        }
        return list;
    }
    
    public static List projectList() {
        DatabaseService dbService = new DatabaseService();
        
        list.clear();
        
        String query = "select reg_no, course_code, project_file from sustarchive.project;";
        
        resultSet = dbService.getResultSet(query); 
        
        
        try { 
            while (resultSet.next()) {
                list.add("Null");
                list.add("Null");
                list.add(resultSet.getString("reg_no"));
                list.add(resultSet.getString("course_code"));
                list.add("Null");
                
                
                // Blobfile download process starts
                //Blob blob = resultSet.getBlob("file_data");
                //InputStream inputStream = blob.getBinaryStream();
                
            }
        } catch (SQLException error) {
            error.printStackTrace();
        }
        return list;
    }
    
    

}
