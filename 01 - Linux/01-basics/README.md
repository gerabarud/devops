## cron

> **Hint:** Use "fully qualified commands (full path)" in the script when scheduling jobs with cron. You can verify the full path of a command with the command `which`. 

Editing cron: You can add or modify cron jobs for the **current user**
```bash
crontab -e
```
Editing cron for root user
```bash
sudo crontab -u root -e
```

Each line in a crontab file represents a cron job and follows the next format:
```bash
* * * * * command
```
Fields: from left to right:
- Minute (0-59)
- Hour (0-23)
- Day of the month (1-31)
- Month (1-12 or Jan-Dec)
- Day of the week (0-7 or Sun-Sat)
- command to schedule

Special characters:
- **Asterisk (*):** Matches any value. For example, * in the month field means "every month."
- **Comma (,):** Separates multiple values within a field. For example, 1,3,5 in the month field means "January, March, and May."
- **Hyphen (-):** Specifies a range of values. For example, 1-5 in the day of the week field means "Monday to Friday."
- **Slash (/):** Specifies a step value. For example, */15 in the minute field means "every 15 minutes."

Example of a cron job that runs a script every day at 8:00 AM
```bash
0 8 * * * /path/to/script.sh
```