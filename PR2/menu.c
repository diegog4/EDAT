#include <stdio.h>
#include <stdlib.h>
/*prototipos de privadas*/
int ShowProductsMenu();
int ShowOrdersMenu();
int ShowCustomersMenu();
/*fin de prototipos de privadas*/

int ShowMainMenu() {
    int nSelected = 0;
    char buf[16]; /* buffer for reading user input
                     in theory we only need 1 char
                     but a large buffer will handle
                     more gracefully wrong inputs
                     as 'qwerty' */

    do {
        printf("Seleccione la opción que desea\n");
        printf("1. Products.\n2. Orders.\n3. Customers.\n4. Exit.\n"
               "Enter a number that corresponds to your choice > ");
        if (!fgets(buf, 16, stdin))
            /* reading input failed, give up: */
            nSelected =0;
        else
            /* have some input, convert it to integer: */
            nSelected = atoi(buf);
        printf("\n");

        if ((nSelected < 1) || (nSelected > 4)) { /*si no esta entre las opciones*/
            printf("You have entered an invalid choice. Please try again\n\n\n");
        }
    } while ((nSelected < 1) || (nSelected > 4)); /*mientrás que sea un numero incorrecto*/

    return nSelected;
}

int ShowSubMenu(int *opt){
    switch (*opt)
    {
    case 1:
        return ShowProductsMenu();
        break;
    
    case 2:
        return ShowOrdersMenu();
        break;
    case 3:
        return ShowCustomersMenu();
        break;
    }
    return 0; /*opt incorrecta, no se puede dar el caso porque ShowMainMenu ya tiene comprobación pero por si acaso*/
}

int ShowProductsMenu() {
    int nSelected = 0;
    char buf[16]; /* buffer for reading user input
                     in theory we only need 1 char
                     but a large buffer will handle
                     more gracefully wrong inputs
                     as 'qwerty' */

    do {
        printf("Seleccione la opción que desea\n");
        printf("1. Stock.\n2. Find.\n3. Back.\n"
               "Enter a number that corresponds to your choice > ");
        if (!fgets(buf, 16, stdin))
            /* reading input failed, give up: */
            nSelected =0;
        else
            /* have some input, convert it to integer: */
            nSelected = atoi(buf);
        printf("\n");

        if ((nSelected < 1) || (nSelected > 3)) { /*si no esta entre las opciones o si no ha leido nada el fgets*/
            printf("You have entered an invalid choice. Please try again\n\n\n");
        }
    } while ((nSelected < 1) || (nSelected > 3)); /*mientrás que sea un numero incorrecto*/

    return nSelected /*retorna la selección*/;
}

int ShowOrdersMenu() {
    int nSelected = 0;
    char buf[16]; /* buffer for reading user input
                     in theory we only need 1 char
                     but a large buffer will handle
                     more gracefully wrong inputs
                     as 'qwerty' */

    do {
        printf("Seleccione la opción que desea\n");
        printf("1. Open.\n2. Range.\n3. Detail.\n4. Back.\n"
               "Enter a number that corresponds to your choice > ");
        if (!fgets(buf, 16, stdin))
            /* reading input failed, give up: */
            nSelected =0;
        else
            /* have some input, convert it to integer: */
            nSelected = atoi(buf);
        printf("\n");

        if ((nSelected < 1) || (nSelected > 4)) { /*si no esta entre las opciones o si no ha leido nada el fgets*/
            printf("You have entered an invalid choice. Please try again\n\n\n");
        }
    } while ((nSelected < 1) || (nSelected > 4)); /*mientrás que sea un numero incorrecto*/

    return nSelected; /*retorna la selección*/
}

int ShowCustomersMenu() {
    int nSelected = 0;
    char buf[16]; /* buffer for reading user input
                     in theory we only need 1 char
                     but a large buffer will handle
                     more gracefully wrong inputs
                     as 'qwerty' */

    do {
        printf("Seleccione la opción que desea\n");
        printf("1. Find.\n2. List Products.\n3. Balance.\n4. Back.\n"
               "Enter a number that corresponds to your choice > ");
        if (!fgets(buf, 16, stdin))
            /* reading input failed, give up: */
            nSelected =0;
        else
            /* have some input, convert it to integer: */
            nSelected = atoi(buf);
        printf("\n");

        if ((nSelected < 1) || (nSelected > 4)) { /*si no esta entre las opciones o si no ha leido nada el fgets*/
            printf("You have entered an invalid choice. Please try again\n\n\n");
        }
    } while ((nSelected < 1) || (nSelected > 4)); /*mientrás que sea un numero incorrecto*/

    return nSelected; /*retorna la selección*/
}   


