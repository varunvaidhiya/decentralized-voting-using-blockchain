<%@ page language="java"%>

<%@page import ="java.io.*"
import ="MFS100.DeviceInfo"
import ="MFS100.FingerData"
import ="MFS100.MFS100"
import ="MFS100.MFS100Event"
import ="java.util.*"
import ="java.sql.*"%>
<%
    String privatekey=request.getParameter("privatekey").toString();
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
         
       int count=0;
// m_FingerPrintImage = new MyIcon(deviceInfo.Width(),deviceInfo.Height());
    // MyIcon m_FingerPrintImage;
      
  byte[]output =null;
   


        mfs100=new MFS100(null,key);
	int ret = mfs100.Init();
        if (ret == 0) {
	
	deviceInfo = mfs100.GetDeviceInfo();
out.println("Width: " + String.valueOf(deviceInfo.Width())+" "+String.valueOf(deviceInfo.Height()));
        }
        

        
      try{
    Class.forName("com.mysql.jdbc.Driver");  

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/election","root","hpj109tx");
    Statement stmt=con.createStatement(); 
    
    // PreparedStatement st = con.prepareStatement("Select privateKey , fingerPrint  from voters where privateKey::varchar=\'"+privatekey+"\'");
   // String a=Select fingerprint  from voters where privateKey = '"+privatekey+"'
        PreparedStatement st = con.prepareStatement("Select fingerprint  from voters where privateKey = '"+privatekey+"'");

			 ResultSet rs = st.executeQuery();
			 while ( rs.next() ) {
                           //if(rs.getString("privateKey").equals(privatekey))
                          // {
			 output=rs.getBytes("fingerPrint");
                         count++;
                           //}
                           //else
                           //{
                           //    out.print("INVALID PRIVATEKEY");
                           //}
                          
                         }
			// st.executeUpdate();
			 //stmt.close();
                        // con.close();
                          //PrintWriter out = response.getWriter(); 
          //  out.println("<html><body><b>Successfully Inserted"
                        //+ "</b></body></html>");

      }
catch(Exception e)
{
    out.println(e);
}
     
      if(count==1)
      {
      int red = mfs100.AutoCapture(fingerData1, timeout,  true,true);
       if (red == 0) {
            ISOTemplate2 = new byte[fingerData1.ISOTemplate().length];
 System.arraycopy(fingerData1.ISOTemplate(), 0, ISOTemplate2, 0, fingerData1.ISOTemplate().length);

            int score = 0;
            score = mfs100.MatchISO(output, ISOTemplate2);
            if (score >= 14000) {
           out.print("   FINGERPRINT MATCHED PROCEED TO VOTING  "+String.valueOf(score)+"   ");
            } else if (score >= 0 && score < 14000) {
          out.print("  FINGERPRINT NOT MATCHED   "+String.valueOf(score)+"   ");
            } else {
               out.print("  error  ");
            }
        } else {
         out.print("  erro  ");
       }
       out.println(output);
        out.println(ISOTemplate2);
      }
        

        %>