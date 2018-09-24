
_my_strstr:

;HTTP_Demo.c,76 :: 		int my_strstr(int index, char *s1)
;HTTP_Demo.c,79 :: 		int flag = 0;
	CLRF        my_strstr_flag_L0+0 
	CLRF        my_strstr_flag_L0+1 
;HTTP_Demo.c,83 :: 		for( i = index; login_code[i] != '\0'; i++)
	MOVF        FARG_my_strstr_index+0, 0 
	MOVWF       R3 
	MOVF        FARG_my_strstr_index+1, 0 
	MOVWF       R4 
L_my_strstr0:
	MOVLW       _login_code+0
	ADDWF       R3, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_login_code+0)
	ADDWFC      R4, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_login_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R4, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        R1, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_my_strstr1
;HTTP_Demo.c,85 :: 		if (login_code[i] == s1[0])
	MOVLW       _login_code+0
	ADDWF       R3, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_login_code+0)
	ADDWFC      R4, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_login_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R4, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVFF       FARG_my_strstr_s1+0, FSR2
	MOVFF       FARG_my_strstr_s1+1, FSR2H
	MOVF        R1, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr3
;HTTP_Demo.c,87 :: 		for (j = i; ; j++)
	MOVF        R3, 0 
	MOVWF       R5 
	MOVF        R4, 0 
	MOVWF       R6 
L_my_strstr4:
;HTTP_Demo.c,89 :: 		if (s1[j-i] == '\0'){ flag = 1;
	MOVF        R3, 0 
	SUBWF       R5, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	SUBWFB      R6, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_my_strstr_s1+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_my_strstr_s1+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr7
	MOVLW       1
	MOVWF       my_strstr_flag_L0+0 
	MOVLW       0
	MOVWF       my_strstr_flag_L0+1 
;HTTP_Demo.c,90 :: 		break;}
	GOTO        L_my_strstr5
L_my_strstr7:
;HTTP_Demo.c,91 :: 		if (login_code[j] == s1[j-i])
	MOVLW       _login_code+0
	ADDWF       R5, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_login_code+0)
	ADDWFC      R6, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_login_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       R6, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R2
	MOVF        R3, 0 
	SUBWF       R5, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	SUBWFB      R6, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_my_strstr_s1+0, 0 
	MOVWF       FSR2 
	MOVF        R1, 0 
	ADDWFC      FARG_my_strstr_s1+1, 0 
	MOVWF       FSR2H 
	MOVF        R2, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr8
;HTTP_Demo.c,92 :: 		continue;
	GOTO        L_my_strstr6
L_my_strstr8:
;HTTP_Demo.c,94 :: 		break;
	GOTO        L_my_strstr5
;HTTP_Demo.c,95 :: 		}
L_my_strstr6:
;HTTP_Demo.c,87 :: 		for (j = i; ; j++)
	INFSNZ      R5, 1 
	INCF        R6, 1 
;HTTP_Demo.c,95 :: 		}
	GOTO        L_my_strstr4
L_my_strstr5:
;HTTP_Demo.c,96 :: 		}
L_my_strstr3:
;HTTP_Demo.c,97 :: 		if (flag == 1)
	MOVLW       0
	XORWF       my_strstr_flag_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__my_strstr137
	MOVLW       1
	XORWF       my_strstr_flag_L0+0, 0 
L__my_strstr137:
	BTFSS       STATUS+0, 2 
	GOTO        L_my_strstr10
;HTTP_Demo.c,98 :: 		break;
	GOTO        L_my_strstr1
L_my_strstr10:
;HTTP_Demo.c,83 :: 		for( i = index; login_code[i] != '\0'; i++)
	INFSNZ      R3, 1 
	INCF        R4, 1 
;HTTP_Demo.c,99 :: 		}
	GOTO        L_my_strstr0
L_my_strstr1:
;HTTP_Demo.c,106 :: 		return j;
	MOVF        R5, 0 
	MOVWF       R0 
	MOVF        R6, 0 
	MOVWF       R1 
;HTTP_Demo.c,107 :: 		}
L_end_my_strstr:
	RETURN      0
; end of _my_strstr

_strstr1:

;HTTP_Demo.c,108 :: 		int strstr1(int index,char *s2, char *s1)
;HTTP_Demo.c,111 :: 		int flag = 0;
	CLRF        strstr1_flag_L0+0 
	CLRF        strstr1_flag_L0+1 
;HTTP_Demo.c,115 :: 		for( i = index; s2[i] != '\0'; i++)
	MOVF        FARG_strstr1_index+0, 0 
	MOVWF       R2 
	MOVF        FARG_strstr1_index+1, 0 
	MOVWF       R3 
L_strstr111:
	MOVF        R2, 0 
	ADDWF       FARG_strstr1_s2+0, 0 
	MOVWF       FSR0 
	MOVF        R3, 0 
	ADDWFC      FARG_strstr1_s2+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_strstr112
;HTTP_Demo.c,117 :: 		if (s2[i] == s1[0])
	MOVF        R2, 0 
	ADDWF       FARG_strstr1_s2+0, 0 
	MOVWF       FSR0 
	MOVF        R3, 0 
	ADDWFC      FARG_strstr1_s2+1, 0 
	MOVWF       FSR0H 
	MOVFF       FARG_strstr1_s1+0, FSR2
	MOVFF       FARG_strstr1_s1+1, FSR2H
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_strstr114
;HTTP_Demo.c,119 :: 		for (j = i; ; j++)
	MOVF        R2, 0 
	MOVWF       R4 
	MOVF        R3, 0 
	MOVWF       R5 
L_strstr115:
;HTTP_Demo.c,121 :: 		if (s1[j-i] == '\0'){ flag = 1;
	MOVF        R2, 0 
	SUBWF       R4, 0 
	MOVWF       R0 
	MOVF        R3, 0 
	SUBWFB      R5, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_strstr1_s1+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_strstr1_s1+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_strstr118
	MOVLW       1
	MOVWF       strstr1_flag_L0+0 
	MOVLW       0
	MOVWF       strstr1_flag_L0+1 
;HTTP_Demo.c,122 :: 		break;}
	GOTO        L_strstr116
L_strstr118:
;HTTP_Demo.c,123 :: 		if (s2[j] == s1[j-i])
	MOVF        R4, 0 
	ADDWF       FARG_strstr1_s2+0, 0 
	MOVWF       FSR0 
	MOVF        R5, 0 
	ADDWFC      FARG_strstr1_s2+1, 0 
	MOVWF       FSR0H 
	MOVF        R2, 0 
	SUBWF       R4, 0 
	MOVWF       R0 
	MOVF        R3, 0 
	SUBWFB      R5, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_strstr1_s1+0, 0 
	MOVWF       FSR2 
	MOVF        R1, 0 
	ADDWFC      FARG_strstr1_s1+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_strstr119
;HTTP_Demo.c,124 :: 		continue;
	GOTO        L_strstr117
L_strstr119:
;HTTP_Demo.c,126 :: 		break;
	GOTO        L_strstr116
;HTTP_Demo.c,127 :: 		}
L_strstr117:
;HTTP_Demo.c,119 :: 		for (j = i; ; j++)
	INFSNZ      R4, 1 
	INCF        R5, 1 
;HTTP_Demo.c,127 :: 		}
	GOTO        L_strstr115
L_strstr116:
;HTTP_Demo.c,128 :: 		}
L_strstr114:
;HTTP_Demo.c,129 :: 		if (flag == 1)
	MOVLW       0
	XORWF       strstr1_flag_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__strstr1139
	MOVLW       1
	XORWF       strstr1_flag_L0+0, 0 
