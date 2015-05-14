package vmAlarm;

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


public class MemoryUsageMonitor {
	
	public static String overallMem = "10";	

	public static Boolean memoryMonitor(String vm, int Treshold) throws RemoteException, MalformedURLException, UnknownHostException, ParseException
	{
		
		Boolean result = false;
		String textUri = "mongodb://testuser:test123@ds031812.mongolab.com:31812/project02";
		MongoClientURI uri = new MongoClientURI(textUri);
		MongoClient mongoClient = new MongoClient(uri);
		DB db = mongoClient.getDB( "project02" );

		
		System.out.println("Connected to MongoDB");
		
		DBCollection coll = db.getCollection("vmlog");
		
		BasicDBObject query = new BasicDBObject("VMNAME", vm);
		
		DBObject sort = new BasicDBObject("_id", -1);
		
		BasicDBObject fields = new BasicDBObject("mem", 1);
		
		DBObject res = coll.findOne(query, fields, sort);
		
		System.out.println("Basic Obj : " + res);
		JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject) parser.parse(res.toString());
        
        System.out.println("Memory Usage " + obj.get("mem"));
        
        String memUsage = obj.get("mem").toString();
        String currentState = VMMemState.getVMState(vm);
		
		if(Integer.parseInt(memUsage) >((Treshold *Integer.parseInt(overallMem))/100))
		{
			
			if(currentState.equals("normal"))
			{
				result = true;
			}
			else
			{
			result = false;
			}
			
			VMMemState.updateVMState(vm, "exceeded");
		}
        
		else{
			result = false;
			VMMemState.updateVMState(vm, "normal");
		}
		

		//DBCursor cursor = coll.find(query);
		//cursor.sort(new BasicDBObject("_id", -1)).limit(1);

		/*try {
		   while(cursor.hasNext()) {
			   
			   //BasicDBObject obj = cursor.next();
			   //String id = obj.getString("User_ID");   
			   
		       System.out.println("Cursor result " + cursor.next());
		       DBObject dbo = cursor.next();
		       System.out.println("DBObject result " + dbo);
		       String s = dbo.toString();
		       //String s = cursor.next().toString(); 
		       
		       System.out.println("S result : " + s);
		       
		       
		        JSONParser parser = new JSONParser();
		        JSONObject obj = (JSONObject) parser.parse(s);
		        //JSONObject obj1 = (JSONObject) obj;
		        
		        System.out.println("CPU Usage " + obj.get("message"));
                
		   }
		} finally {
		   cursor.close();
		} */
		
		       
		return result;
        
        
	}
	
}
