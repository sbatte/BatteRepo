package bufmgr;


public class FrameDesc {
    
    private int pinCount; 
    private Boolean refbit;
    private Boolean dirty;
    private Boolean validData;
    
    public FrameDesc(){
        
        this.pinCount = 0;
        this.refbit = false;
        this.dirty = false;
        this.validData = false;
    }
    
    public int getPinCount() {
		return pinCount;
	}

	public void setPinCount(int pinCount) {
		this.pinCount = pinCount;
	}

	public Boolean isRefbit() {
		return refbit;
	}

	public void setRefbit(Boolean refbit) {
		this.refbit = refbit;
	}
	public Boolean isDirty() {
		return dirty;
	}

	public void setDirty(Boolean dirty) {
		this.dirty = dirty;
	}

	public Boolean isValidData() {
		return validData;
	}

	public void setValidData(Boolean validData) {
		this.validData = validData;
	} 
}