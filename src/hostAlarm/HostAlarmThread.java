package hostAlarm;

import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import com.vmware.vim25.InvalidProperty;
import com.vmware.vim25.RuntimeFault;
import com.vmware.vim25.mo.Folder;
import com.vmware.vim25.mo.HostSystem;
import com.vmware.vim25.mo.InventoryNavigator;
import com.vmware.vim25.mo.ManagedEntity;
import com.vmware.vim25.mo.ServiceInstance;
import com.vmware.vim25.mo.VirtualMachine;

public class HostAlarmThread {
	
	public static HashMap<String, HostAlarmController> alarmMap= new HashMap();

	public static void generateAlarm(String vHost, String metric, String Treshold, String userName)
	{
		try{
			
			int treshold_value = Integer.parseInt(Treshold);
			HostAlarmController al= new HostAlarmController(vHost, metric, treshold_value, userName);
			al.setName(vHost + " " + metric +  "Alarm");
			
			al.start();	
			//alarmMap.put(al.getName(), al);
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
		Set<Thread> threadSet = Thread.getAllStackTraces().keySet();
		Thread[] threadArray = threadSet.toArray(new Thread[threadSet.size()]);
		
		for(int i=0; i< threadArray.length; i++)
		{
			if(threadArray[i].getName().equals(name))
			{
				System.out.println("Stopping the alarm " + name);
				for(String key: alarmMap.keySet())
				{
					if(key.equals(threadArray[i].getName()))
					{
						HostAlarmController sThread = alarmMap.get(key);
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
			if(threadArray[i].getName().contains("Alarm") & threadArray[i].getName().contains("130.65"))
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
		ManagedEntity[] mes = new InventoryNavigator(rootFolder).searchManagedEntities("HostSystem");
		
		for(int i=0; i< mes.length; i++)
		{
			HostSystem h = (HostSystem) mes[i];
				al.add(h.getName());
		}
		
		
		return al.toArray();
		
	}
	

}
