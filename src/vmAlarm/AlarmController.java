package vmAlarm;


public class AlarmController extends Thread{
  		
		String vm = "Test4";
		int cpuTreshold = 30;
		int memTreshold = 70;
		int treshold = 60;
		String selectedTreshold = "cpu";
		Boolean rangeExceeded = false;
		String msg = "Memory/CPU usage exceeded beyond limit";
		String userName = "";
		
		static volatile boolean shutdown = false;
		
		
		
        public AlarmController(String vm, String metric, int treshold, String userName) {
			this.vm = vm;
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

		if(selectedTreshold.equals("cpu"))
		{
			rangeExceeded = CPUUsageMonitor.checkCPUUsage(vm, treshold);
			msg = "CPU usage exceeded beyond limit";
		}
		
		if(selectedTreshold.equals("mem"))
		{
		    rangeExceeded = MemoryUsageMonitor.memoryMonitor(vm, treshold);
		    msg = "Memory usage exceeded beyond limit";
		}
		
		if(selectedTreshold.equals("disk"))
		{
		    rangeExceeded = DiskUsageMonitor.checkDiskUsage(vm, treshold);
		    msg = "Disk usage exceeded beyond limit";
		}
		
		
		if(selectedTreshold.equals("sys"))
		{
		    rangeExceeded = SystemUsageMonitor.checkSysUsage(vm, treshold);
		    msg = "System usage exceeded beyond limit";
		}
		
		if(selectedTreshold.equals("net"))
		{
		    rangeExceeded = NetworkUsageMonitor.checkNetUsage(vm, treshold);
		    msg = "Network usage exceeded beyond limit";
		}
		
	
		if(rangeExceeded)
		   {
			System.out.println("Generating Alarm");
			SendMail.sendMail(msg, vm, userName);
		   }	

		    Thread.sleep(2500);
	      }
		
		
	   }
		catch (Exception e) {
		   e.printStackTrace();

		}	
	}

}
