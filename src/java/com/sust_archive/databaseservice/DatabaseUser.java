/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sust_archive.databaseservice;

/**
 *
 * @author gt
 */
public class DatabaseUser {
    public static String USERNAME="root";
    public static String PASSWORD="sust";
   // public static String DATABASEURL="jdbc:oracle:thin:@localhost:1521:xe";
    public static String DATABASEURL="jdbc:mysql://localhost:3306/sustarchive";
   // public static String DATABASETYPE="oracle.jdbc.driver.OracleDriver";
    public static String DATABASETYPE="com.mysql.jdbc.Driver";
}
