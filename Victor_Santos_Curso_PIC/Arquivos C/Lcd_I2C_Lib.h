



extern char Lcd_I2C_Address;

#define _LCD_FIRST_ROW          0x80
#define _LCD_SECOND_ROW         0xC0
#define _LCD_THIRD_ROW          0x94
#define _LCD_FOURTH_ROW         0xD4
#define _LCD_CLEAR              0x01
#define _LCD_RETURN_HOME        0x02

#define _LCD_CURSOR_OFF         0x0C
#define _LCD_UNDERLINE_ON       0x0E
#define _LCD_BLINK_CURSOR_ON    0x0F
#define _LCD_MOVE_CURSOR_LEFT   0x10
#define _LCD_MOVE_CURSOR_RIGHT  0x14
#define _LCD_TURN_ON            0x0C
#define _LCD_TURN_OFF           0x08
#define _LCD_SHIFT_LEFT         0x18
#define _LCD_SHIFT_RIGHT        0x1E



 void Lcd_I2C_Cmd(char out_char){
   
   char I2C_byte;
   
   I2C_byte = out_char & 0xF0;
   
   I2C1_Start();
   I2C1_Wr(Lcd_I2C_Address);
   
   I2C_byte.f2 = 0;
   I2C_byte.f3 = 1;
   I2C1_Wr(I2C_byte);
   I2C_byte.f3 = 0;
   I2C1_Wr(I2C_byte);
  
   I2C_byte = (out_char << 4) & 0xF0;
   
   I2C_byte.f2 = 0;
   I2C_byte.f3 = 1;
   I2C1_Wr(I2C_byte);
   I2C_byte.f3 = 0;
   I2C1_Wr(I2C_byte);
   I2C1_Stop();
   
   delay_ms(10);

 }
 
 void Lcd_I2C_Init(){
 
   char I2C_byte;
   delay_ms(100);
   
   I2C1_Start();
   I2C1_Wr(Lcd_I2C_Address);
   delay_ms(10);
   
   I2C_byte = 0x30;
   I2C_byte.f3 = 1
   I2C1_Wr(I2C_byte);
   
 
 
 }


