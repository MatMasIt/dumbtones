declare -A notes
while IFS= read -r line
do
        IFS=' ' read -r -a strN <<< "$line"
	notes["${strN[0]}"]="${strN[1]}"
done < "notes"
printf '%s\n' "${notes[@]}"
while IFS= read -r line
do
	IFS=' ' read -r -a strarr <<< "$line"
	ffplay -f lavfi -i "sine=frequency=${notes[${strarr[0]}]}:duration=${strarr[1]}"  -autoexit -nodisp &>/dev/null
done < $1
