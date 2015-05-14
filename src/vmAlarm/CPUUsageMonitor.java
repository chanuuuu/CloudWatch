package vmAlarm;

import java.net.MalformedURLException;
import java.net.URL;
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


public class CPUUsageMonitor {

	public static String overallCPU = "2000";
	public static Boolean checkCPUUsage(String vm, int Treshold) throws RemoteException, MalformedURLException, UnknownHostException, ParseException
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
		
		BasicDBObject fields = new BasicDBObject("cpu", 1);
		
		DBObject res = coll.findOne(query, fields, sort);
		
		System.out.println("Basic Obj : " + res);
		JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject) parser.parse(res.toString());
        
        System.out.println("CPU Usage " + obj.get("cpu"));
        String cpuUsage = obj.get("cpu").toString();
        
        String currentState = VMCPUState.getVMState(vm);
		
		if(Integer.parseInt(cpuUsage) >((Treshold * Integer.parseInt(overallCPU))/100))
		{
			if(currentState.equals("normal"))
			{
				result = true;
			}
			else
			{
			result = false;
			}
			
			VMCPUState.updateVMState(vm, "exceeded");
			
		}
        
		else{
			result = false;
			VMCPUState.updateVMState(vm, "normal");
		}
		
		return result;
        
        
	}
	
	
}
