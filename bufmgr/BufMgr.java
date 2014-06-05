package bufmgr;

import global.GlobalConst;
import global.Minibase;
import global.Page;
import global.PageId;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

/**
 * <h3>Minibase Buffer Manager</h3>
 * The buffer manager manages an array of main memory pages.  The array is
 * called the buffer pool, each page is called a frame.  
 * It provides the following services:
 * <ol>
 * <li>Pinning and unpinning disk pages to/from frames
 * <li>Allocating and deallocating runs of disk pages and coordinating this with
 * the buffer pool
 * <li>Flushing pages from the buffer pool
 * <li>Getting relevant data
 * </ol>
 * The buffer manager is used by access methods, heap files, and
 * relational operators.
 */
public class BufMgr implements GlobalConst 
{

    protected Page[] frames;
    protected FrameDesc[] frameDesc;
    protected Clock repPolicy;
    protected HashMap<PageId,Integer> frameMap;
    protected ArrayList<PageId> dirtyPages;
    protected ArrayList<PageId> free;

    /**
     * Constructs a buffer manager by initializing member data.  
     * 
     * @param numframes number of frames in the buffer pool
     */
    public BufMgr(int numofframes) 
    {
    	
        frames = new Page[numofframes];
        frameDesc = new FrameDesc[numofframes];
        dirtyPages = new ArrayList<PageId>(numofframes);
        free = new ArrayList<PageId>(numofframes);
        
        for(int cntr =0; cntr < numofframes ; cntr++)
        	
        {
        	frames[cntr] = new Page();
            frameDesc[cntr] = new FrameDesc();
            
        }
        
        frameMap = new LinkedHashMap<PageId,Integer>(numofframes); // frameMaps a disk page number to a frame descriptor
        repPolicy = new Clock(numofframes);
        
    } // public BufMgr(int numframes)

    /**
     * The result of this call is that disk page number firstid should reside in
     * a frame in the buffer pool and have an additional pin assigned to it,
     * and mempage should refer to the contents of that frame. <br><br>
     *
     * If disk page firstid is already in the buffer pool, this simply increments
     * the pin count.  Otherwise, this<br>
     * <pre>
     * 	uses the replacement policy to select a frame to replace
     * 	writes the frame's contents to disk if valid and dirty
     * 	if (contents == PIN_DISKIO)
     * 		read disk page firstid into chosen frame
     * 	else (contents == PIN_MEMCPY)
     * 		copy mempage into chosen frame
     * 	[omitted from the above is maintenance of the frame table and hash frameMap]
     * </pre>
     * @param firstid identifies the page to pin
     * @param mempage An output parameter referring to the chosen frame.  If
     * contents==PIN_MEMCPY it is also an input parameter which is copied into
     * the chosen frame, see the contents parameter.
     * @param contents Describes how the contents of the frame are determined.<br>
     * If PIN_DISKIO, read the page from disk into the frame.<br>
     * If PIN_MEMCPY, copy mempage into the frame.<br>
     * If PIN_NOOP, copy nothing into the frame - the frame contents are irrelevant.<br>
     * Note: In the cases of PIN_MEMCPY and PIN_NOOP, disk I/O is avoided.
     * @throws IllegalArgumentException if PIN_MEMCPY and the page is pinned.
     * @throws IllegalStateException if all pages are pinned (i.e. pool is full)
     */
    public void pinPage(PageId firstid, Page mempage, int contents) 
    {
        int frameNo;

        if(frameMap.containsKey(firstid)) // Page in bufferpool
        {
        	
            frameNo = frameMap.get(firstid);
            frameDesc[frameNo].setPinCount(frameDesc[frameNo].getPinCount()+1);

            if(contents == PIN_DISKIO)
            {
            	Minibase.DiskManager.read_page(firstid, mempage);
            }
            else
            {
                mempage.setPage(frames[frameNo]);
            }
        }
        else	
        {
            int frameno = repPolicy.pickVictim( frameDesc );
            frameDesc[frameno].setValidData(true);
            frameDesc[frameno].setRefbit(true);
            
            if(contents == PIN_NOOP) 
            {
                frameDesc[frameno].setPinCount(frameDesc[frameno].getPinCount() + 1);
                mempage.setPage(frames[frameno]);
                frameMap.put(firstid, frameno);	        		
            }
                        
            else if(contents == PIN_MEMCPY) 
            {
            	
                frameDesc[frameno].setPinCount(frameDesc[frameno].getPinCount() + 1);
                frames[frameno].copyPage(mempage);
                frameMap.put(firstid, frameno);
            }
            
            else if(contents == PIN_DISKIO) 
            {
                frameDesc[frameno].setPinCount(frameDesc[frameno].getPinCount() + 1);
                Minibase.DiskManager.read_page(firstid, mempage);
                frames[frameno].copyPage(mempage);
                frameMap.put(firstid, frameno);	                

            }

        }

    } // public void pinPage(PageId firstid, Page page, int contents)

