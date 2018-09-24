#include "__Lib_NetEthEnc28j60.h"
#include "__Lib_NetEthEnc28j60Private.h"
#include "html.h"

// mE ehternet NIC pinout
sbit Eth1_Link at RB5_bit;
sbit Net_Ethernet_28j60_Rst at LATA5_bit;
sbit Net_Ethernet_28j60_CS  at LATA4_bit;
sbit Eth1_Link_Direction at TRISB5_bit;
sbit Net_Ethernet_28j60_Rst_Direction at TRISA5_bit;
sbit Net_Ethernet_28j60_CS_Direction  at TRISA4_bit;
// end ethernet NIC definitions

/************************************************************
 * ROM constant strings
 */
const code unsigned char httpHeader[] = "HTTP/1.1 200 OK\nContent-Length: 1417\nConnection: close\nContent-type: ";  // HTTP header
const code unsigned char httpMimeTypeHTML[] = "text/html\n\n";              // HTML MIME type
const unsigned char httpMimeTypeScript[] = "text/plain\n\n" ;           // TEXT MIME type
const const code unsigned char httpImage[] = "HTTP/1.1 200 OK\nConnection: keep-alive\nContent-type:image/jpg\n\n";      // Image  type
unsigned char httpGetMethod[] = "GET /";
unsigned char httpGetImage[] = "GET /p1";
unsigned char httpGetRequ[] = "GET / HTTP/1.1";
unsigned char httpPostMethod[] = "POST /";
unsigned char httpPostRequ[] = "POST / HTTP/1.1";

char username[15] = "admin";
char usercheck[15] ="" ;
char password[9] = "12345678";
char passcheck[9] = "";
unsigned int pos[10];
char i;
//unsigned long   httpCounter = 0 ;                                       // counter of HTTP requests
////////////////html change vars/////////////////////

int ij, ik;
int index_br = 0;
char buff_slanje;
char promena1[] = " Times New Roman";
int pg_size = 0 ;
int login_size = 1371;
int p1_size = 9156;
int timePage_size = 1860;
int ntpPage_size =1156;
char sendHTML_mark = 0, sendTimeMark = 0, sendLoginMark = 0, sendNTPMark = 0, sendIMG_mark = 0;
char admin = 0;
int session = 0;
char end_petlja = 0;
char prolaz = 0;
///////////////html change vars//////////////////////

/***********************************
 * RAM variables
 */
unsigned char   myMacAddr[6] = {0x00, 0x14, 0xA5, 0x76, 0x19, 0x3b};   // my MAC address
unsigned char   myIpAddr[4]  = {192, 168,  1, 222 };                   // my IP address
unsigned char   gwIpAddr[4]  = {192, 168,  1,  1 };                   // gateway (router) IP address
unsigned char   ipMask[4]    = {255, 255, 255,  0 };                   // network mask (for example : 255.255.255.0)
unsigned char   dnsIpAddr[4] = {192, 168,  1,  1 };                   // DNS server IP address

unsigned char   htmlRequest[602];                                        // HTTP request buffer
unsigned char   dyna[31] ;                                             // buffer for dynamic response
//char txt[7];


/*******************************************
 * functions
 */

#define putConstString  Net_Ethernet_28j60_putConstStringTCP
#define putString  Net_Ethernet_28j60_putStringTCP

const char RESET = 0;
const char SET   = 1;

int my_strstr(int index, char *s1)
{
  int i, j, k;
  int flag = 0;

  //if ((s2 == 0 || s1 == 0)) return 0;

  for( i = index; login_code[i] != '\0'; i++)
  {
    if (login_code[i] == s1[0])
    {
      for (j = i; ; j++)
      {
        if (s1[j-i] == '\0'){ flag = 1;
        break;}
        if (login_code[j] == s1[j-i])
        continue;
        else
        break;
      }
    }
    if (flag == 1)
    break;
  }

   /*k=0;
   for ( i = j ; i < (j + strlen(s3)) ; i++) {
       html_code[i] = s3[k];
       k++;
   }*/
   return j;
}
int strstr1(int index,char *s2, char *s1)
{
  int i, j, k;
  int flag = 0;

  //if ((s2 == 0 || s1 == 0)) return 0;

  for( i = index; s2[i] != '\0'; i++)
  {
    if (s2[i] == s1[0])
    {
      for (j = i; ; j++)
      {
        if (s1[j-i] == '\0'){ flag = 1;
        break;}
        if (s2[j] == s1[j-i])
        continue;
        else
        break;
      }
    }
    if (flag == 1)
    break;
  }

   /*k=0;
   for ( i = j ; i < (j + strlen(s3)) ; i++) {
       html_code[i] = s3[k];
       k++;
   }*/
   return j;
}

void Html_Change(unsigned int pom_promena, SOCKET_28j60_Dsc *socketHTML, char *pro) {
   for (ik = index_br; ik < strlen(pro); ik++) {
      buff_slanje = pro[ik];
      pom_promena = pos[socketHTML->ID];
      pos[socketHTML->ID]++;
      if (Net_Ethernet_28j60_putByteTCP(buff_slanje, socketHTML) == 0) {
         pos[socketHTML->ID]--;
         index_br = ik;
         end_petlja = 1;
         return;
      }
   }
   index_br = 0;
   //return pom_promena;
}

