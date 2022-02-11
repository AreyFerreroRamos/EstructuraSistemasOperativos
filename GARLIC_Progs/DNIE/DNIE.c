/****************************************************/
/*		Calculo del digito de control DNI/NIF       */
/*				   (DNIF)          					*/
/*			Autor: Marc Infante Garcia  			*/
/****************************************************/


#include <GARLIC_API.h>
#define CODIGOY 10000000
#define CODIGOZ 20000000
#define NUM7CIFRAS 9999999
#define NUM8CIFRAS 99999999
//PASADO UN NUMERO (MAX), CALCULA UN NUMERO ALEATORIO ENTRE 0 Y MAX.
int aleatorio(int max){

unsigned int num,quo,res;
max += 1;
num=GARLIC_random();
GARLIC_divmod(num,max,&quo,&res);
while(quo==0){
	res*=10;
	GARLIC_divmod(res,max,&quo,&res);
}
return (num);

}
/***************************************************************************************/
//	Algoritmo principal.
//  Dado un argumento entre 0 y 3:
// arg==0 -> Calcula la letra de 10 DNI aleatorios de 7 cifras y  otros 10 de 8 cifras
// arg==1 -> Supone letra incial X (X=0) y calcula la letra de 20 NIF aleatorios
// arg==2 -> Supone letra incial Y (Y=0) y calcula la letra de 20 NIF aleatorios
// arg==3 -> Supone letra incial Z (Z=0) y calcula la letra de 20 NIF aleatorios
/***************************************************************************************/
int _start(int arg)
{
static const char crypt[]= {'T','R','W','A','G','M','Y','F','P','D','X','B','N','J','Z','S','Q','V','H','L','C','K','E'};
    int i,num;
    unsigned int quo,res,suma=0;
    char letter;

    if (arg < 0) arg = 0;
	else if (arg > 3) arg = 3;

    switch(arg){
        case(1):letter='X';break;
        case(2):letter='Y';suma=CODIGOY;break;
        case(3):letter='Z';suma=CODIGOZ;break;
    }

    if(arg==0){
        GARLIC_printf("Has seleccionado la opcion de DNI:\n");
        for(i=0;i<20;i++){
            num=aleatorio(NUM8CIFRAS);
            GARLIC_printf("%0%d, letra:",num);
            GARLIC_divmod(num,23,&quo,&res);
            GARLIC_printf("%2 %c \n",crypt[res]);
        }

    }else{
        GARLIC_printf("Has seleccionado la opcion de NIE:\n");
        for(i=0;i<20;i++){
            num=aleatorio(NUM7CIFRAS);
            GARLIC_printf("%0%c%d, letra:",letter,num);
            num += suma;
            GARLIC_divmod(num,23,&quo,&res);
            GARLIC_printf("%2 %c \n",crypt[res]);
        }

    }

    return 0;
}