    /**
     * Unpins a disk page from the buffer pool, decreasing its pin count.
     * This method should be called with dirty==true if the client has
     * modified the page.  If so, this call should set the dirty bit
     * for this frame.  Further, if pin_count>0, this method should
     * decrement it. If pin_count=0 before this call, throw an exception
     * to report error.
     *
     * @param firstid identifies the page to unpin
     * @param dirty UNPIN_DIRTY if the page was modified, UNPIN_CLEAN otherwise
     * @throws IllegalArgumentException if the page is not in the buffer pool
     *  or not pinned
     */
    public void unpinPage(PageId firstid, boolean dirty) 
    {
        int frameNo = -1;
        if (frameMap.containsKey(firstid)) 
        {
        	frameNo = frameMap.get(firstid);
            if (frameDesc[frameNo].getPinCount() == 0) 
            {
                throw new IllegalArgumentException("Error!!!Page is not pinned...");
            }
        } 
        
        else 	
        {
        	throw new IllegalArgumentException("Error!!!Page is not in bufferpool...");
            
        }
        
        if (dirty) 
        flushPage(firstid);
        frameDesc[frameNo].setPinCount(frameDesc[frameNo].getPinCount() - 1);
        frameDesc[frameNo].setDirty(false);  

    } // public void unpinPage(PageId firstid, boolean dirty)

    /**
     * Allocates a run of new disk pages and pins the first one in the buffer pool.
     * The pin will be made using PIN_MEMCPY.  Watch out for disk page leaks.
     *
     * @param firstpg input and output: holds the contents of the first allocated page
     * and refers to the frame where it resides
     * @param run_size input: number of pages to allocate
     * @return page id of the first allocated page
     * @throws IllegalArgumentException if firstpg is already pinned
     * @throws IllegalStateException if all pages are pinned (i.e. pool exceeded)
     */
    
    public PageId newPage(Page firstpg, int run_size) 
    {
        PageId pageId = Minibase.DiskManager.allocate_page(run_size);
        Minibase.DiskManager.read_page(pageId, firstpg);
        pinPage(pageId, firstpg, PIN_MEMCPY);
        return pageId;
        
    } // public PageId newPage(Page firstpg, int run_size)

    /**
     * Deallocates a single page from disk, freeing it from the pool if needed.
     *
     * @param firstid identifies the page to remove
     * @throws IllegalArgumentException if the page is pinned
     */
    public void freePage(PageId firstid) 
    { 
    	
        int frameNo;
        if (frameMap.containsKey(firstid)) 
        {
            frameNo = frameMap.get(firstid);
            if (frameDesc[frameNo].getPinCount() > 0) 
            {
                throw new IllegalArgumentException("Error!!! Page is pinned");
            }
            frameMap.remove(firstid);
        }
        
        Minibase.DiskManager.deallocate_page(firstid);
        
    } // public void freePage(PageId firstid)

    /**
     * Write all valid and dirty frames to disk.
     * Note flushing involves only writing, not unpinning or freeing
     * or the like.
     *
     */
    
    public void flushAllFrames() 
    {  
    	for (PageId dirtyPageId : dirtyPages) 
        {
            flushPage(dirtyPageId);
        }
    } // public void flushAllFrames()

    /**
     * Write a page in the buffer pool to disk, if dirty.
     *
     * @throws IllegalArgumentException if the page is not in the buffer pool
     */
    public void flushPage(PageId firstid) 
    {
        if (!frameMap.containsKey(firstid))
            throw new IllegalArgumentException("Error!!! Page is not in buffer pool");
        
        Page frame = frames[frameMap.get(firstid)];
        Minibase.DiskManager.write_page(firstid, frame);
    }

     /**
     * Gets the total number of unpinned buffer frames.
     */
    public int getNumUnpinned() 
    {
        int total=0; 
        for (FrameDesc frameState: frameDesc)
        {
            if (frameState.getPinCount()==0)
                total=total+1;
        }

        return total;
    } 
    /**
     * Gets the total number of buffer frames.
     */
    public int getNumFrames() 
    {    
        return frameDesc.length;
    }
} // public class BufMgr implements GlobalConst
