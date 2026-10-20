#include <stdio.h>
#include <string.h>
#include <syslog.h>
#include <errno.h>

int main(int argc, char *argv[])
{

	// Open syslog using LOG_USER facility
        openlog("writer", LOG_PID, LOG_USER);

	if(argc != 3)
	{
		syslog(LOG_ERR, "Invalid number of arguments");
        	fprintf(stderr, "Usage: %s <writefile> <writestr>\n", argv[0]);
        	closelog();
        	return 1;
	}

	const char *filename = argv[1];
	const char *text = argv[2];

	// Log the requested write operation
        syslog(LOG_DEBUG, "Writing %s to %s", text, filename);

	FILE *fp = NULL;
	fp = fopen(filename, "w");
	if(fp == NULL)
	{
		syslog(LOG_ERR, "Failed to open %s: %s",filename, strerror(errno));
		closelog();
		return 1;
	}

	// Write the complete string
	if (fputs(text, fp) ==  EOF)
	{
		syslog(LOG_ERR, "Failed to write to %s: %s",filename, strerror(errno));
		closelog();
		return 1;
	}
	fclose(fp);
	closelog();
	return 0;


}
