package bufmgr;


public class Clock 
	{
	private int Is_Present; 
    private int numOfFrames;
       
    public Clock (int numOfFrames)
    	{
    	Is_Present = 0; 
        this.numOfFrames = numOfFrames;
      	}
    public int getAvailable()
	{
	  return Is_Present;
 	}
    public void setAvailable( int available )
	{
    this.Is_Present = available;        
	}
    // Using the psuedo code provided in Project question
    public int pickVictim(FrameDesc[] frametab)
    	{
    	if (frametab[Is_Present]==null)
    		return Is_Present;
        for (int cntr=0 ; cntr < 2*numOfFrames ; cntr++)
        	{  
        	   if (frametab[Is_Present] != null && !frametab[Is_Present].isValidData())
        	   return Is_Present;
               if (frametab[Is_Present] != null && frametab[Is_Present].getPinCount()==0)
            	     {
                         if (frametab[Is_Present].isRefbit())
                         frametab[Is_Present].setRefbit( false );
                         else
                         return Is_Present;
                   	}            
               Is_Present = (++Is_Present) % numOfFrames;
          	}       
            throw new IllegalStateException( "Error!!! could not find an available frame" );
    	}
	}
