# TU_PROG
Fortran-Programme zur Vorlesung "Programmieren für Mathematiker" von Prof. Wolfgang Walter (TU Dresden)

Vorlesungsmitschriften gibt es hier: [https://github.com/henrydatei/TUD_MATH_BA](https://github.com/henrydatei/TUD_MATH_BA)

## 1. Semester (WS 2017/18)

### 1. Aufgabe (Rundungsfehler)
Tippen Sie das folgende Fortran 95-Programm ein und speichern Sie es in einer Datei namens RoundingError.f95. In diesem
Programm wird die mathematische Formel/Rechenvorschrift x^4 − 4y^4 − 4y^2 auf 6 verschiedene Arten und Weisen als
programmiersprachlicher Ausdruck (englisch: expression) dargestellt und berechnet.

Zugehörige Datei: `rundungsfehler.f95`

### 2. Aufgabe (Gleitkommazahlen)
Auf einem fiktiven Computer seien alle darstellbaren reellen Zahlen, genannt Gleitkommazahlen (GKZ), in dem 8-bit GKZ-Format
R(2, 5, −1, +2) speicherbar. In diesem binären Format werden 1 Bit für das Vorzeichen s, 2 Bit für den (verschoben, d.h. nicht-
negativ gespeicherten) Exponenten e zur Basis 2 (hier im Bereich −1, . . . , +2) und 5 Bit für die Mantisse m = 0.m_1m_2m_3m_4m_5
einer Gleitkommazahl x verwendet: x = (s,m,e) = (-1)^s * Summe_{i=1}^5 m_i*2^{-i} * 2^e

### 3. Aufgabe (Taylor-Reihe, e^x)
Schreiben Sie ein Fortran 95–Programm, welches e x mit Hilfe der Taylor-Reihe e^x = Summe_{i=0}^unendlich x^i/i! mit doppelt
genauer reeller Gleitkommaarithmetik berechnet.

Zugehörige Datei: `ehochx.f95`

### 4. Aufgabe (Tilgung eines Kredits)
Ein Kredit soll bei einem festen Jahreszinssatz durch jährliche Raten, die mit eventueller Ausnahme der letzten Jahresrate
konstant sind, zurückgezahlt werden. Die jährlich zuzahlende Rate setzt sich aus einem Zinsanteil und einem Rückzahlungsanteil
(Tilgung)zusammen. Da die Restschuld bei jeder Teilrückzahlung geringer wird, wird auch derZinsanteil der (gleichbleibenden)
Jahresraten immer geringer, während die Tilgung immer größer wird. Die Raten werden jeweils im Abstand von einem Jahr und
erstmals ein Jahr nach Kreditaufnahme gezahlt.
Eingabedaten sind die Kredithöhe (anfängliche Restschuld in Euro), der Zinssatz (in Prozent) und die Höhe der Rate (in Euro).
Kommentiert auszugeben sind: die Höhe der letzten Rate (in Euro), sofern diese von der üblichen abweicht(!), die Laufzeit des
Kredits (in ganzen Jahren) und die Zinssumme (Summe aller gezahlten Zinsen in Euro).
Stellen Sie den folgenden Algorithmus zunächst in einem Struktogramm dar und schreiben und testen Sie sodann ein
entsprechendes Fortran 95-Hauptprogramm.

Zugehörige Datei: `kredit.f95`

### 5. Aufgabe (Zyklus)
Es sind n ≥ 1 ganze Zahlen x_1, x_2,...,x_n einzulesen und deren Maximum, Minimum, Summe und Mittelwert zu ermitteln. Dabei
sind in einer Schleife jeweils nach dem Einlesen einer Zahl sofort die neuen, derzeit aktuellen Werte für das Minimum, das
Maximum und die Summe zu bestimmen. Insbesondere müssen und dürfen die vorhergehenden Zahlen nicht gespeichert werden.
Zu Beginn des Programms ist die Anzahl n der einzulesenden Zahlen so lange einzulesen, bis diese die Bedingung n ≥ 1 erfüllt.
Am Ende sind die kleinste und die größte der Zahlen, deren Summe sowie deren Mittelwert x = (x_1 + x_2 + ... + x_n)/n mit
einem erläuternden Text auszugeben.
Entwickeln Sie einen Algorithmus, der diese Aufgabenstellung löst. Stellen Sie diesen in einem Flussdiagramm und einem
Struktogramm dar.
Schreiben Sie für diesen Algorithmus ein Fortran 95-Hauptprogramm (ohne Verwendung von Feldern/Arrays) und testen Sie dieses
mit geeigneten Daten.

Zugehörige Datei: `pseudo_array.f95`

### 6. Aufgabe (Zahlenratespiel)
Entwickeln Sie einen Spielalgorithmus, welcher eine von einem menschlichen Mitspieler ausgedachte ganze Zahl aus einem
vorgegebenen Intervall [l, r] mit möglichst wenigen Versuchen errät. Dabei sollen zunächst zwei ganze Zahlen l und r nach einer
entsprechenden Eingabeaufforderung so lange eingelesen werden, bis l < r gilt.
Das Spielprogramm soll nun wiederholt auf eine ganze Zahl aus diesem Intervall tippen, wobei der menschliche Mitspieler jeweils
antwortet, ob diese Zahl richtig, zu klein oder zu groß ist (ohne dabei zu mogeln). Das Spielprogramm erwartet vom menschlichen
Mitspieler als Tastatureingabe das Zeichen "=", wenn es die richtige Zahl erraten hat, ansonsten das Zeichen "<" bzw. ">", wenn
die getippte Zahl zu klein bzw. zu groß war.
Sobald die gedachte Zahl erraten wurde, soll die Anzahl der vom Spielprogramm benötigten Rateversuche mit begleitendem Kommentar
ausgegeben werden. Falls eine Eingabe des menschlichen Mitspielers früheren Eingaben widerspricht, soll der Algorithmus dies
erkennen und nach Ausgabe einer entsprechend formulierten Meldung das Programm beenden. Anderenfalls soll gefragt werden, ob
der Mitspieler ein weiteres Mal spielen möchte.
Entsprechend der Antwort (Eingabe z.B. eines Buchstabens für "ja" oder "nein") ist ein neues Spiel zu beginnen oder das
Programm zu beenden.
Entwickeln Sie einen Algorithmus, der diese Aufgabenstellung möglichst effizient löst. Der Algorithmus sollte schnell sein,
d.h. mit möglichst wenigen Abfragen (auch für den ungünstigsten Fall) auskommen, also eine Art Risikominimierung betreiben.
Stellen Sie diesen Algorithmus in einem Struktogramm dar. Schreiben Sie sodann ein entsprechendes Fortran 95-Hauptprogramm und
testen Sie es.
Versuchen Sie, einen mathematischen Zusammenhang zwischen der Anzahl der in Frage kommenden ganzen Zahlen n = r − l + 1 und der
maximal erforderlichen Anzahl der Rateversuche k abzuleiten.

Zugehörige Datei: `zahlenraten.f95`

### 7. Aufgabe + 8. Aufgabe (Berechnung von Prim- und Mirpzahlen mit Modul)
Eine natürliche Zahl n heißt Mirpzahl, wenn sie eine Primzahl ist und wenn die Zahl, die sich ergibt, wenn man (die dezimale
Darstellung von) n rückwärts liest, ebenfalls prim ist. Beispiele für Mirpzahlen sind 17, 71, 359 und 953. 23 ist zwar eine
Primzahl, aber keine Mirpzahl, denn 32 = 2^5. (Vorsicht: Die "Umkehrzahl" kann auch gerade und, wie hier, sogar eine
Zweierpotenz sein, d.h. keine ungeraden Primfaktoren besitzen!)
Schreiben Sie ein Fortran 95-Programm, das alle Prim- und alle Mirpzahlen in einem einzulesenden Intervall [a, b] mit 2 ≤ a ≤
b ≤ 10^9 bestimmt. Zum Test, ob eine ungerade natürliche Zahl n ≥ 3 prim ist, genügt es, in einer Schleife zu prüfen, dass n
durch keine ungerade Zahl im Intervall [3, sqrt(n)] teilbar ist, also der Rest dieser Divisionen nie null wird (Funktion MOD).
Zur Umkehrung der Dezimalziffernfolge von n verwendet man ebenfalls die MOD-Funktion sowie die ganzzahlige Division, welche den
gebrochenen Anteil des Quotienten abschneidet/ignoriert, d.h. den Quotienten zur nächsten betragskleineren ganzen Zahl rundet,
wenn dieser nicht schon eine ganze Zahl ist. Durch wiederholtes Extrahieren der hinteren Ziffer als Rest der Division durch
10 und anschließende ganzzahlige Division durch 10 werden die einzelnen Ziffern von hinten nach vorne bestimmt und können
simultan (in einer anderen Variable) durch Addieren der jeweiligen Ziffer und anschließendes Multiplizieren mit 10 zur Erzeugung
der "Umkehrzahl" verwendet werden.

Zugehörige Datei: `primzahl_und_mirpzahl.f95`

### 9. Aufgabe (Fibonacci-Zahlen)
Programmieren Sie in einem Modul eine Funktion fibo_iterativ, welche die i-te Fibonacci-Zahl iterativ, d.h. unter Benutzung
einer Schleife, sowie eine Funktion fibo_rekursiv, welche dieselbe Fibonacci-Zahl rekursiv, d.h. derart, dass die Funktion sich
selbst zweimal mit verschiedenen Argumenten aufruft, berechnet. Jede dieser beiden Funktionen hat ein ganzzahliges Argument und
ein ganzzahliges Ergebnis. Berechnen Sie wiederholt eine Fibonacci-Zahl, indem Sie im Hauptprogramm in einer Schleife den Index
i der gewünschten Fibonacci-Zahl (interessant sind hier Werte ab 30) einlesen, die Fibonacci-Zahl f_i nacheinander iterativ und
rekursiv berechnen und jeweils kommentiert ausgeben. Die Schleife soll durch Eingabe eines negativen Wertes für i beendet werden.
Ab welchem Index tritt Überlauf auf? Wie kann man dies (in dieser speziellen Anwendung) leicht erkennen?
Falls das von Ihnen verwendete System auch einen INTEGER-Typ mit 8 Byte Speicherbreite anbietet, sollten Sie (auch) diesen
verwenden. Alternativ können auch Gleitkommazahlen verwendet werden, um Fibonacci-Zahlen (näherungsweise) zu berechnen. Dabei
tritt ein Überlauf natürlich wesentlich später auf.

Zugehörige Datei: `fibonacci.f95`

### 10. Aufgabe (Syntaxbaum)
Zeichnen Sie den Syntaxbaum für den folgenden Infix-Ausdruck und bestimmen Sie die äquivalenten Prefix- und Postfix-Notationen:
-2**(N+1)**N/B/B > -C*C .NEQV. C >= C/B/A .AND. .NOT. A==C-B-A .OR. 8*A<B
Werten Sie den Ausdruck für N = 2, A = 0.5, B = 4.0, C = 5.0 per Hand aus.

### 11. Aufgabe (Optische Linse, Intervallarithmetik)
Mit einer Linse der Brennweite f = (20 ± 0.1) cm wurde für das Bild B eines Gegenstands G eine Bildweite b = (25 ± 0.5) cm
gemessen. Die Abbildungsgleichung für dünne Linsen zur Ermittlung der Gegenstandsweite g lautet 1/f = 1/b + 1/g. Üblicherweise
wird g = g_0 ± △g mit einem Fehlerterm △g dadurch ermittelt, daß man (...) berechnet. Dabei ist f_0 = 20 cm, b_0 = 25 cm,
△f = 0.1 cm und △b = 0.5 cm.
Verwenden Sie dabei die Module ERRORS und IVALMOD aus der Datei inewton.f95. Stellen Sie anhand der intervallmäßig berechneten
Einschließung g_2 fest, ob die üblicherweise benutzte erste Methode ein richtiges Ergebnis liefert, das heißt ob g_1 tatsächlich
die Menge der möglichen Werte von g einschließt.

Zugehörige Dateien: `duenne_linsen.f95` und `inewton.f95`

### 12. Aufgabe (Trilogie)
Neben der gewöhnlichen Aussagenlogik mit den beiden Zuständen true und false ist es möglich, für eine dreiwertige Logik (hier
scherzhaft "Trilogie" genannt) noch einen dritten Zustand maybe (vielleicht) einzuführen. Auch in der Trilogie lassen sich
logische Verknüpfungen wie "und" (∧), "oder" (∨) und "nicht" (¬) definieren.
Definieren Sie im Fortran 95–Hauptprogramm zunächst einen konstanten Vektor vom Typ trilog mit den 3 Elementen false, maybe und
true. Mittels dieses Vektors und entsprechender Schleifen, die alle möglichen Operandenwerte bzw. Kombinationen dieser Werte
durchlaufen, sollen nun die trilogischen Aussagetabellen für die 3 Grundoperationen "und", "oder", "nicht" bestimmt und mit
Hilfe der Funktion text ausgegeben werden. Des weiteren sollen die beiden Distributivgesetze sowie die beiden Gesetze von De
Morgan durch jeweils 3 ineinander geschachtelte Schleifen, welche jeweils alle 27 möglichen Operandenkombinationen durchlaufen,
überprüft werden.

Zugehörige Dateien: `trilog.f95` und `trilog_tester.f95`

### 13. Aufgabe (Magische Quadrate)
Eine n × n Matrix A heißt “magisches Quadrat”, wenn jede der Zahlen 1, 2, ..., n^2 genau einmal auftritt und es eine Zahl S ∈ N
gibt mit den Eigenschaften: (...)
Schreiben Sie ein Fortran 95-Programm, das magische Quadrate ungerader Ordnung n = 2m − 1 mit m ∈ N generiert und testet. Ein
magisches Quadrat kann wie folgt gebildet werden: (...)
Hierzu ist in einer Schleife die Dimension n (Test, ob n ungerade ist) von der Tastatur einzulesen, das dynamische Feld A im
Speicher als n × n Matrix anzulegen und mit Null zu initialisieren, das magische Quadrat wie oben beschrieben zu generieren und
übersichtlich auszugeben und sodann auf seine magische Eigenschaft zu testen, indem alle Zeilen-, Spalten- und Diagonalsummen
berechnet und verglichen werden sowie die gefundene Summe S und (zum Vergleich) der Wert n(n 2 + 1)/2 kommentiert ausgegeben
werden. Die Schleife soll so lange wiederholt werden, bis ein n ≤ 0 eingegeben wird.

Zugehörige Datei: `magisches_quadrat.f95`

### 14. Aufgabe (Marathon-Ergebnisliste)
Schreiben Sie ein Fortran 95–Programm, welches die Ergebnisse eines Marathonlaufs in unsortierter Reihenfolge einliest und das
Endergebnis in der Rangfolge vom ersten bis zum letzten Platz ausdruckt. Die Einzelergebnisse liegen dabei zeilenweise in einer
Textdatei namens marathon.dat in der folgenden Form vor: h m s Name
Dabei geben h, m und s die gelaufene Zeit des durch Name gekennzeichneten Teilnehmers in Stunden, Minuten und Sekunden an.
Schreiben Sie ein Hauptprogramm, in dem zunächst die maximal zugelassene Anzahl z der Marathonläufer eingelesen und ein Feld
entsprechender Größe angelegt wird und sodann die unsortierte Ergebnisliste des Marathonlaufs mit Hilfe der Prozedur leseliste
eingelesen wird (n ≤ z sei die zurückgelieferte Anzahl der eingelesenen Einzelergebnisse). Suchen Sie nun n-mal den
signifikanten Teil der Liste (d.h. die ersten n Elemente) nach dem jeweils besten noch nicht ausgegebenen Ergebnis durch, indem
Sie sich jeweils die zuletzt ausgegebene Zeit in einer Variable merken und nach der besten Zeit, die schlechter als die zuletzt
ausgegebene ist, suchen. Zu Beginn (vor der ersten Suche) sollten alle Komponenten dieser Variable auf Null gesetzt werden. Es
darf vorausgesetzt werden, dass keine identischen Laufzeiten erzielt wurden.
Geben Sie das gefundene Einzelergebnis jeweils sofort mit der Angabe des erreichten Platzes, der erreichten Zeit und des Namens
des Marathonläufers in einer eigenen Zeile aus, so dass schließlich das Endergebnis in der Rangfolge vom ersten bis zum letzten
Platz vorliegt. Diese Ergebnisausgabe soll sowohl auf den Bildschirm als auch in eine zuvor angelegte Textdatei mit einem zur
Programmlaufzeit frei wählbaren Namen erfolgen.

Zugehörige Dateien: `marathon.dat`, `marathon.f95` und `marathon_ausgabe.f95`

### 15. Aufgabe (Boothroyd/Dekker-Matrizen)
Die Elemente einer n × n Boothroyd/Dekker-Matrix B = (b_{ij}) sind ganze Zahlen, die durch die Definition (...) gegeben sind.
Schreiben Sie ein Fortran 95–Hauptprogramm, das in einer Schleife die Dimension (d.h. die Zeilenzahl) n einer Boothroyd/Dekker-
Matrix einliest und, falls n > 0, Speicherplatz für die benötigten dynamischen Felder reserviert (und später wieder freigibt),
die jeweilige Boothroyd/Dekker-Matrix sowie ihre Inverse generiert, die beiden generierten Matrizen mittels MATMUL multipliziert
und sodann die Boothroyd/Dekker-Matrix und die berechnete Produktmatrix zeilenweise auf dem Bildschirm ausgibt.
Ergibt sich als Produkt tatsächlich die Einheitsmatrix ? Im Fall n ≤ 0 soll die Schleife verlassen und das Programm beendet
werden.

Zugehörige Dateien: `boothroyd_mod.f95` und `boothroyd_hp.f95`

### 16. Aufgabe (Bandmatrizen)
Sei A ∈ R^{n×n} eine quadratische Matrix. A heißt Bandmatrix, falls alle von Null verschiedenen Elemente a_{ik} in der
Hauptdiagonale und in einigen dazu benachbarten Nebendiagonalen liegen. Bezeichnen hierbei p ∈ N_0 die Anzahl der unteren
Nebendiagonalen einschließlich der Hauptdiagonale, welche alle Nichtnullelemente des unteren Dreiecks beinhalten, und q ∈ N _0
die Anzahl der oberen Nebendiagonalen einschließlich der Hauptdiagonale, welche alle Nichtnullelemente des oberen Dreiecks
beinhalten, so besitzt die Matrix A das Bandbreitentupel (p, q). So hat beispielsweise eine vollbesetzte untere Dreicksmatrix
das Bandbreitentupel (n, 1) oder eine sogenannte Tridiagonalmatrix das Bandbreitentupel (2, 2), die folgende Matrix das
Bandbreitentupel (3, 4): (...)
Definieren Sie hierzu in einem Fortran 95–Modul eine Funktion untere_bandbreite, welche die untere Bandbreite p einer als
Argument übergebenen quadratischen reellen Matrix unbekannter Größe bestimmt. Hierfür sollen sukzessive die Diagonalen von
links unten beginnend nach dem ersten Nichtnullelement abgesucht werden. Beachten Sie den Sonderfall der Nullmatrix!
Schreiben Sie ein Fortran 95–Hauptprogramm, welches in einer Schleife die Dimension n einer (dynamischen) quadratischen reellen
Matrix von der Tastatur einliest, diese im Speicher als n × n Matrix anlegt, ihre Werte von der Tastatur einliest und sodann das
Bandbreitentupel (p, q) dieser Matrix bestimmt und kommentiert ausgibt. Die Schleife soll so lange wiederholt werden, bis ein
n ≤ 0 eingegeben wird.

## 2. Semester (SS 2018)

### 18. Aufgabe (Puzzle)
Ein typisches m×n Puzzle wird aus m·n Puzzleteilen zu einem Rechteck zusammengesetzt. Anstelle eines Bildausschnitts seien die
Puzzleteile mit je einem Zeichen (z.B. Buchstaben, Leerzeichen oder Satzzeichen) beschriftet, so dass das zusammengesetzte
Puzzle einen m-zeiligen Text ergibt. Jedes Puzzleteil hat 4 Seiten (1. Seite rechts, 2. unten, 3. links, 4. oben), deren
charakteristische Formen durch je eine ganze Zahl eindeutig bestimmt sind. Ränder (gerade Seiten) werden durch den Wert 0,
Ausbuchtungen durch positive und Einbuchtungen durch negative Werte dargestellt, wobei gerade Seiten (mit Wert 0) nur am Rand
des Puzzles vorkommen und zu jeder Ausbuchtung/Einbuchtung (mit Wert k > 0 bzw. k < 0) genau die eine Einbuchtung/Ausbuchtung
mit dem Wert −k passt. In einer Datei sei ein solches Puzzle durch die Parameter m und n sowie eine Auflistung von m·n
unsortierten und eventuell verdrehten Puzzleteilen gegeben. Alle Puzzleteile mit Ausnahme der 4 Eckteile können in der Datei
beliebig verdreht sein. Beispielhaft sei hier diese Datei für ein 2 × 3 Puzzle mit dem Lösungstext “PUZZLE” (siehe Bild) gegeben.
Im Fortran 95-Hauptprogramm wird der Dateiname (z.B. mypuzzle.pzl) des zu lösenden Puzzles von der Tastatur eingelesen. Sodann
wird das Puzzle eingelesen, gelöst, der Lösungstext auf dem Bildschirm ausgegeben und der verwendete Speicher freigegeben.

Zugehörige Dateien: `puzzle_hp.f95` und  `puzzle_module.f95`

### 19. Aufgabe (Kinderreim [einfach verkettete zyklische Liste])
Eine Gruppe von Kindern steht im Kreis. Mit dem Abzählreim "Eene, meene, muh und 'raus bist du! – 'raus bist du noch lan-ge
nicht, sag mir erst, wie alt du bist!" wird bis zu einem Kind abgezählt (jede der 21 Silben entspricht einem Abzählschritt) und
dann noch so viele Schritte weiter, wie dieses Kind (an Jahren) alt ist. Das dadurch ausgewählte Kind scheidet aus. Mit dem
nachfolgenden Kind wird das nächste Abzählen begonnen. Dieser Vorgang wird so oft wiederholt, bis nur noch ein Kind übrig bleibt.
Dieses hat gewonnen.
Zur Lösung dieser Aufgabenstellung sind zwei Programmvarianten zu erstellen und zu testen, wobei die besser strukturierte
Variante b) neben der üblichen Abgabe am Computer auch in gedruckter Form dem Tutor übergeben werden soll.

