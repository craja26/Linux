/********* Job Scheduling **********/
- reoccurring of a task.
- schedule a job
at = single time executional task you can schedule using at jobs
cron = daily, monthly, weekly, yearly
atq/ at -l = list out the jobs in the job queue.
# systemctl status atd 
cat /etc/crontab

Question: create a single time executional task to create a folder at 17:30 today
Answer: # at 17:30
	at> mkdir /folder1
	at>		(ctrl+d)
	# at -l 	or atq (check queue)
	# cd /var/spool/at		(frequently changing data, get index number)
	# cat 1i9riere
		( you can see job information)
	
Example: Schedule a job using at
at noon
at midnight
at teatime	(at 4pm)
at now +5hrs
at 17:05 tomorrow
at 11:15am
at 23:45

-- remove at job
# atq
# atrm 2
syntax # atrm <jobid> or at -r <jobid>

- cron
# systemctl status crond
# cat /etc/crontab
Example: schedule a job to add user "raja" at 17:45
Answer:
# crontab -l
# crontab -e
	45 17 18 12 5 /usr/sbin/useradd raja
# systemctl status crond
# crontab -l

Question: Schedule a job executed everyday 2:30pm and 3:30pm
Answer: 30 14,15 * * * <command>

Question: 2 to 8pm Monday to Friday
Answer:  0 14-20 * * mon-fri 

Question: every 10 mins
Answer: */5 * * * *

Question:  Whenever system reboot just remove content in a folder .
Answer: # cat /etc/anacrontab
	# touch /opt/test_reboot{1..10}.txt
	# crontab -e
		@reboot /usr/bin/rm -rf /opt/test_reboot*
	# crontab -l

# tail -f /var/log/cron			(crontab log)

Question: Configure a cron job that runs every 1 minutes and executes:
	logger "EX200 in progress" as the user natasha.
Answer:
	# useradd natasha
	# crontab -eu natasha
		*/1 * * * * logger "EX200 in progress"
	# crontab -lu natasha
	# tail -f /var/log/cron		(verify message in log)

Question: 
Answer: # crontab -eu natasha
	30 14 * * * /bin/echo "Hyer"
	# systemctl status crond	(check crond status)
	
