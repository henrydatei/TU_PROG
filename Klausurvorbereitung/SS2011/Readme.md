### 1. Aufgabe: Automatische Differentiation

Eine Differentiationsarithmetik ist eine Arithmetik geordneter Paare der Form U = (u,u'). In der ersten Komponente von U steht der Funktionswert, in der zweiten der Wert der Ableitung. Die Regeln für die Arithmetik lauten dann (...). Für eine beliebige Konstante c und die unabhängige Variable x folgt
 C = (c,0) und X = (x,1).

Verwendet man in einer Funktion f als Argument und Ergebnis solche geordneten Paare und diese Rechenregeln, so erhält man wegen f(X) = f((x,1)) = (f(x),f'(x)) zusätzlich zum Funktionswert automatisch den Wert der Ableitung mitberechnet.

Schreiben Sie einen Fortran 95-Modul mit
- einer Definition des abstrakten Datentyps `diff` mit zwei reellwertigen geschützten Komponenten `value` und `deriv` für die Differentiationsarithmetik,
- Funktionen für die Operationen `+`, `∗`und `/` (Die Subtraktion soll weggelassen werden!) für den Datentyp `diff` und entsprechenden Operatorüberladungen,
- der Funktion `diffcon` vom Typ `diff`, welche zu einer gegebenen reellwertigen Konstante c das geordnete Paar C berechnet,
- der Funktion `diffvar` vom Typ `diff`, welche zu einer gegebenen reellwertigen Variable x das geordnete Paar X berechnet,
- einer Subroutine `put` zur kommentierten Ausgabe eines als Argument übergebenen Objektes vom Typ `diff`,
- einer Funktion f(x) = (x + 4)/(x^2 + 5) mit Ergebnis vom Typ `diff`

Unter Verwendung dieses Moduls sollen im Fortran 95-Hauptprogramm nun so lange reelle Zahlen a und b mit a ≤ b und eine Schrittweite h von der Tastatur eingelesen werden, bis beide Ungleichungen erfüllt sind. Nun sollen f(x) und f′(x) für x = a, a + h, a + 2h, ... so lange berechnet und mittels `put` kommentiert ausgegeben werden, bis die Auswertestelle x die rechte Intervallgrenze b übersteigt.