L__strstr1139:
	BTFSS       STATUS+0, 2 
	GOTO        L_strstr121
;HTTP_Demo.c,130 :: 		break;
	GOTO        L_strstr112
L_strstr121:
;HTTP_Demo.c,115 :: 		for( i = index; s2[i] != '\0'; i++)
	INFSNZ      R2, 1 
	INCF        R3, 1 
;HTTP_Demo.c,131 :: 		}
	GOTO        L_strstr111
L_strstr112:
;HTTP_Demo.c,138 :: 		return j;
	MOVF        R4, 0 
	MOVWF       R0 
	MOVF        R5, 0 
	MOVWF       R1 
;HTTP_Demo.c,139 :: 		}
L_end_strstr1:
	RETURN      0
; end of _strstr1

_Html_Change:

;HTTP_Demo.c,141 :: 		void Html_Change(unsigned int pom_promena, SOCKET_28j60_Dsc *socketHTML, char *pro) {
;HTTP_Demo.c,142 :: 		for (ik = index_br; ik < strlen(pro); ik++) {
	MOVF        _index_br+0, 0 
	MOVWF       _ik+0 
	MOVF        _index_br+1, 0 
	MOVWF       _ik+1 
L_Html_Change22:
	MOVF        FARG_Html_Change_pro+0, 0 
	MOVWF       FARG_strlen_s+0 
	MOVF        FARG_Html_Change_pro+1, 0 
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVLW       128
	XORWF       _ik+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Html_Change141
	MOVF        R0, 0 
	SUBWF       _ik+0, 0 
L__Html_Change141:
	BTFSC       STATUS+0, 0 
	GOTO        L_Html_Change23
;HTTP_Demo.c,143 :: 		buff_slanje = pro[ik];
	MOVF        _ik+0, 0 
	ADDWF       FARG_Html_Change_pro+0, 0 
	MOVWF       FSR0 
	MOVF        _ik+1, 0 
	ADDWFC      FARG_Html_Change_pro+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       _buff_slanje+0 
;HTTP_Demo.c,144 :: 		pom_promena = pos[socketHTML->ID];
	MOVLW       35
	ADDWF       FARG_Html_Change_socketHTML+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Html_Change_socketHTML+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Html_Change_pom_promena+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Html_Change_pom_promena+1 
;HTTP_Demo.c,145 :: 		pos[socketHTML->ID]++;
	MOVF        R2, 0 
	MOVWF       R0 
	MOVF        R3, 0 
	MOVWF       R1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,146 :: 		if (Net_Ethernet_28j60_putByteTCP(buff_slanje, socketHTML) == 0) {
	MOVF        _buff_slanje+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_ch+0 
	MOVF        FARG_Html_Change_socketHTML+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+0 
	MOVF        FARG_Html_Change_socketHTML+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putByteTCP+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Html_Change25
;HTTP_Demo.c,147 :: 		pos[socketHTML->ID]--;
	MOVLW       35
	ADDWF       FARG_Html_Change_socketHTML+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Html_Change_socketHTML+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       1
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,148 :: 		index_br = ik;
	MOVF        _ik+0, 0 
	MOVWF       _index_br+0 
	MOVF        _ik+1, 0 
	MOVWF       _index_br+1 
;HTTP_Demo.c,149 :: 		end_petlja = 1;
	MOVLW       1
	MOVWF       _end_petlja+0 
;HTTP_Demo.c,150 :: 		return;
	GOTO        L_end_Html_Change
;HTTP_Demo.c,151 :: 		}
L_Html_Change25:
;HTTP_Demo.c,142 :: 		for (ik = index_br; ik < strlen(pro); ik++) {
	INFSNZ      _ik+0, 1 
	INCF        _ik+1, 1 
;HTTP_Demo.c,152 :: 		}
	GOTO        L_Html_Change22
L_Html_Change23:
;HTTP_Demo.c,153 :: 		index_br = 0;
	CLRF        _index_br+0 
	CLRF        _index_br+1 
;HTTP_Demo.c,155 :: 		}
L_end_Html_Change:
	RETURN      0
; end of _Html_Change

_Net_Ethernet_28j60_UserTCP:

;HTTP_Demo.c,157 :: 		void Net_Ethernet_28j60_UserTCP(SOCKET_28j60_Dsc *socket) {
;HTTP_Demo.c,160 :: 		int res = 0;
	CLRF        Net_Ethernet_28j60_UserTCP_res_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_res_L0+1 
;HTTP_Demo.c,164 :: 		if(socket->destPort != 80) {
	MOVLW       12
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP143
	MOVLW       80
	XORWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP143:
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP26
;HTTP_Demo.c,165 :: 		return;
	GOTO        L_end_Net_Ethernet_28j60_UserTCP
;HTTP_Demo.c,166 :: 		}
L_Net_Ethernet_28j60_UserTCP26:
;HTTP_Demo.c,167 :: 		for (i = 0; i < 10 ; i++) {
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+1 
L_Net_Ethernet_28j60_UserTCP27:
	MOVLW       128
	XORWF       Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP144
	MOVLW       10
	SUBWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
L__Net_Ethernet_28j60_UserTCP144:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP28
;HTTP_Demo.c,168 :: 		htmlRequest[i] = Net_Ethernet_28j60_getByte();
	MOVLW       _htmlRequest+0
	ADDWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
	MOVWF       FLOC__Net_Ethernet_28j60_UserTCP+0 
	MOVLW       hi_addr(_htmlRequest+0)
	ADDWFC      Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       FLOC__Net_Ethernet_28j60_UserTCP+1 
	CALL        _Net_Ethernet_28j60_getByte+0, 0
	MOVFF       FLOC__Net_Ethernet_28j60_UserTCP+0, FSR1
	MOVFF       FLOC__Net_Ethernet_28j60_UserTCP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,167 :: 		for (i = 0; i < 10 ; i++) {
	INFSNZ      Net_Ethernet_28j60_UserTCP_i_L0+0, 1 
	INCF        Net_Ethernet_28j60_UserTCP_i_L0+1, 1 
;HTTP_Demo.c,169 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP27
L_Net_Ethernet_28j60_UserTCP28:
;HTTP_Demo.c,171 :: 		if(memcmp(htmlRequest, httpGetImage, 6) == 0){
	MOVLW       _htmlRequest+0
	MOVWF       FARG_memcmp_s1+0 
	MOVLW       hi_addr(_htmlRequest+0)
	MOVWF       FARG_memcmp_s1+1 
	MOVLW       _httpGetImage+0
	MOVWF       FARG_memcmp_s2+0 
	MOVLW       hi_addr(_httpGetImage+0)
	MOVWF       FARG_memcmp_s2+1 
	MOVLW       6
	MOVWF       FARG_memcmp_n+0 
	MOVLW       0
	MOVWF       FARG_memcmp_n+1 
	CALL        _memcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP145
	MOVLW       0
	XORWF       R0, 0 
L__Net_Ethernet_28j60_UserTCP145:
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP30
;HTTP_Demo.c,172 :: 		sendIMG_mark = 1;
	MOVLW       1
	MOVWF       _sendIMG_mark+0 
;HTTP_Demo.c,173 :: 		prolaz = 2;
	MOVLW       2
	MOVWF       _prolaz+0 
;HTTP_Demo.c,174 :: 		UART_Write_Text("Jeste Slika");
	MOVLW       ?lstr1_HTTP_Demo+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_HTTP_Demo+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;HTTP_Demo.c,175 :: 		} else
	GOTO        L_Net_Ethernet_28j60_UserTCP31
L_Net_Ethernet_28j60_UserTCP30:
;HTTP_Demo.c,177 :: 		if(memcmp(htmlRequest, httpGetMethod, 5) == 0){
	MOVLW       _htmlRequest+0
	MOVWF       FARG_memcmp_s1+0 
	MOVLW       hi_addr(_htmlRequest+0)
	MOVWF       FARG_memcmp_s1+1 
	MOVLW       _httpGetMethod+0
	MOVWF       FARG_memcmp_s2+0 
	MOVLW       hi_addr(_httpGetMethod+0)
	MOVWF       FARG_memcmp_s2+1 
	MOVLW       5
	MOVWF       FARG_memcmp_n+0 
	MOVLW       0
	MOVWF       FARG_memcmp_n+1 
	CALL        _memcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP146
	MOVLW       0
	XORWF       R0, 0 
L__Net_Ethernet_28j60_UserTCP146:
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP32
;HTTP_Demo.c,178 :: 		if (admin == 0) {
	MOVF        _admin+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP33
;HTTP_Demo.c,179 :: 		sendHTML_mark = 1;
	MOVLW       1
	MOVWF       _sendHTML_mark+0 
;HTTP_Demo.c,180 :: 		prolaz = 2;
	MOVLW       2
	MOVWF       _prolaz+0 
;HTTP_Demo.c,181 :: 		UART_Write_Text("Jeste Get");
	MOVLW       ?lstr2_HTTP_Demo+0
	MOVWF       FARG_UART_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_HTTP_Demo+0)
	MOVWF       FARG_UART_Write_Text_uart_text+1 
	CALL        _UART_Write_Text+0, 0
;HTTP_Demo.c,182 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP34
L_Net_Ethernet_28j60_UserTCP33:
;HTTP_Demo.c,183 :: 		else  if ( (htmlRequest[5] == 't') && (admin == 1) ){
	MOVF        _htmlRequest+5, 0 
	XORLW       116
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP37
	MOVF        _admin+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP37
L__Net_Ethernet_28j60_UserTCP135:
;HTTP_Demo.c,184 :: 		sendNTPMark = 0;
	CLRF        _sendNTPMark+0 
;HTTP_Demo.c,185 :: 		sendTimeMark = 1;
	MOVLW       1
	MOVWF       _sendTimeMark+0 
;HTTP_Demo.c,186 :: 		prolaz = 2;
	MOVLW       2
	MOVWF       _prolaz+0 
;HTTP_Demo.c,188 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP38
L_Net_Ethernet_28j60_UserTCP37:
;HTTP_Demo.c,189 :: 		else  if ( (htmlRequest[5] == 'n') && (admin == 1) ){
	MOVF        _htmlRequest+5, 0 
	XORLW       110
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP41
	MOVF        _admin+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP41
L__Net_Ethernet_28j60_UserTCP134:
;HTTP_Demo.c,190 :: 		sendTimeMark = 0;
	CLRF        _sendTimeMark+0 
;HTTP_Demo.c,191 :: 		sendNTPMark = 1;
	MOVLW       1
	MOVWF       _sendNTPMark+0 
;HTTP_Demo.c,192 :: 		prolaz = 2;
	MOVLW       2
	MOVWF       _prolaz+0 
;HTTP_Demo.c,194 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP42
L_Net_Ethernet_28j60_UserTCP41:
;HTTP_Demo.c,195 :: 		else  if ( (htmlRequest[5] == 'l') && (admin == 1) ){
	MOVF        _htmlRequest+5, 0 
	XORLW       108
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP45
	MOVF        _admin+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP45
L__Net_Ethernet_28j60_UserTCP133:
;HTTP_Demo.c,196 :: 		sendHTML_mark = 1;
	MOVLW       1
	MOVWF       _sendHTML_mark+0 
;HTTP_Demo.c,197 :: 		session = 0;
	CLRF        _session+0 
	CLRF        _session+1 
;HTTP_Demo.c,198 :: 		admin = 0;
	CLRF        _admin+0 
;HTTP_Demo.c,199 :: 		prolaz = 2;
	MOVLW       2
	MOVWF       _prolaz+0 
;HTTP_Demo.c,201 :: 		}
L_Net_Ethernet_28j60_UserTCP45:
L_Net_Ethernet_28j60_UserTCP42:
L_Net_Ethernet_28j60_UserTCP38:
L_Net_Ethernet_28j60_UserTCP34:
;HTTP_Demo.c,202 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP46
L_Net_Ethernet_28j60_UserTCP32:
;HTTP_Demo.c,203 :: 		else if(memcmp(htmlRequest, httpPostMethod, 6) == 0) {
	MOVLW       _htmlRequest+0
	MOVWF       FARG_memcmp_s1+0 
	MOVLW       hi_addr(_htmlRequest+0)
	MOVWF       FARG_memcmp_s1+1 
	MOVLW       _httpPostMethod+0
	MOVWF       FARG_memcmp_s2+0 
	MOVLW       hi_addr(_httpPostMethod+0)
	MOVWF       FARG_memcmp_s2+1 
	MOVLW       6
	MOVWF       FARG_memcmp_n+0 
	MOVLW       0
	MOVWF       FARG_memcmp_n+1 
	CALL        _memcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP147
	MOVLW       0
	XORWF       R0, 0 
L__Net_Ethernet_28j60_UserTCP147:
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP47
;HTTP_Demo.c,205 :: 		prolaz = 0;
	CLRF        _prolaz+0 
;HTTP_Demo.c,206 :: 		sendLoginMark = 1;
	MOVLW       1
	MOVWF       _sendLoginMark+0 
;HTTP_Demo.c,214 :: 		}
L_Net_Ethernet_28j60_UserTCP47:
L_Net_Ethernet_28j60_UserTCP46:
L_Net_Ethernet_28j60_UserTCP31:
;HTTP_Demo.c,217 :: 		if( ((memcmp(htmlRequest, httpGetMethod, 5) && (socket->state != 3))) || ( memcmp(htmlRequest, httpPostMethod, 6) &&( socket->state != 3) )){
	MOVLW       _htmlRequest+0
	MOVWF       FARG_memcmp_s1+0 
	MOVLW       hi_addr(_htmlRequest+0)
	MOVWF       FARG_memcmp_s1+1 
	MOVLW       _httpGetMethod+0
	MOVWF       FARG_memcmp_s2+0 
	MOVLW       hi_addr(_httpGetMethod+0)
	MOVWF       FARG_memcmp_s2+1 
	MOVLW       5
	MOVWF       FARG_memcmp_n+0 
	MOVLW       0
	MOVWF       FARG_memcmp_n+1 
	CALL        _memcmp+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP132
	MOVLW       37
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP132
	GOTO        L__Net_Ethernet_28j60_UserTCP130
L__Net_Ethernet_28j60_UserTCP132:
	MOVLW       _htmlRequest+0
	MOVWF       FARG_memcmp_s1+0 
	MOVLW       hi_addr(_htmlRequest+0)
	MOVWF       FARG_memcmp_s1+1 
	MOVLW       _httpPostMethod+0
	MOVWF       FARG_memcmp_s2+0 
	MOVLW       hi_addr(_httpPostMethod+0)
	MOVWF       FARG_memcmp_s2+1 
	MOVLW       6
	MOVWF       FARG_memcmp_n+0 
	MOVLW       0
	MOVWF       FARG_memcmp_n+1 
	CALL        _memcmp+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP131
	MOVLW       37
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP131
	GOTO        L__Net_Ethernet_28j60_UserTCP130
L__Net_Ethernet_28j60_UserTCP131:
	GOTO        L_Net_Ethernet_28j60_UserTCP54
L__Net_Ethernet_28j60_UserTCP130:
;HTTP_Demo.c,218 :: 		return;
	GOTO        L_end_Net_Ethernet_28j60_UserTCP
;HTTP_Demo.c,219 :: 		}
L_Net_Ethernet_28j60_UserTCP54:
;HTTP_Demo.c,221 :: 		while( prolaz < 2 ){
	MOVLW       2
	SUBWF       _prolaz+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP56
;HTTP_Demo.c,222 :: 		for (len = (MY_MSS_28j60 * prolaz); len < (MY_MSS_28j60 * (prolaz + 1)); len++){
	MOVLW       _MY_MSS_28j60
	MOVWF       R0 
	MOVLW       _MY_MSS_28j60+1
	MOVWF       R1 
	MOVF        _prolaz+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_len_L0+0 
	MOVF        R1, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_len_L0+1 
L_Net_Ethernet_28j60_UserTCP57:
	MOVF        _prolaz+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       _MY_MSS_28j60
	MOVWF       R4 
	MOVLW       _MY_MSS_28j60+1
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R1, 0 
	SUBWF       Net_Ethernet_28j60_UserTCP_len_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP148
	MOVF        R0, 0 
	SUBWF       Net_Ethernet_28j60_UserTCP_len_L0+0, 0 
L__Net_Ethernet_28j60_UserTCP148:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP58
;HTTP_Demo.c,223 :: 		htmlRequest[len] = Net_Ethernet_28j60_getByte();
	MOVLW       _htmlRequest+0
	ADDWF       Net_Ethernet_28j60_UserTCP_len_L0+0, 0 
	MOVWF       FLOC__Net_Ethernet_28j60_UserTCP+0 
	MOVLW       hi_addr(_htmlRequest+0)
	ADDWFC      Net_Ethernet_28j60_UserTCP_len_L0+1, 0 
	MOVWF       FLOC__Net_Ethernet_28j60_UserTCP+1 
	CALL        _Net_Ethernet_28j60_getByte+0, 0
	MOVFF       FLOC__Net_Ethernet_28j60_UserTCP+0, FSR1
	MOVFF       FLOC__Net_Ethernet_28j60_UserTCP+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,222 :: 		for (len = (MY_MSS_28j60 * prolaz); len < (MY_MSS_28j60 * (prolaz + 1)); len++){
	INFSNZ      Net_Ethernet_28j60_UserTCP_len_L0+0, 1 
	INCF        Net_Ethernet_28j60_UserTCP_len_L0+1, 1 
;HTTP_Demo.c,224 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP57
L_Net_Ethernet_28j60_UserTCP58:
;HTTP_Demo.c,225 :: 		prolaz++;
	INCF        _prolaz+0, 1 
;HTTP_Demo.c,227 :: 		}
L_Net_Ethernet_28j60_UserTCP56:
;HTTP_Demo.c,229 :: 		if (prolaz == 2) {
	MOVF        _prolaz+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP60
;HTTP_Demo.c,231 :: 		if (sendLoginMark == 1) {
	MOVF        _sendLoginMark+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP61
;HTTP_Demo.c,233 :: 		res = 0;
	CLRF        Net_Ethernet_28j60_UserTCP_res_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_res_L0+1 
;HTTP_Demo.c,234 :: 		res = strstr1(res, htmlRequest,"usr");
	CLRF        FARG_strstr1_index+0 
	CLRF        FARG_strstr1_index+1 
	MOVLW       _htmlRequest+0
	MOVWF       FARG_strstr1_s2+0 
	MOVLW       hi_addr(_htmlRequest+0)
	MOVWF       FARG_strstr1_s2+1 
	MOVLW       ?lstr3_HTTP_Demo+0
	MOVWF       FARG_strstr1_s1+0 
	MOVLW       hi_addr(?lstr3_HTTP_Demo+0)
	MOVWF       FARG_strstr1_s1+1 
	CALL        _strstr1+0, 0
	MOVF        R0, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_res_L0+0 
	MOVF        R1, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_res_L0+1 
;HTTP_Demo.c,236 :: 		for ( i = 0 ; i < 15 ; i++){
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+1 
L_Net_Ethernet_28j60_UserTCP62:
	MOVLW       128
	XORWF       Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP149
	MOVLW       15
	SUBWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
L__Net_Ethernet_28j60_UserTCP149:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP63
;HTTP_Demo.c,237 :: 		if (htmlRequest[(res + 1) + i] == '&')
	MOVLW       1
	ADDWF       Net_Ethernet_28j60_UserTCP_res_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      Net_Ethernet_28j60_UserTCP_res_L0+1, 0 
	MOVWF       R1 
	MOVF        Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
	ADDWF       R0, 1 
	MOVF        Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	ADDWFC      R1, 1 
	MOVLW       _htmlRequest+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_htmlRequest+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       38
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP65
;HTTP_Demo.c,238 :: 		break;
	GOTO        L_Net_Ethernet_28j60_UserTCP63
L_Net_Ethernet_28j60_UserTCP65:
;HTTP_Demo.c,240 :: 		usercheck[i] = htmlRequest[i+(res + 1)];
	MOVLW       _usercheck+0
	ADDWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_usercheck+0)
	ADDWFC      Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       FSR1H 
	MOVLW       1
	ADDWF       Net_Ethernet_28j60_UserTCP_res_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      Net_Ethernet_28j60_UserTCP_res_L0+1, 0 
	MOVWF       R1 
	MOVF        Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
	ADDWF       R0, 1 
	MOVF        Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	ADDWFC      R1, 1 
	MOVLW       _htmlRequest+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_htmlRequest+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,236 :: 		for ( i = 0 ; i < 15 ; i++){
	INFSNZ      Net_Ethernet_28j60_UserTCP_i_L0+0, 1 
	INCF        Net_Ethernet_28j60_UserTCP_i_L0+1, 1 
;HTTP_Demo.c,242 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP62
L_Net_Ethernet_28j60_UserTCP63:
;HTTP_Demo.c,243 :: 		res = strstr1(res, htmlRequest,"psw");
	MOVF        Net_Ethernet_28j60_UserTCP_res_L0+0, 0 
	MOVWF       FARG_strstr1_index+0 
	MOVF        Net_Ethernet_28j60_UserTCP_res_L0+1, 0 
	MOVWF       FARG_strstr1_index+1 
	MOVLW       _htmlRequest+0
	MOVWF       FARG_strstr1_s2+0 
	MOVLW       hi_addr(_htmlRequest+0)
	MOVWF       FARG_strstr1_s2+1 
	MOVLW       ?lstr4_HTTP_Demo+0
	MOVWF       FARG_strstr1_s1+0 
	MOVLW       hi_addr(?lstr4_HTTP_Demo+0)
	MOVWF       FARG_strstr1_s1+1 
	CALL        _strstr1+0, 0
	MOVF        R0, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_res_L0+0 
	MOVF        R1, 0 
	MOVWF       Net_Ethernet_28j60_UserTCP_res_L0+1 
;HTTP_Demo.c,245 :: 		for ( i = 0 ; i < 8 ; i++){
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+1 
L_Net_Ethernet_28j60_UserTCP67:
	MOVLW       128
	XORWF       Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP150
	MOVLW       8
	SUBWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
L__Net_Ethernet_28j60_UserTCP150:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP68
;HTTP_Demo.c,246 :: 		passcheck[i] =  htmlRequest[i+(res + 1)];
	MOVLW       _passcheck+0
	ADDWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_passcheck+0)
	ADDWFC      Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       FSR1H 
	MOVLW       1
	ADDWF       Net_Ethernet_28j60_UserTCP_res_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      Net_Ethernet_28j60_UserTCP_res_L0+1, 0 
	MOVWF       R1 
	MOVF        Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
	ADDWF       R0, 1 
	MOVF        Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	ADDWFC      R1, 1 
	MOVLW       _htmlRequest+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_htmlRequest+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,245 :: 		for ( i = 0 ; i < 8 ; i++){
	INFSNZ      Net_Ethernet_28j60_UserTCP_i_L0+0, 1 
	INCF        Net_Ethernet_28j60_UserTCP_i_L0+1, 1 
;HTTP_Demo.c,247 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP67
L_Net_Ethernet_28j60_UserTCP68:
;HTTP_Demo.c,248 :: 		sendLoginMark = 0;
	CLRF        _sendLoginMark+0 
;HTTP_Demo.c,249 :: 		if ( ((strcmp(usercheck,username) == 0) && (strcmp(passcheck,password) == 0))||(admin == SET) ) {
	MOVLW       _usercheck+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_usercheck+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       _username+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(_username+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP151
	MOVLW       0
	XORWF       R0, 0 
L__Net_Ethernet_28j60_UserTCP151:
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP129
	MOVLW       _passcheck+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_passcheck+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       _password+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(_password+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP152
	MOVLW       0
	XORWF       R0, 0 
L__Net_Ethernet_28j60_UserTCP152:
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP129
	GOTO        L__Net_Ethernet_28j60_UserTCP128
L__Net_Ethernet_28j60_UserTCP129:
	MOVF        _admin+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP128
	GOTO        L_Net_Ethernet_28j60_UserTCP74
L__Net_Ethernet_28j60_UserTCP128:
;HTTP_Demo.c,250 :: 		admin = SET;
	MOVLW       1
	MOVWF       _admin+0 
;HTTP_Demo.c,251 :: 		sendTimeMark = 1;
	MOVLW       1
	MOVWF       _sendTimeMark+0 
;HTTP_Demo.c,253 :: 		} else {
	GOTO        L_Net_Ethernet_28j60_UserTCP75
L_Net_Ethernet_28j60_UserTCP74:
;HTTP_Demo.c,254 :: 		admin = 0;
	CLRF        _admin+0 
;HTTP_Demo.c,255 :: 		sendHTML_mark = 1;
	MOVLW       1
	MOVWF       _sendHTML_mark+0 
;HTTP_Demo.c,256 :: 		for (i = 0; i < 15 ; i++)
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+1 
L_Net_Ethernet_28j60_UserTCP76:
	MOVLW       128
	XORWF       Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP153
	MOVLW       15
	SUBWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
L__Net_Ethernet_28j60_UserTCP153:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP77
;HTTP_Demo.c,257 :: 		usercheck[i] = 0;
	MOVLW       _usercheck+0
	ADDWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_usercheck+0)
	ADDWFC      Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,256 :: 		for (i = 0; i < 15 ; i++)
	INFSNZ      Net_Ethernet_28j60_UserTCP_i_L0+0, 1 
	INCF        Net_Ethernet_28j60_UserTCP_i_L0+1, 1 
;HTTP_Demo.c,257 :: 		usercheck[i] = 0;
	GOTO        L_Net_Ethernet_28j60_UserTCP76
L_Net_Ethernet_28j60_UserTCP77:
;HTTP_Demo.c,258 :: 		for (i = 0; i < 8; i++)
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+0 
	CLRF        Net_Ethernet_28j60_UserTCP_i_L0+1 
L_Net_Ethernet_28j60_UserTCP79:
	MOVLW       128
	XORWF       Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP154
	MOVLW       8
	SUBWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
L__Net_Ethernet_28j60_UserTCP154:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP80
;HTTP_Demo.c,259 :: 		passcheck[i] = 0;
	MOVLW       _passcheck+0
	ADDWF       Net_Ethernet_28j60_UserTCP_i_L0+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_passcheck+0)
	ADDWFC      Net_Ethernet_28j60_UserTCP_i_L0+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,258 :: 		for (i = 0; i < 8; i++)
	INFSNZ      Net_Ethernet_28j60_UserTCP_i_L0+0, 1 
	INCF        Net_Ethernet_28j60_UserTCP_i_L0+1, 1 
;HTTP_Demo.c,259 :: 		passcheck[i] = 0;
	GOTO        L_Net_Ethernet_28j60_UserTCP79
L_Net_Ethernet_28j60_UserTCP80:
;HTTP_Demo.c,261 :: 		}
L_Net_Ethernet_28j60_UserTCP75:
;HTTP_Demo.c,263 :: 		}
L_Net_Ethernet_28j60_UserTCP61:
;HTTP_Demo.c,265 :: 		if (sendTimeMark == 1){
	MOVF        _sendTimeMark+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP82
;HTTP_Demo.c,266 :: 		while(pos[socket->ID] < timePage_size) {
L_Net_Ethernet_28j60_UserTCP83:
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _timePage_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP155
	MOVF        _timePage_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP155:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP84
;HTTP_Demo.c,267 :: 		if(Net_Ethernet_28j60_putByteTCP(time_code[pos[socket->ID]++], socket) == 0) {
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       1
	ADDWF       R2, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       R1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVLW       _time_code+0
	ADDWF       R2, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_time_code+0)
	ADDWFC      R3, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_time_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Net_Ethernet_28j60_putByteTCP_ch+0
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putByteTCP+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP85
;HTTP_Demo.c,268 :: 		pos[socket->ID]--;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       1
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,269 :: 		break;
	GOTO        L_Net_Ethernet_28j60_UserTCP84
;HTTP_Demo.c,270 :: 		}
L_Net_Ethernet_28j60_UserTCP85:
;HTTP_Demo.c,271 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP83
L_Net_Ethernet_28j60_UserTCP84:
;HTTP_Demo.c,272 :: 		if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= timePage_size) ) {
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_bufferEmptyTCP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP88
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _timePage_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP156
	MOVF        _timePage_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP156:
	BTFSS       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP88
L__Net_Ethernet_28j60_UserTCP127:
;HTTP_Demo.c,273 :: 		Net_Ethernet_28j60_disconnectTCP(socket);
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_disconnectTCP+0, 0
;HTTP_Demo.c,274 :: 		socket_28j60[socket->ID].state = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       51
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _socket_28j60+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_socket_28j60+0)
	ADDWFC      R1, 1 
	MOVLW       37
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,275 :: 		pos[socket->ID] = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,276 :: 		sendTimeMark = 0;
	CLRF        _sendTimeMark+0 
;HTTP_Demo.c,277 :: 		prolaz = 0;
	CLRF        _prolaz+0 
;HTTP_Demo.c,278 :: 		}
L_Net_Ethernet_28j60_UserTCP88:
;HTTP_Demo.c,280 :: 		}
L_Net_Ethernet_28j60_UserTCP82:
;HTTP_Demo.c,281 :: 		if (sendNTPMark == 1){
	MOVF        _sendNTPMark+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP89
;HTTP_Demo.c,282 :: 		while(pos[socket->ID] < ntpPage_size) {
L_Net_Ethernet_28j60_UserTCP90:
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _ntpPage_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP157
	MOVF        _ntpPage_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP157:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP91
;HTTP_Demo.c,283 :: 		if(Net_Ethernet_28j60_putByteTCP(ntp_code[pos[socket->ID]++], socket) == 0) {
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       1
	ADDWF       R2, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       R1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVLW       _ntp_code+0
	ADDWF       R2, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_ntp_code+0)
	ADDWFC      R3, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_ntp_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Net_Ethernet_28j60_putByteTCP_ch+0
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putByteTCP+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP92
;HTTP_Demo.c,284 :: 		pos[socket->ID]--;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       1
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,285 :: 		break;
	GOTO        L_Net_Ethernet_28j60_UserTCP91
;HTTP_Demo.c,286 :: 		}
L_Net_Ethernet_28j60_UserTCP92:
;HTTP_Demo.c,287 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP90
L_Net_Ethernet_28j60_UserTCP91:
;HTTP_Demo.c,288 :: 		if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= ntpPage_size) ) {
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_bufferEmptyTCP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP95
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _ntpPage_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP158
	MOVF        _ntpPage_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP158:
	BTFSS       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP95
L__Net_Ethernet_28j60_UserTCP126:
;HTTP_Demo.c,289 :: 		Net_Ethernet_28j60_disconnectTCP(socket);
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_disconnectTCP+0, 0
;HTTP_Demo.c,290 :: 		socket_28j60[socket->ID].state = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       51
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _socket_28j60+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_socket_28j60+0)
	ADDWFC      R1, 1 
	MOVLW       37
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,291 :: 		pos[socket->ID] = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,292 :: 		sendNTPMark = 0;
	CLRF        _sendNTPMark+0 
;HTTP_Demo.c,293 :: 		prolaz = 0;
	CLRF        _prolaz+0 
;HTTP_Demo.c,294 :: 		}
L_Net_Ethernet_28j60_UserTCP95:
;HTTP_Demo.c,296 :: 		}
L_Net_Ethernet_28j60_UserTCP89:
;HTTP_Demo.c,298 :: 		if (sendHTML_mark == 1)  {
	MOVF        _sendHTML_mark+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP96
;HTTP_Demo.c,316 :: 		while(pos[socket->ID] < login_size) {
L_Net_Ethernet_28j60_UserTCP97:
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _login_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP159
	MOVF        _login_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP159:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP98
;HTTP_Demo.c,317 :: 		if(Net_Ethernet_28j60_putByteTCP(login_code[pos[socket->ID]++], socket) == 0) {
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       1
	ADDWF       R2, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       R1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVLW       _login_code+0
	ADDWF       R2, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_login_code+0)
	ADDWFC      R3, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_login_code+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Net_Ethernet_28j60_putByteTCP_ch+0
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putByteTCP+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP99
;HTTP_Demo.c,318 :: 		pos[socket->ID]--;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       1
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,319 :: 		break;
	GOTO        L_Net_Ethernet_28j60_UserTCP98
;HTTP_Demo.c,320 :: 		}
L_Net_Ethernet_28j60_UserTCP99:
;HTTP_Demo.c,321 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP97
L_Net_Ethernet_28j60_UserTCP98:
;HTTP_Demo.c,322 :: 		if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= login_size) ) {
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_bufferEmptyTCP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP102
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _login_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP160
	MOVF        _login_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP160:
	BTFSS       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP102
L__Net_Ethernet_28j60_UserTCP125:
;HTTP_Demo.c,323 :: 		Net_Ethernet_28j60_disconnectTCP(socket);
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_disconnectTCP+0, 0
;HTTP_Demo.c,324 :: 		socket_28j60[socket->ID].state = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       51
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _socket_28j60+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_socket_28j60+0)
	ADDWFC      R1, 1 
	MOVLW       37
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,325 :: 		pos[socket->ID] = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,326 :: 		sendHTML_mark = 0;
	CLRF        _sendHTML_mark+0 
;HTTP_Demo.c,327 :: 		prolaz = 0;
	CLRF        _prolaz+0 
;HTTP_Demo.c,328 :: 		}
L_Net_Ethernet_28j60_UserTCP102:
;HTTP_Demo.c,330 :: 		}
L_Net_Ethernet_28j60_UserTCP96:
;HTTP_Demo.c,332 :: 		if (sendIMG_mark == 1) {
	MOVF        _sendIMG_mark+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP103
;HTTP_Demo.c,334 :: 		if (pos[socket->ID] == 0) {
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP161
	MOVLW       0
	XORWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP161:
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP104
;HTTP_Demo.c,335 :: 		Net_Ethernet_28j60_putConstStringTCP(httpImage, socket);
	MOVLW       _httpImage+0
	MOVWF       FARG_Net_Ethernet_28j60_putConstStringTCP_ptr+0 
	MOVLW       hi_addr(_httpImage+0)
	MOVWF       FARG_Net_Ethernet_28j60_putConstStringTCP_ptr+1 
	MOVLW       higher_addr(_httpImage+0)
	MOVWF       FARG_Net_Ethernet_28j60_putConstStringTCP_ptr+2 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putConstStringTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putConstStringTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putConstStringTCP+0, 0
;HTTP_Demo.c,336 :: 		}
L_Net_Ethernet_28j60_UserTCP104:
;HTTP_Demo.c,337 :: 		while(pos[socket->ID] < p1_size){
L_Net_Ethernet_28j60_UserTCP105:
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _p1_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP162
	MOVF        _p1_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP162:
	BTFSC       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP106
;HTTP_Demo.c,338 :: 		if(Net_Ethernet_28j60_putByteTCP(p1[pos[socket->ID]++], socket) == 0) {
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       1
	ADDWF       R2, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       R1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVLW       _p1+0
	ADDWF       R2, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_p1+0)
	ADDWFC      R3, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_p1+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Net_Ethernet_28j60_putByteTCP_ch+0
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByteTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_putByteTCP+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP107
;HTTP_Demo.c,339 :: 		pos[socket->ID]--;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       1
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;HTTP_Demo.c,340 :: 		break;
	GOTO        L_Net_Ethernet_28j60_UserTCP106
;HTTP_Demo.c,341 :: 		}
L_Net_Ethernet_28j60_UserTCP107:
;HTTP_Demo.c,342 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserTCP105
L_Net_Ethernet_28j60_UserTCP106:
;HTTP_Demo.c,343 :: 		if( Net_Ethernet_28j60_bufferEmptyTCP(socket) && (pos[socket->ID] >= p1_size) ) {
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_bufferEmptyTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_bufferEmptyTCP+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserTCP110
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        _p1_size+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Net_Ethernet_28j60_UserTCP163
	MOVF        _p1_size+0, 0 
	SUBWF       R1, 0 
L__Net_Ethernet_28j60_UserTCP163:
	BTFSS       STATUS+0, 0 
	GOTO        L_Net_Ethernet_28j60_UserTCP110
L__Net_Ethernet_28j60_UserTCP124:
;HTTP_Demo.c,344 :: 		Net_Ethernet_28j60_disconnectTCP(socket);
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+0 
	MOVF        FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FARG_Net_Ethernet_28j60_disconnectTCP_socket_28j60+1 
	CALL        _Net_Ethernet_28j60_disconnectTCP+0, 0
;HTTP_Demo.c,345 :: 		socket_28j60[socket->ID].state = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       51
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _socket_28j60+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_socket_28j60+0)
	ADDWFC      R1, 1 
	MOVLW       37
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,346 :: 		pos[socket->ID] = 0;
	MOVLW       35
	ADDWF       FARG_Net_Ethernet_28j60_UserTCP_socket+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserTCP_socket+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;HTTP_Demo.c,347 :: 		sendIMG_mark = 0;
	CLRF        _sendIMG_mark+0 
;HTTP_Demo.c,348 :: 		prolaz = 0;
	CLRF        _prolaz+0 
;HTTP_Demo.c,349 :: 		}
L_Net_Ethernet_28j60_UserTCP110:
;HTTP_Demo.c,351 :: 		}
L_Net_Ethernet_28j60_UserTCP103:
;HTTP_Demo.c,354 :: 		}
L_Net_Ethernet_28j60_UserTCP60:
;HTTP_Demo.c,356 :: 		}
L_end_Net_Ethernet_28j60_UserTCP:
	RETURN      0
