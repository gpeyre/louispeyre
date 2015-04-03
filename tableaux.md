---
layout: page
title: "Louis Peyré"
description: "tableaux"
header-img: "img/nature-morte-2.jpg"
---

Vous pourrez trouver ci dessous des liens vers différentes galeries thématiques.

<div align="center">

<table>

<tr>
{% for gal in site.data.galleries %}
	<td align="center">
  	<a href="{{ site.baseurl }}/{{ gal.page }}/">
  		{% if gal.orient == "H" %}
			<img src="imgs/{{ gal.img }}.jpg" width="200" style="border-color:white" style="padding:10px" alt="{{ gal.name }}"/>
		{% else %}
			<img src="imgs/{{ gal.img }}.jpg" height="200" style="border-color:white" style="padding:10px" alt="{{ gal.name }}"/>
		{% endif %}
	</a>
	<br/>
	{{ gal.name }}
	</td>
{% endfor %}
</tr>


</table>

</div>
