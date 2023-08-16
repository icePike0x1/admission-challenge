## EXERCISE 1

1. SSH to server1
2. Run the following command: 
```bash
curl http://www.textfiles.com/art/bnbascii.txt
```
3. What went wrong? Fix the issue and add the command that fixes the issue to `exercise1-fix.sh`
   
**_answer: there was a faulty static route the the remote host www.textfiles.com (208.86.224.90) via enp0s8 interface
once it was removed, communication was restored._**

> Once you're done continue to the next exercise

[Next: **Exercise 2 ** ➡️](exercise-2.md)
