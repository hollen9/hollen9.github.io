---
layout: page
---

Run this under **tag** folder in order to generate a page for each of your tags. If you added a new tag you need to come to this page and run the script again.

Bash
{% highlight bash %}
{% for tag in site.tags %}
echo $'---\nlayout: tag_index\ntag: {{ tag[0] }} \n---' > '{{ tag[0] }}.md' &{% endfor %}
{% endhighlight %}


Powershell Script
{% highlight powershell %}
{% for tag in site.tags %}
('---', 'layout: tag_index', 'tag: {{ tag[0] }}', '---') -join "`n" | Set-Content -NoNewline '{{ tag[0] }}.md'{% endfor %}
{% endhighlight %}
