#! /bin/bash
#
# git pull to update the listed repos
#

jayjaycodyDir=/jayjaycody

repos="hci_qa hci_qa.wiki jaycodylab.com jayjaycody.github.io jayjaycody.github.io.wiki lamp-stack lamp-stack.wiki mypy mypy.wiki nature-of-code-examples nodejs starnb.com swift test-automation test-automation.wiki wear web-app-tests web-dev web-dev.wiki"

for i in $repos
do
	echo "*** Updating $i ***"
	cd "$jayjaycodyDir/$i"
	git pull --no-edit
	echo ""
done


for i in $repos
do
	echo "*** Git Status for $i ***"
	cd "$jayjaycodyDir/$i"
	git status
	echo ""
done


