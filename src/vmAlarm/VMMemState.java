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


public class VMMemState {
	
	public static String getVMState(String vm) throws RemoteException, MalformedURLException, UnknownHostException, ParseException
	{	
		
		String textUri = "mongodb://testuser:test123@ds031812.mongolab.com:31812/project02";
		MongoClientURI uri = new MongoClientURI(textUri);
		MongoClient mongoClient = new MongoClient(uri);
		DB db = mongoClient.getDB( "project02" );
		
		DBCollection col2 = db.getCollection("vmMemState");
		BasicDBObject query2 = new BasicDBObject("VMNAME", vm);
		BasicDBObject fields2 = new BasicDBObject("state", 1);
		DBObject res2 = col2.findOne(query2, fields2);
		JSONParser parser2 = new JSONParser();
        JSONObject obj2 = (JSONObject) parser2.parse(res2.toString());
        System.out.println("VM State " + obj2.get("state"));
        String currentState = obj2.get("state").toString();
        
        System.out.println("VM Current State " + currentState);

        return currentState;
		
	}
	
	public static void updateVMState(String vm, String status) throws RemoteException, MalformedURLException, UnknownHostException, ParseException
	{	
		
		String textUri = "mongodb://testuser:test123@ds031812.mongolab.com:31812/project02";
		MongoClientURI uri = new MongoClientURI(textUri);
		MongoClient mongoClient = new MongoClient(uri);
		DB db = mongoClient.getDB( "project02" );
		
		DBCollection col2 = db.getCollection("vmMemState");
		BasicDBObject query2 = new BasicDBObject("VMNAME", vm);
        
        BasicDBObject newDocument = new BasicDBObject();
    	newDocument.append("$set", new BasicDBObject().append("state", status));
    	
    	col2.update(query2, newDocument);
    	System.out.println("VM State updated "+ status);
		
	}

}