; end of _Net_Ethernet_28j60_UserTCP

_Net_Ethernet_28j60_UserUDP:

;HTTP_Demo.c,358 :: 		unsigned int    Net_Ethernet_28j60_UserUDP(UDP_28j60_Dsc *udpDsc) {
;HTTP_Demo.c,363 :: 		ByteToStr(udpDsc->remoteIP[0], dyna);                // first IP address byte
	MOVFF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, FSR0
	MOVFF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,364 :: 		dyna[3] = '.';
	MOVLW       46
	MOVWF       _dyna+3 
;HTTP_Demo.c,365 :: 		ByteToStr(udpDsc->remoteIP[1], dyna + 4);            // second
	MOVLW       1
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+4
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+4)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,366 :: 		dyna[7] = '.';
	MOVLW       46
	MOVWF       _dyna+7 
;HTTP_Demo.c,367 :: 		ByteToStr(udpDsc->remoteIP[2], dyna + 8);            // third
	MOVLW       2
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+8
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+8)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,368 :: 		dyna[11] = '.';
	MOVLW       46
	MOVWF       _dyna+11 
;HTTP_Demo.c,369 :: 		ByteToStr(udpDsc->remoteIP[3], dyna + 12);           // fourth
	MOVLW       3
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _dyna+12
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_dyna+12)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;HTTP_Demo.c,371 :: 		dyna[15] = ':';                                // add separator
	MOVLW       58
	MOVWF       _dyna+15 
