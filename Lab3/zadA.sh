#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3 – semestr letni 2020/2021
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
#
# Przygotowane rozwiązania nie muszą być całkowicie uniwersalne. Zakładamy,
# że ogólna struktura katalogów się nie zmienia (nie będzie już więcej/mniej
# poziomów podkatalogów), jednakże same nazwy i zawartości plików (o ile
# nie są podane wprost w treści zadań) mogą być dowolne i ulegać zmianie,
# a przygotowane rozwiązania nadal powinny działać.
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 10.
# Wyszukać w podanym katalogu (pierwszy argument skryptu) wszystkie dowiązania
# twarde do wskazanego pliku (drugi argument skryptu). Nie trzeba uwzględniać
# podkatalogów przy przeszukiwaniu. Wyświetlić same nazwy znalezionych plików.
# Na początku skontrolować liczbę argumentów skryptu i istnienie odpowiednich
# elementów; jeśli podany katalog lub plik nie istnieją – zwrócić ze skryptu
# kod błędu (komenda: exit 1).
#
# Przykład uruchomienia: ./zadA.sh 'bbb' 'ddd/wanted'
#


Source=$1
Filename=$2

if [[ -z "$Filename" ]] || [[ -z "$Source" ]]; then
	exit 1
fi
if [[ ! -f "$Filename" ]] || [[ ! -d "$Source" ]]; then
	exit 1
fi
for file in $(find "$Source" -samefile "$Filename")
	do
    		echo $(basename "$file")

	done
