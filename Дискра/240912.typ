= Бинарные отношения
$A, B eq.not emptyset$

Декартово произведение есть
$A or B = {(a, b | a in A and b in B)}$

$S subset.eq A or B$

$] A, B eq.not emptyset$, тогда *бинарное отношение* --- подмножество их декартова произведения.

$emptyset$ --- пустое бинарное отношение

/ Декартово произведение: Универсальное бинарное отношение между A и B

$Rho(A times B)$

$|A| = n, |B| = m => |Rho(A times B)| = 2^(n m) $

$(a, b) in rho$ --- пара принадлежит бинарному отношению $rho$.\
$a rho b <=> (a, b) in rho$

$rho subset.eq A times A$ --- бинарное отношение на множестве $A$.

$Rho(A times A)$ --- множество всех бинарных отношений, причём $|Rho(A times A)| = 2^(n^2)$, где $n = |A|$.

Рассмотрим $NN$

$(a, b) in = <=> a = b$

$(a, b) in <= <=> a <= b$

$(a, b) in | <=> a | b$ ($a$ является делителем $b$)

$(a, b) in eq.triple_alpha <=> a eq.triple_alpha b$

== Операции над бинарными отношениями
$A, B != emptyset$

$rho, sigma subset.eq A or B$
+ $overline(rho) = {{a, b} in A times B | (a, b) in.not rho}$
+ $rho union sigma = {(a, b) in a times B | (a,b or rho and (a, b) in sigma)}$
+ $rho sect sigma = {(a, b) in a times B | (a,b in rho or (a, b) in sigma)}$
+ $rho^(-1) = {(b, a) in B times A | (a, b) in rho}$
+ $rho subset.eq A times B, sigma subset.eq B times C$ \ $rho circle.small b = {(a, c) in A times C | exists_(b in B) (a, b) in rho and (b, a) in sigma}$

$A = {a, b, c}, B = { 1, 2 }, C = { +, -, !, ?}$

$s = {(a, 2), (b, 1), (b, 2), (c, 1)}$ \
$sigma = {(a, 1), (b, 1), (c, 2)}$ \
$tau = {(1, +), (1, !), (2, ?)}$

$overline(rho) = {(a, 1), (c, 2)}$ \
$sigma = A times B$

=== Ассоциативность операции умножения

$rho  circle.small (sigma circle.small tau) = ... $

== Способы задания бинарных отношений между конечными множествами
$] A eq.not emptyset, rho subset.eq A times B, A = {a_1, dots, a_n}, B = {b_1, dots, b_n}$
$L$ со стрелочкой наверщу (разобраться) --- ориентированный граф.

$A union B$ --- вершины ориентированного графа. Рёбра ведут из вершин множества A в вершины множества B.

#image("image.png")

$rho = {(a, 1), (b, 1), (b, 2), (c, 1)}$

#image(width: 50%, "Снимок экрана от 2024-09-12 11-16-16.png")

$M, N in M_(...)$

$M(rho)$ --- матрица

$(M(rho))_(i j) = cases(1\, text("если") (a_i, b_j) in rho, 0\, text("если") (a_i, b_j) in.not rho)$