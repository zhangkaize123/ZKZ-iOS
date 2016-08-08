
#include <stdio.h>
void convert(int a);
int count(int n);
int main(int argc, const char * argv[])
{
    int a;
    scanf("%d",&a);
    int n=count(a);//得到这个数的位数
    for(int i=n-1;i>0;i--)
    {
        int b=1;
        for(int j=1;j<=i;j++)
        {
            b*=10;
        }
        int cur=a/b;
        convert(cur);
        a=a-cur*b;
    }
    convert(a%10);
    return 0;
}
int count(int n)//统计一个数的位数
{
    int c=0;
    while (n=n/10)
    {
        c++;
    }
    return c+1;
}
void convert(int a)//显示一位数对应的汉字
{
    if(a==0)
    {
        printf("零\n");
    }
    else if(a==1)
    {
        printf("壹\n");
    }
    else if(a==2)
    {
        printf("贰\n");
    }
    else if(a==3)
    {
        printf("叁\n");
    }
    else if(a==4)
    {
        printf("肆\n");
    }
    else if(a==5)
    {
        printf("伍\n");
    }
    else if(a==6)
    {
        printf("陆\n");
    }
    else if(a==7)
    {
        printf("柒\n");
    }
    else if(a==8)
    {
        printf("捌\n");
    }
    else if(a==9)
    {
        printf("玖\n");
    }

}