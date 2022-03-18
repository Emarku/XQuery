
<html>
<body>
<h1> This is the Probability xQuery</h1>
<table style="border: 1px solid #dddddd;margin:25px 0;font-size:1.2em;box-shadow: 0 0 20px;">
<tr>
<th style="background-color: #f5f5f5;text-align:center;">Target</th>
<th style="background-color: #f5f5f5;text-align:center;">Successor</th>
<th style="background-color: #e3e3e3;text-align:center;">Frequency</th>
<th style="background-color: #b3b3b3;text-align:center;">Probability</th>
</tr>

{
let $combine := collection("./?select=*xml")
let $has := $combine//w[lower-case(normalize-space()) = "has"]
for $sibling in distinct-values($has/following-sibling::w[1])
(: use the same FLWOR as freqs query but add siblfrequency calcualation by the value-intersect function definition:)
let $siblfrequency := $has/following-sibling::w[1][. = $sibling]
(: also use the count() function to find the overall ocurrencies in the corpus:)
let $siblprobability := count($siblfrequency) div count($combine//w[lower-case(normalize-space()) = lower-case(normalize-space($sibling))])
order by count($siblfrequency) descending
(: I rounded the probability in the return to show only 6 decimal points for visual satisfaction :)
return <tr>
           <td style="text-align:center;">{head($has)}</td>
           <td style="text-align:center;">{$sibling}</td>
           <td style="text-align:center;">{count($siblfrequency)}</td>
           <td style="text-align:center;">{round($siblprobability, 6)}</td>
       </tr>

}
</table>
</body>

</html>