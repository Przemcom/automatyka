%Etap 1
%Zamodelowac system.

%Deklaruje systemPodstawowy jako zmienna globalna, zeby przyspieszyc proces
%optymalizacji.
global systemPodstawowy;
systemPodstawowy = zpk([],[0, -1],10);

%Etap 2
%Wykorzystujac fminsearch znajde takie wartosci wspolczynnikow kompensatora
%dla ktorych odpowiedz skokowa bedzie przeregulowana o 20%.
[nastawy, blad] = fminsearch('indent', [1, 1]);

a = nastawy(1);
T = nastawy(2);

kompensator = tf([a*T,1],[T,1]);

systemSkompensowany = series(kompensator, systemPodstawowy);

step(feedback(systemSkompensowany, 1));