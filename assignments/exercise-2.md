## EXERCISE 2

1. SSH to server1
2. Run the following command: 
```bash
curl http://www.ascii-art.de/ascii/ab/007.txt
```
3. What went wrong? Fix the issue and add the command that fixes the issue to `exercise2-fix.sh`

**_answer: remote host resolution issue. in the /etc/hosts file the host www.ascii-art.de point to localhost (127.0.0.1) instead of
           it's acctual address._**

> Once you're done continue to the next exercise

[Next: **Exercise 3 ** ➡️](exercise-3.md)
