
## Making tutorials


## Czech glosses

* extract terms
```
grep -oP '\\txx\{\K[^}]+' hg8011-*.tex | sort -u
```

* prompt AI
```
Thanks.   Here is a list of extracted terms, can you merge similar ones, then add a Czech translation, formatted like the table below?

\begin{longtable}{ll}
  English & Čestina \\\hline \endhead
Q & otázka (Q) \\
analysis & analýza \\
autonomous & autonomní \\
```

* Add to the end
```
\myslide{Glossary of Key Terms (English--Czech)}
```
