
<html>
<body>
<h1> This is the Top20  xQuery</h1>
<table style="border: 1px solid #dddddd;margin:25px 0;font-size:1.2em;box-shadow: 0 0 20px;">
<tr>
<th style="background-color: #f5f5f5;text-align:center;">Target</th>
<th style="background-color: #f5f5f5;text-align:center;">Successor</th>
<th style="background-color: #b3b3b3;text-align:center;">Probability</th>
</tr>

{
(: add round brackets so I can restrict the results in the table to 20 :)
(
let $combine := collection("./?select=*xml")
let $has := $combine//w[lower-case(normalize-space()) = "has"]
for $sibling in distinct-values($has/following-sibling::w[1])
let $siblfrequency := $has/following-sibling::w[1][. = $sibling]
let $siblprobability := count($siblfrequency) div count($combine//w[lower-case(normalize-space()) = lower-case(normalize-space($sibling))])
(:I changed the ordering from the frequency to the probability so I can get the top results first :)
order by $siblprobability descending
return <tr>
           <td style="text-align:center;">{"has"}</td>
           <td style="text-align:center;">{$sibling}</td>
           <td style="text-align:center;">{round($siblprobability,6)}</td>
       </tr>
)
(: I used the position() function to say that the maximun position number this sequence can get is 20, 
   so I get only the first 20 positions :)
       [position() <= 20]
}
</table>
</body>

</html>