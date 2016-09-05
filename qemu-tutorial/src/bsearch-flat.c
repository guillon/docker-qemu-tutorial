/*
 * bsearch-flat.c
 *
 * Sources from: http://www.cs.utsa.edu/~wagner/CS3343/recursion/binsearch.html
 */

#include <stdio.h>
#include <stdlib.h>
#define LEN 29

#ifndef SELF_TEST
#define SELF_TEST 0
#endif

int binsearch(int len, int a[], int x) {
    int low = 0;
    int high = len - 1;
    while (low <= high) {
        int mid = (low + high) / 2;
        if (a[mid] == x) return mid;
        else if (a[mid] < x) low = mid + 1;
        else high = mid - 1;
    }
    return -1;
}


int a[] =
    { 2, 8,12,14,16,19,24,28,31,33,// 0-9
      39,40,45,49,51,53,54,56,57,60,// 10-19
      63,69,77,82,88,89,94,96,97};  // 20-28

int self_test(void)
{
    int i;
    for (i = 0; i < 29; i++)
        printf("%i ", binsearch(LEN, a, a[i]));
    printf("\n");
    printf("%i ", binsearch(LEN, a, 1));
    printf("%i ", binsearch(LEN, a, 17));
    printf("%i ", binsearch(LEN, a, 42));
    printf("%i ", binsearch(LEN, a, 99));
    printf("\n");
    return 0;
}

int main(int argc, char *argv[])
{
    int v, i;

    if (argc <= 1)
        return self_test();

    v = atoi(argv[1]);
    i = binsearch(LEN, a, v);
    printf("value %i at index %i\n", v, i);
    return 0;
}