;HTTP_Demo.c,374 :: 		WordToStr(udpDsc->remotePort, dyna + 16);
	MOVLW       10
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+16
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+16)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.c,375 :: 		dyna[21] = '[';
	MOVLW       91
	MOVWF       _dyna+21 
;HTTP_Demo.c,376 :: 		WordToStr(udpDsc->destPort, dyna + 22);
	MOVLW       12
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _dyna+22
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_dyna+22)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;HTTP_Demo.c,377 :: 		dyna[27] = ']';
	MOVLW       93
	MOVWF       _dyna+27 
;HTTP_Demo.c,378 :: 		dyna[28] = 0;
	CLRF        _dyna+28 
;HTTP_Demo.c,381 :: 		len = 28 + udpDsc->dataLength;
	MOVLW       14
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       FSR2H 
	MOVLW       28
	ADDWF       POSTINC2+0, 0 
	MOVWF       Net_Ethernet_28j60_UserUDP_len_L0+0 
	MOVLW       0
	ADDWFC      POSTINC2+0, 0 
	MOVWF       Net_Ethernet_28j60_UserUDP_len_L0+1 
;HTTP_Demo.c,384 :: 		Net_Ethernet_28j60_putBytes(dyna, 28);
	MOVLW       _dyna+0
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_ptr+0 
	MOVLW       hi_addr(_dyna+0)
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_ptr+1 
	MOVLW       28
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_n+0 
	MOVLW       0
	MOVWF       FARG_Net_Ethernet_28j60_putBytes_n+1 
	CALL        _Net_Ethernet_28j60_putBytes+0, 0