Zugehörige Datei: `kinderreim.f95` und `KREIM.DAT`

### 20. Aufgabe (Simulation eines Supermarkts, Warteschlangen)
Mit Hilfe von Warteschlangen (Queues), die nach dem FIFO–Prinzip (first in – first out) funktionieren, soll der zeitliche Ablauf
an den Kassen eines Supermarkts (vereinfacht) simuliert werden.
Schreiben Sie zur Verwaltung einer Warteschlange einen Fortran 95–Modul queuemod (die in der Vorlesung vorgestellte
Implementierung eines Stacks kann hilfreich sein), der folgende Bestandteile hat: (...)
Schreiben Sie ein Fortran 95–Hauptprogramm, das unter Benutzung des Moduls queuemod die Warteschlangen an den Kassen eines
Supermarkts simuliert. Dazu werden zunächst die Anzahl k > 0 der Kassen, die geöffnet sein sollen, sowie die
Ankunftswahrscheinlichkeit w (mit 0 < w < 1) eines neuen Kunden im Kassenbereich innerhalb eines Zeitschritts (1 Sekunde) von
der Tastatur eingelesen. Einem entsprechend dimensionierten Feld von Warteschlangen (vom Typ queue) ist dynamisch Speicherplatz
zuzuweisen und die Warteschlangen sind zu initialisieren.
Die Simulation erfolgt in einer Zeitschleife, wobei jede Iteration einem Zeitschritt von 1 Sekunde entsprechen soll. Es soll
ein ganzer Geschäftstag mit einer Öffnungszeit von beispielsweise 14 Stunden simuliert werden. In jeder Iteration werden
folgende Aktionen ausgeführt: (...)

