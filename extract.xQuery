
<html>
<body>
<h1> This is the Extract xQuery</h1>
<table style="border: 1px solid #dddddd;margin:25px 0;font-size:1.2em;box-shadow: 0 0 20px;">
<tr>
<th style="background-color: #f3f3f3;">Target</th>
<th style="background-color: #f3f3f3;">Successor</th>
</tr>


{
(: I used the combine() function to get all the xml files found in the same path as the query, into one variable so I can use easily :)
let $combine := collection("./?select=*xml")
for $h in $combine//w
(: I used the lower-case()and normalize-space() functions to get all the words "has" 
dispite the white spaces between the words or them being Upper or Lower case :)
where lower-case(normalize-space($h))="has"
order by $h
return <tr>
          <td  style="border: 1px solid #dddddd;text-align:center;">{data($h)}</td>
          <td  style="border: 1px solid #dddddd;text-align:center;">{data($h/following-sibling::w[1])}</td> 
</tr>
}

</table>
</body>

</html>