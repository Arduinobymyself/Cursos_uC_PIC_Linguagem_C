#line 1 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula019.c"
#line 22 "C:/Users/ABMS-Telecom/Documents/PROTEUS/Victor_Santos_Curso_PIC/Arquivos C/VSaula019.c"
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;










char texto1[] = "  ABMS Telecom  ";

const char batteryEmpty[] = {14,17,17,17,17,17,31,0};

void battery0(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(batteryEmpty[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

const char batteryMedium[] = {14,17,17,17,31,31,31,0};

void battery1(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(72);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(batteryMedium[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 1);
}
const char batteryFull[] = {14,31,31,31,31,31,31,0};

void battery2(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(80);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(batteryFull[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 2);
}

const char smille[] = {0,10,10,0,17,14,0,0};

void emoticon1(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(88);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(smille[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 3);
}

const char heart[] = {0,10,21,21,17,10,4,0};

void heart1(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(96);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(heart[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 4);
}

const char speaker[] = {1,3,5,13,5,3,1,0};

void speaker1(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(104);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(speaker[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 5);
}

const char smille2[] = {0,10,10,0,14,17,0,0};

void emoticon2(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(112);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(smille2[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 6);
}

const char cadeado[] = {14,17,17,31,27,27,31,0};

void cadeado1(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(120);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(cadeado[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 7);
}







void main() {
 CMCON = 0x07;
 TRISD = 0x00;
 PORTD = 0x00;
 TRISB = 0b00000011;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_RETURN_HOME);

 Lcd_Out(1, 1, texto1);

 while(1){
 battery0(2, 3);
 battery1(2, 5);
 battery2(2, 7);
 emoticon1(2, 9);
 heart1(2, 11);
 emoticon2(2, 13);
 cadeado1(2, 15);
 }

}