Zugehörige Datei: `queuemod.f95` und `einkaufssimulation.f95`

### 21. Aufgabe (Zusammenmischen (Merge) mehrerer vorsortierter Dateien)
Es seien 99 bereits vorsortierte Textdateien erfass1.dat, erfass2.dat, ..., erfass99.dat gegeben. Diese bestehen aus in aufsteigender Reihenfolge sortierten, durch mindestens ein Leerzeichen oder ein Zeilenende voneinander getrennten ganzen Zahlen und sind i.a. unterschiedlich lang. Jede ganze Zahl kann sowohl mehrmals in derselben Datei als auch in mehreren Dateien vorkommen. Sie können solche Dateien selbst erzeugen, indem Sie das Programm erfass.f95 übersetzen und ausführen.
Die Aufgabe besteht darin, die Inhalte der ersten n dieser Dateien insgesamt in aufsteigen- der Reihenfolge sortiert in eine Textdatei ziel.dat auszugeben (n ist eine einzulesende natürliche Zahl mit 1 ≤ n ≤ 99). Dabei darf vorausgesetzt werden, dass keine der Eingabedateien leer ist und dass das Betriebssystem das gleichzeitige Öffnen von mindestens 100 Dateien erlaubt.

Im Fortran 95–Hauptprogramm ist das Arbeitsfeld, auf dem alle Sortiervorgänge stattfinden, als eindimensionales, dynamisches Feld mit Elementen vom Typ filecomp zu vereinbaren. Es wird zunächst die Anzahl n (im Intervall [1, 99]) der zu berücksichtigenden Dateien eingelesen und dem Arbeitsfeld entsprechender Speicherplatz zugewiesen.
Der weitere Programmablauf gliedert sich dann in drei Phasen, die als Subroutinen in einem Modul definiert und im Hauptprogramm aufgerufen werden können.

