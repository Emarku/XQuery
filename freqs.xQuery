
<html>
<body>
<h1> This is the Frequency xQuery</h1>
<table style="border: 1px solid #dddddd;margin:25px 0;font-size:1.2em;box-shadow: 0 0 20px;">
<tr>
<th style="background-color: #f5f5f5;">Target</th>
<th style="background-color: #f5f5f5;">Successor</th>
<th style="background-color: #e3e3e3;">Frequency</th>
</tr>

{
let $combine := collection("./?select=*xml")
let $has := $combine//w[lower-case(normalize-space()) = "has"]
(: I used the distinct-value() function to get distinc words in a sequence :)
for $dist in distinct-values($has/following-sibling::w[1])
(: here I used the value-intersect function definition to get a single sequence of values with no repetition:)
let $dupl := $has/following-sibling::w[1] [.=$dist]
order by count($dupl) descending
(:used the head() function in the first column so I get the word "has" only one time in each cell :)
return <tr>
           <td style="border: 1px solid #dddddd;text-align:center;">{head($has)}</td>
           <td style="border: 1px solid #dddddd;text-align:center;">{$dist}</td>
           <td style="border: 1px solid #dddddd;text-align:center;">{count($dupl)}</td>
       </tr>
}
</table>
</body>

</html>