void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
  unsigned int    len;                   // my reply length
  int    i;
  int res = 0;
  unsigned int prva_promena, druga_promena, treca_promena;

  // I listen only to web request on port 80
  if(socket->destPort != 80) {
    return;
  }
  for (i = 0; i < 10 ; i++) {
      htmlRequest[i] = Net_Ethernet_28j60_getByte();
  }
  
  if(memcmp(htmlRequest, httpGetImage, 6) == 0){
    sendIMG_mark = 1;
    prolaz = 2;
    //UART_Write_Text("Jeste Slika");
  } else
  // Check if it is get or post
  if(memcmp(htmlRequest, httpGetMethod, 5) == 0){
     if (admin == 0) {
     sendHTML_mark = 1;
     prolaz = 2;
     //UART_Write_Text("Jeste Get");
     }
     else  if ( (htmlRequest[5] == 't') && (admin == 1) ){
     sendNTPMark = 0;
     sendTimeMark = 1;
     prolaz = 2;
     //UART_Write_Text("Jeste TIME Get");
     }
     else  if ( (htmlRequest[5] == 'n') && (admin == 1) ){
     sendTimeMark = 0;
     sendNTPMark = 1;
     prolaz = 2;
     //UART_Write_Text("Jeste NTP Get");
     }
     else  if ( (htmlRequest[5] == 'l') && (admin == 1) ){
     sendHTML_mark = 1;
     session = 0;
     admin = 0;
     prolaz = 2;
     //UART_Write_Text("Jeste NTP Get");
     }
  }
  else if(memcmp(htmlRequest, httpPostMethod, 6) == 0) {
     //if (admin == 0) {
        prolaz = 0;
        sendLoginMark = 1;

    /*} else {
        sendNTPMark = 0;
        sendTimeMark = 1;
        prolaz = 2;
     }*/
     //UART_Write_Text("Jeste Post");
  }

  // POST and GET method are supported here
  if( ((memcmp(htmlRequest, httpGetMethod, 5) && (socket->state != 3))) || ( memcmp(htmlRequest, httpPostMethod, 6) &&( socket->state != 3) )){
    return;
    }

  while( prolaz < 2 ){
       for (len = (MY_MSS_28j60 * prolaz); len < (MY_MSS_28j60 * (prolaz + 1)); len++){
       htmlRequest[len] = Net_Ethernet_28j60_getByte();
       }
       prolaz++;
       break;
   }

  if (prolaz == 2) {
  
    if (sendLoginMark == 1) {

          res = 0;
          res = strstr1(res, htmlRequest,"usr");

          for ( i = 0 ; i < 15 ; i++){
               if (htmlRequest[(res + 1) + i] == '&')
               break;
               else
               usercheck[i] = htmlRequest[i+(res + 1)];

          }
          res = strstr1(res, htmlRequest,"psw");
          
          for ( i = 0 ; i < 8 ; i++){
               passcheck[i] =  htmlRequest[i+(res + 1)];
          }
          sendLoginMark = 0;
          if ( ((strcmp(usercheck,username) == 0) && (strcmp(passcheck,password) == 0))||(admin == SET) ) {
               admin = SET;
               sendTimeMark = 1;

          } else {
               admin = 0;
               sendHTML_mark = 1;
               for (i = 0; i < 15 ; i++)
               usercheck[i] = 0;
               for (i = 0; i < 8; i++)
               passcheck[i] = 0;

          }

     }
     
     if (sendTimeMark == 1){
        while(pos[socket->ID] < timePage_size) {
            if(Net_Ethernet_28j60_putByteTCP(time_code[pos[socket->ID]++], socket) == 0) {
               pos[socket->ID]--;
               break;
            }
         }
         if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= timePage_size) ) {
             Net_Ethernet_28j60_disconnectTCP(socket);
             socket_28j60[socket->ID].state = 0;
             pos[socket->ID] = 0;
             sendTimeMark = 0;
             prolaz = 0;
          }

     }
     if (sendNTPMark == 1){
        while(pos[socket->ID] < ntpPage_size) {
            if(Net_Ethernet_28j60_putByteTCP(ntp_code[pos[socket->ID]++], socket) == 0) {
               pos[socket->ID]--;
               break;
            }
         }
         if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= ntpPage_size) ) {
             Net_Ethernet_28j60_disconnectTCP(socket);
             socket_28j60[socket->ID].state = 0;
             pos[socket->ID] = 0;
             sendNTPMark = 0;
             prolaz = 0;
          }

     }

    if (sendHTML_mark == 1)  {

     /*while (pos[socket->ID] < login_size) {
         // zamena
        if ( (pos[socket->ID] == prva_promena) || (end_petlja == 1) ) {
          if (end_petlja == 1) end_petlja = 0;
          Html_Change(prva_promena, socket, promena1);
          if (end_petlja == 1) break;
        }

        else {
          buff_slanje = login_code[pos[socket->ID]++];
          if (Net_Ethernet_28j60_putByteTCP(buff_slanje, socket) == 0) {
             pos[socket->ID]--;
             break;
          }
        }
      }*/
         while(pos[socket->ID] < login_size) {
            if(Net_Ethernet_28j60_putByteTCP(login_code[pos[socket->ID]++], socket) == 0) {
               pos[socket->ID]--;
               break;
            }
         }
         if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= login_size) ) {
             Net_Ethernet_28j60_disconnectTCP(socket);
             socket_28j60[socket->ID].state = 0;
             pos[socket->ID] = 0;
             sendHTML_mark = 0;
             prolaz = 0;
          }

      }
    
      if (sendIMG_mark == 1) {
      
       if (pos[socket->ID] == 0) {
        Net_Ethernet_28j60_putConstStringTCP(httpImage, socket);
       }
       while(pos[socket->ID] < p1_size){
           if(Net_Ethernet_28j60_putByteTCP(p1[pos[socket->ID]++], socket) == 0) {
              pos[socket->ID]--;
              break;
           }
        }
        if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= p1_size) ) {
             Net_Ethernet_28j60_disconnectTCP(socket);
             socket_28j60[socket->ID].state = 0;
             pos[socket->ID] = 0;
             sendIMG_mark = 0;
             prolaz = 0;
        }

     }


  }

}

