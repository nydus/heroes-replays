#!/bin/bash
#
# If heroprotocol.py is not in your path, you will need to set the HEROPROTOCOL
# environment variable to be your path.
# e.g. [~/src/heroes-replays]$ HEROPROTOCOL=~/Source/heroprotocol/ ./extract.sh

FILE=$1
FILENAME="${FILE##*/}"
BASE="${FILENAME%.*}"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
mkdir json/$BASE
python ${HEROPROTOCOL}heroprotocol.py --attributeevents --json $FILE > json/$BASE/replay.attributes.events.json 
python ${HEROPROTOCOL}heroprotocol.py --details --json $FILE > json/$BASE/replay.details.json 
python ${HEROPROTOCOL}heroprotocol.py --gameevents --json $FILE > json/$BASE/replay.game.events.json
python ${HEROPROTOCOL}heroprotocol.py --initdata --json $FILE > json/$BASE/replay.initdata.json 
python ${HEROPROTOCOL}heroprotocol.py --messageevents --json $FILE > json/$BASE/replay.message.events.json 
python ${HEROPROTOCOL}heroprotocol.py --trackerevents --json $FILE > json/$BASE/replay.tracker.events.json 
python ${HEROPROTOCOL}heroprotocol.py --header --json $FILE > json/$BASE/header.json 
cd -