;HTTP_Demo.c,388 :: 		while(udpDsc->dataLength--)
L_Net_Ethernet_28j60_UserUDP111:
	MOVLW       14
	ADDWF       FARG_Net_Ethernet_28j60_UserUDP_udpDsc+0, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      FARG_Net_Ethernet_28j60_UserUDP_udpDsc+1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       1
	SUBWF       R2, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      R3, 0 
	MOVWF       R1 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	IORWF       R3, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_Net_Ethernet_28j60_UserUDP112
;HTTP_Demo.c,390 :: 		Net_Ethernet_28j60_putByte(toupper(Net_Ethernet_28j60_getByte()));
	CALL        _Net_Ethernet_28j60_getByte+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_toupper_character+0 
	CALL        _toupper+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Net_Ethernet_28j60_putByte_v+0 
	CALL        _Net_Ethernet_28j60_putByte+0, 0
;HTTP_Demo.c,391 :: 		}
	GOTO        L_Net_Ethernet_28j60_UserUDP111
L_Net_Ethernet_28j60_UserUDP112:
;HTTP_Demo.c,392 :: 		return(len);
	MOVF        Net_Ethernet_28j60_UserUDP_len_L0+0, 0 
	MOVWF       R0 
	MOVF        Net_Ethernet_28j60_UserUDP_len_L0+1, 0 
	MOVWF       R1 
