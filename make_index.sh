(find posts/* -maxdepth 1 | while read -r file; do echo "<a href=\""$file"\">"$(cat $file | grep -o '<title>.*</title>' | sed 's/\(<title>\|<\/title>\)//g')"</a>"; done) | grep -o '<a href="posts/[^(?!_)].*">.\{1,\}</a>' | sed 's/"/\\"/g' | awk '{ printf("%s<br/>", $0) }' | xargs -I '{}' sed -e 's|{{ INDEX }}|{}|g' index_template.html

