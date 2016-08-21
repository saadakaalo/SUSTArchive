/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sust_archive.databaseservice;

import com.sust_archive.service.DbConstant;

/**
 *
 * @author Biswajit Debnath
 */
public class GetQuery {
    
            
    //Selecing from database query
    public static String getQuota() {
        return "select quota_id, quota_name from sust_arp.quota order by quota_id";
    }

    public static String getPosType() {
        return "select postype_id, postype_name from sust_arp.position_type order by postype_id";
    }

    public static String getUnitId(String unitName) {
        return "select  unit_id from sust_arp.unit where unit_name ='" + unitName + "'";
    }

    public static String getGroupNoId(String groupName) {
        return "select group_id from sust_arp.group where group_name = '" + groupName + "'";
    }

    public static String getUnitName(String unitId) {
        return "select unit_name from sust_arp.unit where unit_id=" + unitId;
    }

    public static String getGroupName(String groupId) {
        return "select group_name from sust_arp.group where group_id=" + groupId;
    }

    public static String getUnitGroup() {
        return "select merit_list_name_id, unit_name, group_name from ((select * from sust_arp.unit join sust_arp.merit_list_name using(unit_id)) as sau join (select * from sust_arp.group) as sug using(group_id));";
    }

    public static String getResultQuery() {
        return "select query_key, unit_name, group_name, postype_name, quota_name, start_roll, end_roll, pdf_no, priority from "
                + "(((((select * from sust_arp.merit_list_name join sust_arp.result_query using (merit_list_name_id)) as rsq "
                + "join (select * from sust_arp.unit) as sau using (unit_id)) join (select * from sust_arp.group) as sug using (group_id))"
                + "join (select * from sust_arp.position_type) as sup using(postype_id)) join (select * from sust_arp.quota) as suq "
                + "using(quota_id)) order by  postype_name, quota_name, unit_name,  group_name";
    }
    
    public static String getStudentSerial(String meritList, String posType, String quotaName, String startRank, String endRank){
        return "select exam_roll, t.position from "+DbConstant.ADM_SCHEMA+".sust_result t " +
               "where t.merit_list like '"+meritList+"' and t.quota like '"+quotaName+"' and " +
               "t.position_type like '"+posType+"'" + " order by t.exam_roll" ;
    }

    //Adding data to database query
    public static String addQuota(String quotaName) {
        return "insert into sust_arp.quota (quota_name) values ( '" + quotaName + "' )";
    }

    public static String addPosType(String posType) {
        return "insert into sust_arp.position_type (postype_name) values ( '" + posType + "' )";
    }

    public static String addUnit(String unit) {
        return "insert into sust_arp.unit (unit_name) values ('" + unit + "')";
    }
    
    

    public static String addGroup(String groupNo) {
        return "insert into sust_arp.group (group_name) values ('" + groupNo + "')";
    }

    public static String addMeritListName(String unitId, String groupId) {
        return "insert into sust_arp.merit_list_name (unit_id, group_id) values (" + unitId + "," + groupId + ")";
    }

    public static String addMeritList() {
        return "insert into sust_arp.result_query( "
                + "sust_arp.result_query.merit_list_name_id, "
                + "sust_arp.result_query.postype_id, "
                + "sust_arp.result_query.quota_id "
                + " ) "
                + "select * from "
                + "	((select sust_arp.merit_list_name.merit_list_name_id from sust_arp.merit_list_name) as merit_list_ids"
                + " join (select sust_arp.position_type.postype_id from sust_arp.position_type) as postype_ids)"
                + " join (select sust_arp.quota.quota_id from sust_arp.quota) as quota_type_ids"
                + " where (merit_list_name_id, postype_id,quota_id) not in"
                + "(select sust_arp.result_query.merit_list_name_id, sust_arp.result_query.postype_id, sust_arp.result_query.quota_id from sust_arp.result_query);";
    }

    //Deleting data from database query
    public static String delUnit(String key) {
        return "delete from sust_arp.unit where unit_id = " + key;
    }

    public static String delGroupNo(String key) {
        return "delete from sust_arp.group where group_id = " + key;
    }

    public static String delQuota(String key) {
        return "delete from sust_arp.quota where quota_id = " + key;
    }

    public static String delPosType(String key) {
        return "delete from sust_arp.position_type where postype_id = " + key;
    }

    public static String delUnitGroup(String key) {
        return "delete from sust_arp.merit_list_name where merit_list_name_id=" + key;
    }

    /*
     Updating database query
     */
    
    public static String updateResultQuery(int sroll,  int eroll, int pdf, int priority, int key) {
        return "update sust_arp.result_query set start_roll="+sroll + ", end_roll=" + eroll + ", pdf_no=" + pdf + ", priority=" + priority + " where query_key=" + key;
    }

}