Phase1: Die Namen der n zu mischenden Dateien werden z.B. mittels interner Ein/Ausgabe ( = internal I/O, d.h. mit einer Zeichenkettenvariable als Datei) erzeugt; sodann werden diese Dateien geöffnet. Den Dateien wird beim Öffnen eine eindeutige Unitnummer (im Bereich [21, 500]) zugeordnet. Die Zieldatei ziel.dat wird ebenfalls geöffnet.

Phase 2: Das Arbeitsfeld wird erstmalig mit Inhalten gefüllt. Dabei werden von jeder der ersten n Erfassungsdateien deren Unitnummer sowie aus der jeweiligen Datei das erste Element in das Feld eingetragen. Anschließend wird der so gefüllte Teil des Arbeitsfelds einmalig in aufsteigender Reihenfolge (nach Inhaltskomponenten) sortiert (mittels sort).

Phase 3: Der aktive Indexbereich des Arbeitsfelds ist anfänglich (1 : n). Jedesmal, wenn eine Datei erschöpft ist, d.h. wenn alle ihre Elemente gelesen wurden, reduziert sich der aktive Indexbereich um einen Index, zunächst auf (2 : n), dann auf (3 : n), etc.
Der Algorithmus schreibt nun immer die Inhaltskomponente des ersten (kleinsten) Elements aus dem aktiven Indexbereich des Arbeitsfelds (immer an der Position mit kleinstem aktiven Index) in die Zieldatei ziel.dat und fügt sodann das nächste Element aus derselben Datei, aus der das gerade geschriebene Element stammte, mit Hilfe der Subroutine insert in den aktiven Bereich des Arbeitsfelds ein. So bleibt das Arbeitsfeld im aktiven Indexbereich immer in aufsteigender Reihenfolge sortiert. Falls eine Datei erschöpft ist und folglich kein Element mehr nachgeladen werden kann, erfolgt die oben beschriebene Reduktion des aktiven Indexbereichs.
Das Arbeitsfeld enthält in seinem aktiven Indexbereich grundsätzlich aus jeder der noch aktiven (noch nicht erschöpften) Dateien genau ein Element. Wenn die letzte Datei erschöpft ist, wird der aktive Indexbereich leer und das Programm wird ordnungsgemäß beendet.
Vergewissern Sie sich, dass die generierte Datei ziel.dat tatsächlich eine monoton (aber nicht streng monoton) wachsende Folge von Zahlen enthält — am besten durch nochmaliges Lesen und Testen am Ende des Programms.


