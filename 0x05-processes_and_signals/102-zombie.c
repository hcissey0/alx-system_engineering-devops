#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infinite_loop - this goes into an infinite loop
 *
 * Return: void
 */
void infinite_loop(void)
{
	for(;;)
		sleep(1);
}

/**
 * main - entry point
 *
 * Return: 0
 */
int main(void)
{
	pid_t pid;
	int i = 0;

	while (i < 5)
	{
		pid = fork();
		if (pid > 0)
			printf("Zombie process created, PID: %d\n", pid);
		else
			exit(0);
	}

	infinite_loop();
	return (0);
}
