package hostAlarm;

import java.net.MalformedURLException;
import java.net.UnknownHostException;
import java.rmi.RemoteException;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;

public class HostNetworkUsageMonitor {

	public static String overallNetwork = "2000";
	public static Boolean checkNetUsage(String vHost, int Treshold) throws RemoteException, MalformedURLException, UnknownHostException, ParseException
	{	
		Boolean result = false;
		String textUri = "mongodb://testuser:test123@ds031812.mongolab.com:31812/project02";
		MongoClientURI uri = new MongoClientURI(textUri);
		MongoClient mongoClient = new MongoClient(uri);
		DB db = mongoClient.getDB( "project02" );
		
		System.out.println("Connected to MongoDB");
		
		DBCollection coll = db.getCollection("vhostlog");
		
		BasicDBObject query = new BasicDBObject("vhostname", vHost);
		
		DBObject sort = new BasicDBObject("_id", -1);
		
		BasicDBObject fields = new BasicDBObject("net_usage", 1);
		
		DBObject res = coll.findOne(query, fields, sort);
		
		System.out.println("Basic Obj : " + res);
		JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject) parser.parse(res.toString());
        
        System.out.println("Network Usage " + obj.get("net_usage"));
        String netUsage = obj.get("net_usage").toString();
        
        String currentState = HostNetState.getHostState(vHost);
		
		if(Integer.parseInt(netUsage) >((Treshold * Integer.parseInt(overallNetwork))/100))
		{
			if(currentState.equals("normal"))
			{
				result = true;
			}
			else
			{
			result = false;
			}
			
			HostNetState.updateHostState(vHost, "exceeded");
			
		}
        
		else{
			result = false;
			HostNetState.updateHostState(vHost, "normal");
		}
		
		return result;
        
        
	}
}