Zugehörige Dateien: `merge_mod.f95`, `merge_hp.f95` und `dateien_generator.f95`

### 22. Aufgabe (Priorisierte Warteschlange zum Mischen von Dateien)
Bearbeiten Sie die Teilaufgaben c) und d) der vorhergehenden Aufgabe mit Hilfe einer Priority-Queue (als Heap implementierte Warteschlange), um die Effizienz des Algorithmus zu steigern. Hierzu sind in c) mittels Build-Heap ein Heap zu erzeugen und in d) durch Setzen des ersten Elements (Wurzel des Heaps) auf den einzufügenden Wert und durch Heapify an der Wurzel jeweils ein neues Element einzufügen.
Wichtig: Beachten Sie, dass hier der Heap entgegen der üblichen Ordnung an der Wurzel das kleinste Element enthält!
Entspricht der Laufzeitgewinn in etwa Ihren Erwartungen?

### 23. Aufgabe (Schnelle(?) Matrixmultiplikation nach Strassen)
Es ist die übliche Matrixmultiplikation mit der sogenannten schnellen Matrixmultiplikation nach Strassen zu vergleichen. Dabei werden im folgenden nur noch quadratische n × n-Matrizen betrachtet, deren Dimension eine Zweierpotenz ist.

Implementieren Sie in einem Fortran 95–Modul die Methoden strassen_matmul und simple_matmul, welche die Matrixmultiplikation nach Strassen bzw. die herkömmliche Matrixmultiplikation (mit 3 ineinander geschachtelten Schleifen) realisieren.
Schreiben Sie ein Fortran 95–Hauptprogramm, welches eine ganze Zahl k einliest, daraus die Matrixgröße n = 2^k berechnet und sodann zwei n × n-Matrizen A und B anlegt und mit Daten füllt. Wahlweise sollen die Daten aus einer Datei gelesen werden oder Hilbert-Matrizen generiert werden können. Berechnen Sie sodann das Produkt C = A * B dieser beiden Matrizen  
- einmal mit der intrinsischen Matrixmultiplikation MATMUL,
- einmal mit der Matrixmultiplikation nach Strassen und
- einmal nach der herko ̈mmlichen Methode
und prüfen Sie, ob alle drei Verfahren (bis auf Rundungsfehler) dieselben Ergebnisse liefern.

