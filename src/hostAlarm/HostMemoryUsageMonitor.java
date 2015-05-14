package hostAlarm;

import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.rmi.RemoteException;
import com.mongodb.BasicDBObject;
import com.mongodb.BulkWriteOperation;
import com.mongodb.BulkWriteResult;
import com.mongodb.Cursor;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.ParallelScanOptions;
import com.mongodb.ServerAddress;

import java.util.List;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import static java.util.concurrent.TimeUnit.SECONDS;


public class HostMemoryUsageMonitor {
	
	public static String overallMem = "10";	

	public static Boolean memoryMonitor(String vHost, int Treshold) throws RemoteException, MalformedURLException, UnknownHostException, ParseException
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
		
		BasicDBObject fields = new BasicDBObject("mem_usage", 1);
		
		DBObject res = coll.findOne(query, fields, sort);
		
		System.out.println("Basic Obj : " + res);
		JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject) parser.parse(res.toString());
        
        System.out.println("Memory Usage " + obj.get("mem_usage"));
        
        String memUsage = obj.get("mem_usage").toString();
        String currentState = HostMemState.getHostState(vHost);
		
		if(Double.parseDouble(memUsage) >((((double) Treshold) *Double.parseDouble(overallMem))/100))
		{
			
			if(currentState.equals("normal"))
			{
				result = true;
			}
			else
			{
			result = false;
			}
			
			HostMemState.updateHostState(vHost, "exceeded");
		}
        
		else{
			result = false;
			HostMemState.updateHostState(vHost, "normal");
		}
		
		       
		return result;
        
        
	}
	
}
