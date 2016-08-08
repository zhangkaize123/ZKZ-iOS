
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
int main(int argc, const char * argv[]) {
    srandom((unsigned)time(NULL));//初始化随机函数
    for(int k=0;k<5;k++)
    {
        for(int j=0;j<5;j++)
        {
            for(int i=0;i<5;i++)
            {
                int a=random()%26;//0-25
                int c=random()%2;
                if(c==0)
                {
                    printf("%c",a+65);
                }
                else
                {
                    printf("%c",a+97);
                }
            }
            printf("\t");
        }
        printf("\n");
    }
    return 0;
}
