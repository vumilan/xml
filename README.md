# XML semestral work

## Commands:
#### DTD
```
xmllint --noout --dtdvalid country_fact_document.dtd country_fact_document.xml
```
#### RelaxNG
```
xmllint --noout --relaxng country_fact_document.rng country_fact_document.xml
```
#### xHTML
```
cd xhtml
java -jar /path/saxon9he.jar ../country_fact_document.xml xhtml-transformation.xslt
```
#### PDF
```
cd pdf
fop -xml ../country_fact_document.xml -xsl pdf-transformation.xsl -pdf pdf-output.pdf
```
## Assignment:

- Vytvořte XML dokument se všemi daty pro každou zadanou oblast (z
  https://www.cia.gov/library/publications/the-world-factbook/). Pokud
  nezvládnete v dokumentu uvést všechna data o dané oblasti (např. protože
  se rozhodnete vytvářet XML manuálně), uveďte alespoň základní data u
  všech hlavních sekcí (tj. Introduction, Geography, atd.). Dále spojte XML
  dokumenty pro jednotlivé oblasti do jediného dokumentu pomocí DTD.

- Vytvořte schema pomocí DTD i RelaxNG pro validaci struktury XML
  dokumentů. V RelaxNG schema se pokuste využít alespoň některé možnosti
  pokročilejší validace co jazyk nabízí navíc oproti DTD.

- Pomocí XSLT vygenerujte (X)HTML výstupy (tj. souhrný index obsahující
  odkazy na jednotlivé oblasti a samostatnou stránku pro každou oblast
  obsahující detailní informace).

- Pomocí XSL-FO vygenerujte PDF výstup (tj. dokument obsahující odkazy na
  jednotlivé oblasti a detailní informace o každé oblasti).

- Buď vygenerujte ePub výstup (tj. ebook připravený k načtení v software
  podporujícím ePub formát), nebo do (X)HTML a PDF výstupů přidejte obrázky
  (stačí vlajky nebo mapy a podobně), navigaci pro sekce s detailními
  informacemi (stačí pro hlavní sekce jako "Introduction", "Geography",
  atd.) a rozšiřte základní formátování aby byly výstupy více přehledné
  (použijte CSS a možnosti formátování v XSL-FO včetně číslování stran a
  přidání záhlaví či zápatí).

- Schema (DTD i RelaxNG), stylesheety (XSLT i XSL-FO) a další části
  projektu tvořte adekvátně obecné aby byla zajištěna funkčnost pro všechny
  zadané oblasti. Všechny XML dokumenty musí být well-formed a valid. I
  základní výstupy bez rozšířeného formátování musí být adekvátně čitelné
  (tj. alespoň by mělo jít rozlišit nadpisy a odstavce, případně i další
  prvky jako seznamy, odkazy, atd.).

- Soubory projektu (bez použitého software) zabalte do ZIP nebo TAR archivu
  a pošlete na email vyučujícího. Do archivu také přidejte seznam použitých
  příkazů (nebo skript s čitelným zdrojovým kódem co tyto příkazy
  automaticky provede) a krátký popis projektu (adresářová struktura,
  potřebný software, atd.).

- Případně projekt tvořte pomocí veřejně přístupného GIT repozitáře a
  následně stačí na email vyučujícího zaslat jen odkaz na GIT repozitář.
