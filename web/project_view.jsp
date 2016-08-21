<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
    <head>
        <title>project_view</title>
        <link rel="stylesheet"  href="reset.css"/>
        <link rel="stylesheet"  href="style.css"/>
    </head>

    <body>

        <div class="mainview" align="center">

            <header>
                <h2>SUST ARCHIVE</h2>
            </header>

            <div class="mainbody">

                <div class="tableview" align="center">

                    <form action="testServlet" method="get">
                    
                        <input type="hidden" value="projectView" name="methodName"/>

                        <div class="unittype_table">
                            <table>

                                <tr>
                                    <th>Project Name</th>
                                    <th>Group ID</th>
                                    <th>Registration No</th>
                                    <th>Course Code</th>
                                    <th>Download</th>
                                </tr>

                                <% Iterator itr;

                                //List<String> list = new ArrayList<String>();
                                    
                                  //  for(int i=0; i<20;i++)
                                    //   list.add(""+i+" test");
                                
                                    List list = (List) request.getAttribute("projectList");
                                    for (itr = list.iterator(); itr.hasNext();) {
                                        String pn = (String) itr.next();
                                        String id = (String) itr.next();
                                        String roll = (String) itr.next();
                                        String supervisor = (String) itr.next();
                                        String download = (String) itr.next();
                                %>

                                <tr>
                                    <td><%=pn%></td>
                                    <td><%=id%></td>
                                    <td><%=roll%></td>
                                    <td><%=supervisor%></td>
                                    <td><input type="submit" value="<%=roll%>" name="choicebutton"></td>
                                </tr>

                                <%}%>
                            </table>
                        </div>
                        
                        </form>  
                </div>
            </div>

            <div class="footer">
                <p><a href="index.html">Home</a></p>
                <p>Developed By: SUST-CSE</p>
            </div> 

        </div>

       

    </body>
</html>