;HTTP_Demo.c,393 :: 		}
L_end_Net_Ethernet_28j60_UserUDP:
	RETURN      0
; end of _Net_Ethernet_28j60_UserUDP

_MCUInit:

;HTTP_Demo.c,397 :: 		void MCUInit() {
;HTTP_Demo.c,398 :: 		cnt = 0;             // Initialize cnt
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;HTTP_Demo.c,399 :: 		TRISB = 0;           // PORTB is output
	CLRF        TRISB+0 
;HTTP_Demo.c,400 :: 		PORTB = 0xFF;        // Initialize PORTB
	MOVLW       255
	MOVWF       PORTB+0 
;HTTP_Demo.c,402 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;HTTP_Demo.c,403 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;HTTP_Demo.c,404 :: 		TMR0L         = 0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;HTTP_Demo.c,405 :: 		INTCON = 0xC0;       // Set GIE, PEIE
	MOVLW       192
	MOVWF       INTCON+0 
;HTTP_Demo.c,406 :: 		TMR0IE_bit = 1;      // Enable TMRO interrupt
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;HTTP_Demo.c,407 :: 		}
L_end_MCUInit:
	RETURN      0
; end of _MCUInit

_interrupt:

;HTTP_Demo.c,410 :: 		void interrupt() {
;HTTP_Demo.c,411 :: 		if (TMR0IF_bit) {
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt113
;HTTP_Demo.c,412 :: 		cnt++;
	INFSNZ      _cnt+0, 1 
	INCF        _cnt+1, 1 
;HTTP_Demo.c,414 :: 		if (cnt >= 200) {
	MOVLW       0
	SUBWF       _cnt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt168
	MOVLW       200
	SUBWF       _cnt+0, 0 
L__interrupt168:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt114
;HTTP_Demo.c,415 :: 		cnt = 0;         // Reset cnt
	CLRF        _cnt+0 
	CLRF        _cnt+1 
;HTTP_Demo.c,416 :: 		Net_Ethernet_28j60_UserTimerSec++;
	MOVLW       1
	ADDWF       _Net_Ethernet_28j60_UserTimerSec+0, 1 
	MOVLW       0
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+1, 1 
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+2, 1 
	ADDWFC      _Net_Ethernet_28j60_UserTimerSec+3, 1 
;HTTP_Demo.c,417 :: 		if (admin == SET){
	MOVF        _admin+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt115
;HTTP_Demo.c,418 :: 		session++;
	INFSNZ      _session+0, 1 
	INCF        _session+1, 1 
;HTTP_Demo.c,419 :: 		}
L_interrupt115:
;HTTP_Demo.c,420 :: 		}
L_interrupt114:
;HTTP_Demo.c,422 :: 		if (session == 120){
	MOVLW       0
	XORWF       _session+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt169
	MOVLW       120
	XORWF       _session+0, 0 
L__interrupt169:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt116
;HTTP_Demo.c,423 :: 		admin = RESET;
	CLRF        _admin+0 
;HTTP_Demo.c,424 :: 		session = 0;
	CLRF        _session+0 
	CLRF        _session+1 
;HTTP_Demo.c,425 :: 		sendHTML_mark = 1;
	MOVLW       1
	MOVWF       _sendHTML_mark+0 
;HTTP_Demo.c,426 :: 		}
L_interrupt116:
;HTTP_Demo.c,427 :: 		TMR0H         = 0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;HTTP_Demo.c,428 :: 		TMR0L         = 0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;HTTP_Demo.c,429 :: 		TMR0IF_bit = 0;    // clear TMR0IF
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;HTTP_Demo.c,430 :: 		}
L_interrupt113:
;HTTP_Demo.c,431 :: 		}
L_end_interrupt:
L__interrupt167:
	RETFIE      1
