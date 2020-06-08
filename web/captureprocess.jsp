<%@ page language="java"%>

<%@page import ="java.io.*"
import ="MFS100.DeviceInfo"
import ="MFS100.FingerData"
import ="MFS100.MFS100"
import ="MFS100.MFS100Event"
import ="java.util.*"
import ="java.sql.*"%>
<%
    DeviceInfo deviceInfo = new DeviceInfo();
         String key = "";
         MFS100 mfs100 =null;
         String appTitle="MANTRA.MFS100.Test";
         int quality = 60;
         int timeout = 10000;
         byte[] ISOTemplate = null;
         
                // byte[] ISOTemplate1 = null;
                 byte[] ISOTemplate2 = null;
         byte[] ANSITemplate = null;
          FingerData fingerData = new FingerData();
          FingerData fingerData1 = new FingerData();
         
       
// m_FingerPrintImage = new MyIcon(deviceInfo.Width(),deviceInfo.Height());
    // MyIcon m_FingerPrintImage;
      
  
   


        mfs100=new MFS100(null,key);
	int ret = mfs100.Init();
        if (ret == 0) {
	
	deviceInfo = mfs100.GetDeviceInfo();
out.println("Width: " + String.valueOf(deviceInfo.Width())+" "+String.valueOf(deviceInfo.Height()));
        }
 
 int rem = mfs100.AutoCapture(fingerData, timeout, true,true);
 
if(rem==0)
{   
           ISOTemplate = new byte[fingerData.ISOTemplate().length];
         
System.arraycopy(fingerData.ISOTemplate(), 0, ISOTemplate, 0, fingerData.ISOTemplate().length);
out.println("Quality: " + String.valueOf(fingerData.Quality()) + " Nfiq: " + String.valueOf(fingerData.Nfiq()));
//ISOTemplate = new byte[fingerData.ISOTemplate().length];

}
out.println("CAPTURE SUCCESSFUL       ");
out.println(ISOTemplate);

try{
    
}
catch(Exception e)
{
    out.println(e);
}
try{
    Class.forName("com.mysql.jdbc.Driver");  

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/election","root","hpj109tx");
    Statement stmt=con.createStatement(); 
     // Create a SQL query to insert data into demo table 
     // demo table consists of two columns, so two '?' is used 
     PreparedStatement st = con.prepareStatement("INSERT INTO voters VALUES ( ? ,? ,? )");
			 st.setString(1,request.getParameter("username"));
                          st.setString(2, request.getParameter("privatekey"));
                        //  st.setString(3,request.getParameter("aadhar Id")); 
                          st.setBytes(3,ISOTemplate);
			 
			 st.executeUpdate();
			 st.close();
                         con.close();
                          //PrintWriter out = response.getWriter(); 
            out.println("<html><body><b>Successfully Inserted"
                        + "</b></body></html>");

}
catch(Exception e)
{
    out.println(e);
}
%>