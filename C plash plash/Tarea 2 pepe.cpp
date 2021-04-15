#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <windows.h>

 void gotoxy(int x,int y){  
      HANDLE hcon;  
      hcon = GetStdHandle(STD_OUTPUT_HANDLE);  
      COORD dwPos;  
      dwPos.X = x;  
      dwPos.Y= y;  
      SetConsoleCursorPosition(hcon,dwPos);  
 } 

int main(){
	int M[6][20];
	for (int punt=0; punt<120; punt++){
		M[0][punt]=1;
	}
		
	srand(time(NULL));
	for(int fila=0; fila<6; fila++){
		M[fila][rand() % 20] = 0;
	}
	
	for(int fila=0; fila<6; fila++){
		for(int col=0; col<20; col++){
			printf("%d",M[fila][col]);
		}
		printf("\n");
	}
	
	int cont=0, num, xcol, col_buff, buff;
	while(cont<6){
		printf("Ingrese numero a mover fila %i : ", (cont+1));
		scanf("%d",&num);
		
		if (num==0){
			cont=-1;
		}
		
		if (cont==0){
			for(int col=0; col<20; col++){
			
				if (M[0][col]==0){
					xcol=col;
				}
			}
			M[0][xcol]=1;
			buff=xcol+num;
			if (buff>20){
				col_buff=buff-20;
				M[0][col_buff]=0;
			}else{
				if (buff<0){
					col_buff=buff+20;
					M[0][col_buff]=0;
				}else{
					M[0][buff]=0;
				}
			}
		}else{
			if (cont==1){
				for(int col=0; col<20; col++){
			
					if (M[1][col]==0){
						xcol=col;
					}
				}
				M[1][xcol]=1;
				buff=xcol+num;
				if (buff>20){
					col_buff=buff-20;
					M[1][col_buff]=0;
				}else{
					if (buff<0){
						col_buff=buff+20;
						M[1][col_buff]=0;
					}else{
						M[1][buff]=0;
					}
				}
			}else{
				if (cont==2){
					for(int col=0; col<20; col++){
			
						if (M[2][col]==0){
							xcol=col;
						}
					}
					M[2][xcol]=1;
					buff=xcol+num;
					if (buff>20){
						col_buff=buff-20;
						M[2][col_buff]=0;
					}else{
						if (buff<0){
							col_buff=buff+20;
							M[2][col_buff]=0;
						}else{
							M[2][buff]=0;
						}
					}
		
				}else{
					if (cont==3){
						for(int col=0; col<20; col++){
			
							if (M[3][col]==0){
								xcol=col;
							}
						}
						M[3][xcol]=1;
						buff=xcol+num;
						if (buff>20){
							col_buff=buff-20;
							M[3][col_buff]=0;
						}else{
							if (buff<0){
								col_buff=buff+20;
								M[3][col_buff]=0;
							}else{
								M[3][buff]=0;
							}
						}	
					}else{
						if (cont==4){
							for(int col=0; col<20; col++){
			
								if (M[4][col]==0){
									xcol=col;
								}
							}
							M[4][xcol]=1;
							buff=xcol+num;
							if (buff>20){
								col_buff=buff-20;
								M[4][col_buff]=0;
							}else{
								if (buff<0){
									col_buff=buff+20;
									M[4][col_buff]=0;
								}else{
									M[4][buff]=0;
								}
							}
						}else{
							if (cont==5){
								for(int col=0; col<20; col++){
			
									if (M[5][col]==0){
										xcol=col;
									}
								}
								M[5][xcol]=1;
								buff=xcol+num;
								if (buff>20){
									col_buff=buff-20;
									M[5][col_buff]=0;
								}else{
									if (buff<0){
										col_buff=buff+20;
										M[5][col_buff]=0;
									}else{
										M[5][buff]=0;
									}
								}
		
							}
						}
					}
				}
			}
		}
					
		for(int fila=0; fila<6; fila++){
			for(int col=0; col<20; col++){
				printf("%d",M[fila][col]);
			}
			printf("\n");
		}
		//Sleep(2000);
		//system("cls");
		
		
		
		cont++;
	}
	system("pause");
}