; end of _interrupt

_main:

;HTTP_Demo.c,436 :: 		void    main() {
;HTTP_Demo.c,437 :: 		MCUInit();
	CALL        _MCUInit+0, 0
;HTTP_Demo.c,438 :: 		ANSEL = 0x0C;           // AN2 and AN3 convertors will be used
	MOVLW       12
	MOVWF       ANSEL+0 
;HTTP_Demo.c,439 :: 		C1ON_bit = 0;           // Disable comparators
	BCF         C1ON_bit+0, BitPos(C1ON_bit+0) 
;HTTP_Demo.c,440 :: 		C2ON_bit = 0;
	BCF         C2ON_bit+0, BitPos(C2ON_bit+0) 
;HTTP_Demo.c,441 :: 		PORTA = 0 ;
	CLRF        PORTA+0 
;HTTP_Demo.c,442 :: 		TRISA = 0xff ;          // set PORTA as input for ADC
	MOVLW       255
	MOVWF       TRISA+0 
;HTTP_Demo.c,443 :: 		ANSELH = 0x0C;
	MOVLW       12
	MOVWF       ANSELH+0 
;HTTP_Demo.c,444 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;HTTP_Demo.c,445 :: 		TRISD = 0 ;             // set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.c,446 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;HTTP_Demo.c,447 :: 		PORTB = 0;
	CLRF        PORTB+0 
;HTTP_Demo.c,448 :: 		TRISB = 0xFF;           // set PORTB as input for buttons
	MOVLW       255
	MOVWF       TRISB+0 
;HTTP_Demo.c,450 :: 		PORTD = 0 ;
	CLRF        PORTD+0 
;HTTP_Demo.c,451 :: 		TRISD = 0 ;             // set PORTD as output
	CLRF        TRISD+0 
;HTTP_Demo.c,452 :: 		SLRCON = 0;
	CLRF        SLRCON+0 
;HTTP_Demo.c,453 :: 		admin = 0;
	CLRF        _admin+0 
;HTTP_Demo.c,455 :: 		Net_Ethernet_28j60_stackInitTCP();
	CALL        _Net_Ethernet_28j60_stackInitTCP+0, 0
;HTTP_Demo.c,456 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;HTTP_Demo.c,457 :: 		SPI_Rd_Ptr = SPI1_Read;
	MOVLW       _SPI1_Read+0
	MOVWF       _SPI_Rd_Ptr+0 
	MOVLW       hi_addr(_SPI1_Read+0)
	MOVWF       _SPI_Rd_Ptr+1 
	MOVLW       FARG_SPI1_Read_buffer+0
	MOVWF       _SPI_Rd_Ptr+2 
	MOVLW       hi_addr(FARG_SPI1_Read_buffer+0)
	MOVWF       _SPI_Rd_Ptr+3 
;HTTP_Demo.c,458 :: 		Net_Ethernet_28j60_Init(myMacAddr, myIpAddr, Net_Ethernet_28j60_FULLDUPLEX)  ;
	MOVLW       _myMacAddr+0
	MOVWF       FARG_Net_Ethernet_28j60_Init_mac+0 
	MOVLW       hi_addr(_myMacAddr+0)
	MOVWF       FARG_Net_Ethernet_28j60_Init_mac+1 
	MOVLW       _myIpAddr+0
	MOVWF       FARG_Net_Ethernet_28j60_Init_ip+0 
	MOVLW       hi_addr(_myIpAddr+0)
	MOVWF       FARG_Net_Ethernet_28j60_Init_ip+1 
	MOVLW       1
	MOVWF       FARG_Net_Ethernet_28j60_Init_fullDuplex+0 
	CALL        _Net_Ethernet_28j60_Init+0, 0
;HTTP_Demo.c,459 :: 		Net_Ethernet_28j60_confNetwork(ipMask, gwIpAddr, dnsIpAddr);
	MOVLW       _ipMask+0
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_ipMask+0 
	MOVLW       hi_addr(_ipMask+0)
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_ipMask+1 
	MOVLW       _gwIpAddr+0
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_gwIpAddr+0 
	MOVLW       hi_addr(_gwIpAddr+0)
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_gwIpAddr+1 
	MOVLW       _dnsIpAddr+0
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_dnsIpAddr+0 
	MOVLW       hi_addr(_dnsIpAddr+0)
	MOVWF       FARG_Net_Ethernet_28j60_confNetwork_dnsIpAddr+1 
	CALL        _Net_Ethernet_28j60_confNetwork+0, 0
;HTTP_Demo.c,461 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	MOVLW       3
	MOVWF       SPBRGH+0 
	MOVLW       64
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;HTTP_Demo.c,462 :: 		Delay_ms(100);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main117:
	DECFSZ      R13, 1, 1
	BRA         L_main117
	DECFSZ      R12, 1, 1
	BRA         L_main117
	DECFSZ      R11, 1, 1
	BRA         L_main117
;HTTP_Demo.c,464 :: 		while(1) {
L_main118:
;HTTP_Demo.c,466 :: 		Net_Ethernet_28j60_doPacket() ;   // process incoming Ethernet packets
	CALL        _Net_Ethernet_28j60_doPacket+0, 0
;HTTP_Demo.c,467 :: 		for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
	CLRF        _i+0 
L_main120:
	MOVLW       _NUM_OF_SOCKET_28j60
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main121
;HTTP_Demo.c,468 :: 		if(socket_28j60[i].open == 0)
	MOVLW       51
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _i+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _socket_28j60+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_socket_28j60+0)
	ADDWFC      R1, 1 
	MOVLW       34
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main123
;HTTP_Demo.c,469 :: 		pos[i] = 0;
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pos+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_pos+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
L_main123:
;HTTP_Demo.c,467 :: 		for(i = 0; i < NUM_OF_SOCKET_28j60; i++) {
	INCF        _i+0, 1 
;HTTP_Demo.c,470 :: 		}
	GOTO        L_main120
L_main121:
;HTTP_Demo.c,472 :: 		}
	GOTO        L_main118
;HTTP_Demo.c,473 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