Messen Sie die Zeiten, die für die Multiplikationen gebraucht werden. Nutzen Sie dazu die Funktion dtime des g95-Compilers, welche entweder die Zeit seit ihrem letzten Aufruf oder, falls dieser noch nicht aufgetreten ist, die bisherige Laufzeit des Programms als reelle Zahl zurückgibt.
Was lässt sich über die ”schnelle“ Matrixmultiplikation nach Strassen aussagen? Testen Sie die Methoden auch für große Matrizen (mit Dimensionen von mindestens 256) und verwenden Sie verschiedene Optimierungsstufen (Compileroption -On ).

Zugehörige Dateien: `matmul_mod.f95` und `matmul_hp.f95`

Zusatzfragen: Der implementierte Algorithmus ist deterministisch. Wieso treten aber bei mehrmaliger Ausführung des Programms stets andere Laufzeiten auf?
Recherchieren Sie das Thema ”effiziente Matrixmultiplikation“. Welche algorithmischen Fortschritte konnten auf diesem Gebiet in den letzten 50 Jahren erzielt werden? Welche asymptotischen Komplexitäten konnten inzwischen erreicht werden?

### 24. Aufgabe (Das Acht-(oder n)-Damen-Problem (Backtracking)
Beim Schachspiel können sich Damen (beliebig weit) horizontal, vertikal und diagonal bewegen und auf diese Weise andere Figuren bedrohen bzw. schlagen. Beim Acht-Damen-Problem sind acht Damen so auf einem Schachbrett zu verteilen, dass keine Dame eine andere schlagen kann. Allgemeiner sind n Damen auf einem quadratischen (n × n) Spielfeld so zu platzieren, dass keine Dame eine andere bedroht.
Schreiben Sie ein Fortran 95–Programm, welches nach der ”Trial and Error“-Methode versucht, in einer Schleife für einzulesende n jeweils alle Lösungen des n-Damen-Problems zu finden und geeignet auszugeben (entweder graphisch oder pseudo-graphisch mittels geeigneter Zeichen oder Buchstaben, die in n Zeilen und n Spalten angeordnet sind). Zählen Sie hierbei die Lösungen im Programm mit. Die Schleife ist abzubrechen, sobald ein n < 1 eingelesen wird.

