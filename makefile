all: readme

readme: guessinggame.sh
	echo "# Gessing Game" > README.md
	echo "" >> README.md
	date "+File generated at **%Y-%m-%d %H:%M:%S**" >> README.md
	echo "" >> README.md
	echo "**Lines of Code in guessinggame.sh:** $$(wc -l < guessinggame.sh | sed -E "s/ +//" )" >> README.md
