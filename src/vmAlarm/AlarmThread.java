package vmAlarm;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import com.vmware.vim25.InvalidProperty;
import com.vmware.vim25.RuntimeFault;
import com.vmware.vim25.mo.Folder;
import com.vmware.vim25.mo.InventoryNavigator;
import com.vmware.vim25.mo.ManagedEntity;
import com.vmware.vim25.mo.ServiceInstance;
import com.vmware.vim25.mo.VirtualMachine;

public class AlarmThread {
	
	public static HashMap<String, AlarmController> alarmMap= new HashMap();
	
	//public static void main(String[] args) {
	public static void generateAlarm(String vm, String metric, String Treshold, String userName)
	{
		try{
			
			int treshold_value = Integer.parseInt(Treshold);
			AlarmController al= new AlarmController(vm, metric, treshold_value, userName);
			//Thread t=new Thread(task);
			al.setName(vm + " " + metric +  "Alarm");
			
			al.start();	
			alarmMap.put(al.getName(), al);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally{
			//System.out.println("in finally");
			}
		}
	
	
	
	
	public static void stopAlarm(String name)
	{
		System.out.println("Inside stopAlarm");
		System.out.println("Name of the alarm to stop:" + name);
		
		Set<Thread> threadSet = Thread.getAllStackTraces().keySet();
		Thread[] threadArray = threadSet.toArray(new Thread[threadSet.size()]);
		
		for(int i=0; i< threadArray.length; i++)
		{
			System.out.println("Iterating over threadArray to stop the alarm");
			if(threadArray[i].getName().equals(name))
			{
				System.out.println("Stopping the alarm " + name);
				for(String key: alarmMap.keySet())
				{
					if(key.equals(threadArray[i].getName()))
					{
						AlarmController sThread = alarmMap.get(key);
						sThread.shutdown = true;
						System.out.println("Stopping the alarm..");
						System.out.println("HashMap before Stopping the alarm" + alarmMap);
						alarmMap.remove(key);
						System.out.println("HashMap After Stopping the alarm" + alarmMap);
						
					}
				}
				
			}
		}
		
	}
	
	
	public static Object[] listAlarms()
	{
		ArrayList al = new ArrayList();
		Set<Thread> threadSet = Thread.getAllStackTraces().keySet();
		Thread[] threadArray = threadSet.toArray(new Thread[threadSet.size()]);
		
		for(int i=0; i< threadArray.length; i++)
		{
			if(threadArray[i].getName().contains("Alarm"))
			{
			al.add(threadArray[i].getName().toString());
			System.out.println("Thread Name : " + threadArray[i].getName());
			}
		}	
		
		return al.toArray();
	}
	
	
	public static Object[] listVms() throws InvalidProperty, RuntimeFault, RemoteException, MalformedURLException{
		
		ArrayList al = new ArrayList();
		URL url = new URL("https://130.65.132.102/sdk");
		ServiceInstance si = new ServiceInstance(url, "administrator", "12!@qwQW", true);
		Folder rootFolder = si.getRootFolder();
		String name = rootFolder.getName();
		ManagedEntity[] mes = new InventoryNavigator(rootFolder).searchManagedEntities("VirtualMachine");
		
		for(int i=0; i< mes.length; i++)
		{
			VirtualMachine v = (VirtualMachine) mes[i];
			if(!v.getConfig().template)
			{
				al.add(v.getName());
			}
		}
		
		
		return al.toArray();
		
	}
	

}
