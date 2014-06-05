PROJECT : Buffer Manager

AIM : To implement a simple buffer management layer (without support for concurrency control and recovery) for the Minibase Database System

TEAM MEMBERs : 

Sravya Batte
Elnaz Bayazian
Madhulika Indukuru

TEAM CONTRIBUTION :

We had several meetings where we tried to communicate, discussed how to solve the problem, developed plans accordingly and made decisions to work together.
On the whole, we have equally contributed for the project complete successfully without any errors.

PROJECT FILES :

   We have created three files BufMgr.java,FrameDesc.java and Clock.java.
In BufMgr.java, we have implemented LRU Strategy with supporting classes and methods that has to be implemented methods such as "flushAllPages" to call and clean-up by Minibase when things are shut down to flush all dirty pages to disk.
Created Clock.java using the pseudo code mentioned in project page.
Created constructors, setters and getters in FrameDesc.java and are called accordingly in BufMgr.java
