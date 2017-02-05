program ALGO_Cours_TP_Bataille_Navale (input, output);

uses crt;

const
        vide=' '; //D‚finition d'un vide en constante
        Max=11; //Taille maximum du plateau

        MaxTailleBat=5;//Taille Maximum d'un bateau
        MaxTailleFlotte=5; //Taille maximum d'une flotte

//Les cases ont des coordonn‚es de lignes et de colonnes
Type
        Cells=record
                Ligne,Colonne:integer;
        end;

//Les bateaux sont compos‚s d'un ensemble de cases
Type
        Bateau=record
                TabBat:Array [1..MaxTailleBat] of Cells; //Tableau de cases d'un bateau
        end;

//La flotte est compos‚e d'un ensemble de bateaux
Type
        Flotte=record
                TabFlotte:Array[1..MaxTailleFlotte] of Bateau; //Tableau de bateaux
        end;

procedure InitPlat (i,j:integer);//Initialisation du plateau vierge
        var
                DebLigne, DebColonne:integer; //Chiffres et lettres de d‚but de ligne et colonne

        begin
        //Initialisation des variables
        DebColonne:=1;
        DebLigne:=ord('A');

        //Creation et affichage du plateau
        FOR i:=1 TO Max DO
                begin
                FOR j:=1 TO Max DO
                        begin
                        IF (i=1) AND (j=1) THEN //Affichage du vide en haut … gauche du plateau
                                begin
                                write(vide);
                                end
                        ELSE
                                begin
                                IF (i<>1) AND (j=1) THEN //Affichage … partir de A jusqu'… J
                                        begin
                                        write(chr(DebLigne));
                                        DebLigne:=DebLigne+1;
                                        end
                                ELSE
                                        begin
                                        IF (i=1) AND (j<>1) THEN //Affichage … partir de 1 jusqu'… 10
                                                begin
                                                write(DebColonne);
                                                DebColonne:=DebColonne+1;
                                                end
                                        ELSE  //Affichage des points
                                                begin
                                                write('.');
                                                end;
                                        end;
                                end;
                        end;
                        writeln;
                end;
        end;

procedure InitBat (var PorteAvion,Croiseur,SousMarin1,SousMarin2,Torpilleur:Bateau; i:integer); //Initialisation des valeurs dans les tableaux des bateaux
        begin
        FOR i:=1 TO MaxTailleBat DO
                begin
                //Porte-Avion
                PorteAvion.TabBat[i].Ligne:=0;
                PorteAvion.TabBat[i].Colonne:=0;

                //Croiseur
                Croiseur.TabBat[i].Ligne:=0;
                Croiseur.TabBat[i].Colonne:=0;

                //Sous-marin 1
                SousMarin1.TabBat[i].Ligne:=0;
                SousMarin1.TabBat[i].Colonne:=0;

                //Sous-Marin 2
                SousMarin2.TabBat[i].Ligne:=0;
                SousMarin2.TabBat[i].Colonne:=0;

                //Torpilleur
                Torpilleur.TabBat[i].Ligne:=0;
                Torpilleur.TabBat[i].Colonne:=0;
                end;
        end;

procedure InitFlotte (var FlotteOrdi:Flotte; var PorteAvion,Croiseur,SousMarin1,SousMarin2,Torpilleur:Bateau; i:integer); //Cr‚ation du tableau de flotte
        begin
        FlotteOrdi.TabFlotte[1]:=PorteAvion;
        FlotteOrdi.TabFlotte[2]:=Croiseur;
        FlotteOrdi.TabFlotte[3]:=SousMarin1;
        FlotteOrdi.TabFlotte[4]:=SousMarin2;
        FlotteOrdi.TabFlotte[5]:=Torpilleur;
        end;

procedure ChoixJoueur (var ChoixLigne:integer; var ChoixColonne:char);//Choix de la cible du joueur
        begin
        //Choix du num‚ro de ligne
        GotoXY(1,14);
        write('Veuillez entrer le numero de la ligne de votre cible : ');
        readln(ChoixLigne);

        //Choix de la lettre de colonne
        GotoXY(1,15);
        write('Veuillez entrer la lettre de la colonne de votre cible : ');
        readln(ChoixColonne);
        end;

function VerifCell (var Case1,Case2:Cells; VerifCase,VerifLigne,VerifColonne:boolean):boolean; //Comparaison de deux cases
        begin
        VerifLigne:=Case1.Ligne=Case2.Ligne;//V‚rifie si la ligne des deux cases est la mˆme
        VerifColonne:=Case1.Colonne=Case2.Colonne;//V‚rifie si la colonne des deux cases est la mˆme

        //Condition permettant de savoir si les deux cases sont identiques ou non
        IF VerifLigne=TRUE AND VerifColonne=TRUE THEN
                begin
                VerifCase:=TRUE;
                end
        ELSE
                begin
                VerifCase:=FALSE;
                end
        end;

//Programme principal
var
        DebLigne,DebColonne:integer; //DebLigne correspond au lettres de A … J et DebColonne aux chiffres de 1 … 10
        i,j:integer;//Coordonn‚es d'affichage du plateau vierge
        PorteAvion,Croiseur,SousMarin1,SousMarin2,Torpilleur:Bateau; //Tous les tableaux de bateaux
        FlotteOrdi:Flotte;//Tableau de la flotte de l'ordinateur
        ChoixLigne:integer;//Choix du num‚ro de ligne par le joueur
        ChoixColonne:char;//Choix de la lettre de colonne par le joueur

BEGIN
        clrscr;
        writeln('Programme : Bataille navale');

        //Initialisation des valeurs dans les tableaux des bateaux
        InitBat(PorteAvion,Croiseur,SousMarin1,SousMarin2,Torpilleur,i);

        //Initialisation de la flotte de l'ordinateur
        InitFlotte(FlotteOrdi,PorteAvion,Croiseur,SousMarin1,SousMarin2,Torpilleur,i);

        //Initialisation du plateau
        InitPlat(i,j);

        //Choix de la cible du joueur
        CHoixJoueur(ChoixLigne,ChoixColonne);

        readln;

END.
