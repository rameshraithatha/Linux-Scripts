import java.net.*;
import java.io.*;

class TestServer
{
	public static void main(String [] args)
	{
		
		PrintStream out = null;	
		BufferedReader in = null;

		String data = null;	
		try
		{
			ServerSocket ss = null;
			Socket sock = null;
			ss = new ServerSocket(1234);
			System.out.println("Service Initiated...");
			while (true) {
			sock=ss.accept();
			System.out.println("Received Client Request...");
		
			out= new PrintStream(sock.getOutputStream());
			out.println("Welcome to TestServer");

			in = new BufferedReader(new InputStreamReader(sock.getInputStream()));
			// do something
			
			while (true) {
			   data =in.readLine();
			   out.println(data);
			   if (data.equalsIgnoreCase("BYE"))
				break;	
			}
			sock.close();
			} // outer while
//			ss.close();
		}
		catch (IOException ioe)
		{
		}
	}
}
