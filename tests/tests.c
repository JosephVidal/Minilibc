/*
** EPITECH PROJECT, 2019
** tests
** File description:
** tests
*/

#include <stdio.h>
#include <string.h>

int tests(void)
{
    char str[10];

    memset(str, 0, 10);
    printf("%d\n", strlen("test"));
    puts(str);
    printf("%d\n", strcmp("toto", "toto"));
    printf("%d\n", strcmp("toto", "tutu"));
    printf("%s\n", strchr("toto", 'o'));
    

        return (0);
}

int main(void)
{
    tests();
    return (0);
}