unsigned int    Net_Ethernet_28j60_UserUDP(UDP_28j60_Dsc *udpDsc) {

  unsigned int    len;                           // my reply length

  // reply is made of the remote host IP address in human readable format
  ByteToStr(udpDsc->remoteIP[0], dyna);                // first IP address byte
  dyna[3] = '.';
  ByteToStr(udpDsc->remoteIP[1], dyna + 4);            // second
  dyna[7] = '.';
  ByteToStr(udpDsc->remoteIP[2], dyna + 8);            // third
  dyna[11] = '.';
  ByteToStr(udpDsc->remoteIP[3], dyna + 12);           // fourth

  dyna[15] = ':';                                // add separator

  // then remote host port number
  WordToStr(udpDsc->remotePort, dyna + 16);
  dyna[21] = '[';
  WordToStr(udpDsc->destPort, dyna + 22);
  dyna[27] = ']';
  dyna[28] = 0;

  // the total length of the request is the length of the dynamic string plus the text of the request
  len = 28 + udpDsc->dataLength;

  // puts the dynamic string into the transmit buffer
  Net_Ethernet_28j60_putBytes(dyna, 28);

  // then puts the request string converted into upper char into the transmit buffer

  while(udpDsc->dataLength--)
          {
          Net_Ethernet_28j60_putByte(toupper(Net_Ethernet_28j60_getByte()));
          }
  return(len);
}

// Initialization of Timer1
unsigned int cnt;
void MCUInit() {
  cnt = 0;             // Initialize cnt
  TRISB = 0;           // PORTB is output
  PORTB = 0xFF;        // Initialize PORTB

  T0CON         = 0x88;
  TMR0H         = 0x63;
  TMR0L         = 0xC0;
  INTCON = 0xC0;       // Set GIE, PEIE
  TMR0IE_bit = 1;      // Enable TMRO interrupt
}

// Interrupt routine
void interrupt() {
  if (TMR0IF_bit) {
    cnt++;
                // Increment value of cnt on every interrupt
    if (cnt >= 200) {
      cnt = 0;         // Reset cnt
      Net_Ethernet_28j60_UserTimerSec++;
      if (admin == SET){
      session++; 
      }
    }

    if (session == 120){
    admin = RESET;
    session = 0;
    sendHTML_mark = 1;
    }
    TMR0H         = 0x63;
    TMR0L         = 0xC0;
    TMR0IF_bit = 0;    // clear TMR0IF
  }
}

/*
 * main entry
 */
void    main() {
  MCUInit();
  ANSEL = 0x0C;           // AN2 and AN3 convertors will be used
  C1ON_bit = 0;           // Disable comparators
  C2ON_bit = 0;
  PORTA = 0 ;
  TRISA = 0xff ;          // set PORTA as input for ADC
  ANSELH = 0x0C;
  PORTD = 0 ;
  TRISD = 0 ;             // set PORTD as output
  SLRCON = 0;
  PORTB = 0;
  TRISB = 0xFF;           // set PORTB as input for buttons

  PORTD = 0 ;
  TRISD = 0 ;             // set PORTD as output
  SLRCON = 0;
  admin = 0;

  Net_Ethernet_28j60_stackInitTCP();
  SPI1_Init();
  SPI_Rd_Ptr = SPI1_Read;
  Net_Ethernet_28j60_Init(myMacAddr, myIpAddr, Net_Ethernet_28j60_FULLDUPLEX)  ;
  Net_Ethernet_28j60_confNetwork(ipMask, gwIpAddr, dnsIpAddr);

  UART1_Init(9600);
  Delay_ms(100);

  while(1) {

    Net_Ethernet_28j60_doPacket() ;   // process incoming Ethernet packets
    for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
     if(socket_28j60[i].open == 0)
       pos[i] = 0;
    }

  }
}