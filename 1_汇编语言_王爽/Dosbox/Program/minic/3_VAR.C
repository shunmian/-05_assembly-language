int a1,a2,a3;

int f(int, int,int);

main()
{
                    /*0 保存BP(将stack segment用作data segment),保存SP,将所有用到的寄存器入栈(SI,DI)---*/
                        /*push  BP
                          mov   BP,SP
                          push  DI
                          push  SI                              */
                    /*1 B1,B2不作为参数被函数调用，直接在stack中保留位置,B1通过BP将stack当作data segment赋值*/
    int b1 = 0xb1;      /*sub   sp,+04
                          mov   wort ptr [BP-04],00B1           */
	int b2,b3,b4;
                    /*2 a1,a2,a3作为全局变量，被赋值,段地址在ds里-----------------------------------*/
	a1=0xa1;            /*mov   word ptr [01A6],00A1            */
    a2=0xa2;            /*mov   word ptr [01A8],00A2            */
    a3=0xa3;            /*mov   word ptr [01AA],00A3            */
    
                    /*4 将传入函数的参数根据参数顺序b2,b3,1反向入栈-----------------------------------*/
                        /*mov   AX,0001
                          push  AX                              */
	b2=0xb2;            /*mov   DI,00B3
                          push  DI                              */
    b3=0xb3;            /*move  SI,00B2
                          push  SI                              */
                    /*5 调用函数，实参b2,b3在栈顶，在022F里通过[BP+4],[BP+6]来引用
                                                       不是[BP+2],[BP+4]的原因是call会入栈IP
                        将f函数返回的值(在AX里)传给b4---------------------------------------------*/
    b4=f(b2,b3,1);      /*call  022F
                          mov   [BP-02],AX                                                     */
    
                    /*6 将之前调用函数入栈的b2,b3,1顺序出栈----------------------------------------*/
                        /*add sp,+06                                                            */
    
                    /*-0 恢复用到过的寄存器的值(反向出栈),恢复SP，恢复BP，恢复IP(调用ret)----------------*/
                        /*pop   DI
                          pop   SI                              
                          mov   SP,BP
                          pop   BP
                          ret                                   */
}

int f(int x, int y,int z)
{                   /*0 保存BP(将stack segment用作data segment),保存SP,将所有用到的寄存器入栈(SI)---*/
                        /*push  BP
                          mov   BP,SP
                          push  SI                              */
                    /*1 c1,c2不会作为参数被函数调用，直接在stack中保留位置----------------------------*/
	int c1,c2,c3;       /*sub   SP,+04                          */
                    /*2 a1,a2,a3作为全局变量，被赋值,段地址在ds里-----------------------------------*/
	a1=0x0fa1;          /*mov   word ptr [01A6],0FA1            */
    a2=0x0fa2;          /*mov   word ptr [01A8],0FA2            */
    a3=0x0fa3;          /*mov   word ptr [01AA],0FA3            */

                    /*3 c1,c2 通过BP当作data semgent来读写---------------------------------------*/
	c1=0xc1;            /*mov   wort ptr [BP-04],00C1           */
    c2=0xc2;            /*mov   wort ptr [BP-02],00C2           */
    
                    /*4 将传入的参数通过BP来读写，-------------------------------------------------*/
    c3=x+y+z;             /*mov   SI,[BP+04]
                            add   SI,[BP+06]
                            add   SI,[BP+08]                      */
                    /*5 将c3作为return的参数调用，返回值直接保存在AX---------------------------------*/
    return c3;          /*mov   AX,SI                           */
                   /*-0 恢复用到过的寄存器的值(反向出栈),恢复SP，恢复BP，恢复IP(调用ret)----------------*/
                        /*pop   SI
                          mov   SP,BP
                          pop   BP
                          ret                                   */
}




