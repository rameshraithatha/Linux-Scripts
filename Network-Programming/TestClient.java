import java.net.*;
import java.io.*;

class TestClient
{
        public static void main(String [] args)
        {
        	InetAddress serverAddr = null;
		Socket sock = null;
		BufferedReader rd=null;
		BufferedReader kbdin=null;
		PrintStream out =null;
   
		String data;
		try
                {
			serverAddr = InetAddress.getByName("localhost");
		}
		catch(IOException ope)
		{
		}
		try
		{
                   sock=new Socket(serverAddr, 1234);
                   System.out.println("Connection Accepted...");
		   rd = new BufferedReader(new InputStreamReader(sock.getInputStream()));

  		   data = rd.readLine();
		   System.out.println(data);

  	           kbdin = new BufferedReader(new InputStreamReader(System.in));
                   out = new PrintStream(sock.getOutputStream());

		   while(true) {
			data = kbdin.readLine();
			out.println(data);
			data = rd.readLine();
			System.out.println(data);
			if (data.equalsIgnoreCase("BYE"))
				break;
		   }
                   sock.close();

		} catch(IOException ope){

                }

        }
}