Bei der Suche nach Lösungen wird jeweils eine Dame in die erste Zeile der nächsten freien Spalte gesetzt und überprüft, ob diese Dame eine andere schlagen kann. Wenn nicht wird die nächste Dame in die nächste Spalte gesetzt und wieder geprüft. Sollte die zuletzt gesetzte Dame jedoch geschlagen werden können, dann wird sie eine Zeile tiefer gesetzt. Falls sie schon in der untersten Zeile steht, wird sie entfernt und die Dame in der Spalte davor eine Zeile tiefer gesetzt (sogenanntes Backtracking).

Wenn die n-te Dame gesetzt ist und keine andere schlagen kann, ist eine Lösung gefunden. Wenn die erste Dame in der untersten Zeile steht und weitergesetzt werden müsste, dann sind alle Kombinationen überprüft und somit alle Lösungen gefunden.
Diese Art der Lösungssuche kann am besten rekursiv programmiert werden. Schreiben Sie eine rekursive Subroutine, die jeweils eine Dame in die nächste freie Spalte setzt und überprüft, ob sie sicher ist. Ist dies der Fall, so ruft sich die Subroutine selbst rekursiv auf, ansonsten versucht sie, eine andere Position innerhalb derselben Spalte mit einer Dame zu besetzen.
Zur Überprüfung, ob die zuletzt gesetzte Dame geschlagen werden kann, ist eine Funktion zu schreiben.

Optional können Sie versuchen, festzustellen, wieviele fundamental verschiedene Lösungen es gibt, wenn symmetrische Lösungen nicht mitgezählt werden.

Zugehörige Datei: `damenproblem.f95`
