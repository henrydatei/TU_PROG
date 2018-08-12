### 1. Aufgabe: Spärlich besetzte Vektoren (verkettete Listen)
Ein Vektor heißt spärlich besetzt, wenn viele oder die meisten seiner Komponenten gleich null sind. Ein solcher Vektor v = (v_i) kann durch eine einfach verkettete, nicht zyklische Liste von Elementen, die jeweils einen (ganzzahligen) Index i > 0 und den reellen Wert der zugehörigen Komponente v_i != 0 enthalten, dargestellt werden.

Das Skalarprodukt s = v · w zweier reeller Vektoren v und w mit je n Komponenten ist die reelle Zahl (...) Für spärlich besetzte Vektoren bedeutet dies, dass nur Komponenten mit einem Index, der in beiden Vektoren (Listen) vorkommt, etwas zur Summe beitragen.

Definieren Sie in einem Fortran 95–Modul sparmod
- einen Datentyp `content` mit einer ganzzahligen Komponente für den Index i und einer reellen Komponente für den Wert v_i der i-ten Komponente eines spärlich besetzten Vektors v,
- inen Datentyp `node` für ein Listenelement in einer einfach verketteten Liste, mit einer Komponente des Typs `content` (für eine Vektorkomponente) und einer Zeiger-Komponente, die auf das nächste Listenelement zeigt (falls vorhanden),
- einen Datentyp `sparvektor` mit einer Zeiger-Komponente des Typs `node`, die auf das erste Listenelement eines spärlich besetzten Vektors zeigt,
- eine Subroutine `lesevektor`, die so lange Paare (i,v_i) einliest und in einen neu zu erzeugenden, spärlich besetzten Vektor (jeweils am Ende der Liste) einträgt, bis ein Paar mit Index i ≤ 0 eingelesen wird (Es darf vorausgesetzt werden, dass die einzulesenden Paare nach aufsteigenden Indizes geordnet sind, dass sich kein Index wiederholt und dass für die einzulesenden Paare stets v_i != 0 gilt.) und
- einen Operator `*` nebst implementierender Funktion zur Berechnung des Skalarprodukts zweier spärlich besetzter Vektoren.

Schreiben Sie ein Fortran 95–Hauptprogramm, das mit Hilfe des Moduls `sparmod`
- zwei spärlich besetzte Vektoren v und w einliest,
- ihre Beträge |v| und |w| und das Skalarprodukt v · w berechnet und
- die berechneten Werte mit entsprechenden Kommentaren ausgibt.
