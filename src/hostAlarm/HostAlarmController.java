package hostAlarm;


public class HostAlarmController extends Thread{
  		
		String vHost = "Test4";
		int cpuTreshold = 30;
		int memTreshold = 70;
		int treshold = 60;
		String selectedTreshold = "cpu";
		Boolean rangeExceeded = false;
		String msg = "Memory/CPU usage exceeded beyond limit";
		String userName = "";
		
		static volatile boolean shutdown = false;
		
		
		
        public HostAlarmController(String vHost, String metric, int treshold, String userName) {
			this.vHost = vHost;
			selectedTreshold = metric;
			this.treshold = treshold;
			this.userName = userName;
			
		}

        public void stopThread(Boolean flag){
        	shutdown = true;
        }

		public void run() {
			
    	 
		try {
		while (!shutdown) {

		if(selectedTreshold.equals("cpu_usage"))
		{
			rangeExceeded = HostCPUUsageMonitor.checkCPUUsage(vHost, treshold);
			msg = "CPU usage exceeded beyond limit";
		}
		
		if(selectedTreshold.equals("mem_usage"))
		{
		    rangeExceeded = HostMemoryUsageMonitor.memoryMonitor(vHost, treshold);
		    msg = "Memory usage exceeded beyond limit";
		}
		
		if(selectedTreshold.equals("disk_usage"))
		{
		    rangeExceeded = HostDiskUsageMonitor.checkDiskUsage(vHost, treshold);
		    msg = "Disk usage exceeded beyond limit";
		}
		
		
		/*if(selectedTreshold.equals("sys"))
		{
		    rangeExceeded = HostSystemUsageMonitor.checkSysUsage(vm, treshold);
		    msg = "System usage exceeded beyond limit";
		}*/
		
		if(selectedTreshold.equals("net_usage"))
		{
		    rangeExceeded = HostNetworkUsageMonitor.checkNetUsage(vHost, treshold);
		    msg = "Network usage exceeded beyond limit";
		}
		
	
		if(rangeExceeded)
		   {
			System.out.println("Generating Alarm on Host");
			SendMail.sendMail(msg, vHost, userName);
		   }	

		    Thread.sleep(2500);
	      }
		
		
	   }
		catch (Exception e) {
		   e.printStackTrace();

		}	
	}

}
