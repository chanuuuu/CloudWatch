package vmAlarm;

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

public class DiskUsageMonitor {

	public static String overallDisk = "2000";
	public static Boolean checkDiskUsage(String vm, int Treshold) throws RemoteException, MalformedURLException, UnknownHostException, ParseException
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
		
		BasicDBObject fields = new BasicDBObject("Disk", 1);
		
		DBObject res = coll.findOne(query, fields, sort);
		
		System.out.println("Basic Obj : " + res);
		JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject) parser.parse(res.toString());
        
        System.out.println("Disk Usage " + obj.get("Disk"));
        String diskUsage = obj.get("Disk").toString();
        
        String currentState = VMDiskState.getVMState(vm);
		
		if(Integer.parseInt(diskUsage) >((Treshold * Integer.parseInt(overallDisk))/100))
		{
			if(currentState.equals("normal"))
			{
				result = true;
			}
			else
			{
			result = false;
			}
			
			VMDiskState.updateVMState(vm, "exceeded");
			
		}
        
		else{
			result = false;
			VMDiskState.updateVMState(vm, "normal");
		}
		
		return result;
        
        
	}
	
	
}
