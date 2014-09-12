3. laboratorijska vaja pri predmetu OET1
========================================


Uvod
----


To je GIT repozitorij razvojne različice laboratorijske vaje z računalnikom pri
predmetu Osnove elektrotehnike 1. Namen vaje je, da se študentje spoznajo z
preprostimi numeričnimi metodami za izračun električnega potenciala (in
električne poljske jakosti) v okolici diskretnih nabojev. Vaja pokaže tudi
preproste načine diskretizacije razsežnih struktur s točkastimi naboji.


Zahteve
-------

Za uporabo programov potrebujete programsko okolje Octave
(http://www.gnu.org/software/octave/) in gnuplot (http://www.gnuplot.info/).

V kolikor uporabljate operacijski sistem Linux, lahko najdete oba pripomočka v
repozitorijih vaše distribucije. Za Debian/Ubuntu lahko npr. oboje namestite z
ukazom v terminalskem oknu: `sudo apt-get install octave gnuplot'.


Uporaba programov
-----------------

Krovni programi so:

* `lab1a'
* `lab2a'
* `lab3a'
* `lab4plosci', `lab4konica', `lab4koaks'
* `lab5a'

V programih (skriptah) najprej specificiramo vhodne podatke, ki so podrobneje
razloženi v delovnem zvezku za laboratorijske vaje. Preostanek programa je
izvajanje izračunov ter niz klicov funkcij. Funkcije so priložene v istoimenskih
`.m' datotekah.

Namen GIT repozitorija
----------------------

Laboratorijska vaja se bo sčasoma razvijala in izboljševala. GIT repozitorij nam
bo predvsem olajšal vzdrževanje različic programov. Dodatna prednost javnega GIT
repozitorija pa je, da omogoča tudi studentom, da prispevajo popravke k
laboratorijski vaji, zato vabljeni k sodelovanju pri razvijanju vaje. 

Če bi želeli izvedeti kaj več o orodju GIT, vas vabim, da obiščete spletno stran 
http://git-scm.com/ . Poznavanje orodja ni nujno za pomoč in sodelovanje pri
razvoju, vam bo pa prišlo prav pri ostalih programerskih projektih ;).


