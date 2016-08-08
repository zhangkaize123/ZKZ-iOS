//
//  main.c
//  服务器
//
//  Created by wyzc on 15-3-20.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#include <stdio.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <string.h>
int main (int argc, const char * argv[])
{
    //套接字地址信息的结构 为我们的套接字提供ip和端口
    struct sockaddr_in server_addr;
    server_addr.sin_len = sizeof(struct sockaddr_in);//大小
    server_addr.sin_family = AF_INET;//地址族
    server_addr.sin_port = htons(90000);//端口
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");//地址
    bzero(&(server_addr.sin_zero),8);//清零
    //创建一个服务器端的套接字
    int server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == -1)//返回值是－1套接字创建失败
    {
        perror("socket error");
        return 1;
    }
    //绑定套接字到本机
    int bind_result = bind(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr));
    if (bind_result == -1)//绑定失败
    {
        perror("bind error");
        return 1;
    }
    //开始监听
    if (listen(server_socket, 5) == -1)//监听失败
    {
        perror("listen error");
        return 1;
    }
    //客户端的地址信息的结构
    struct sockaddr_in client_address;
    socklen_t address_len;//长度
    //承认连接
    int client_socket = accept(server_socket, (struct sockaddr *)&client_address, &address_len);//和客户端连接的套接字
    if (client_socket == -1)//连接失败
    {
        perror("accept error");
        return -1;
    }
    char recv_msg[1024];//接收缓冲区
    char reply_msg[1024];//回复缓冲区
    while (1) {
        bzero(recv_msg, 1024);//清零
        bzero(reply_msg, 1024);//清零
        printf("reply:");
        scanf("%s",reply_msg);//从键盘上得到要回复的内容
        send(client_socket, reply_msg, 1024, 0);//给客户端发信息
        long byte_num = recv(client_socket,recv_msg,1024,0);//接收客户端的信息
        recv_msg[byte_num] = '\0';
        printf("client said:%s\n",recv_msg);//显示信息
    }
    return 0;
}

