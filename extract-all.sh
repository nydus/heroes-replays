#!/bin/bash
#
# If heroprotocol.py is not in your path, you will need to set the HEROPROTOCOL
# environment variable to be your path.
# e.g. [~/src/heroes-replays]$ HEROPROTOCOL=~/Source/heroprotocol/ ./extract-all.sh

FILES=replays/*.StormReplay
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

for FILE in $FILES
do
  FILENAME="${FILE##*/}"
  BASE="${FILENAME%.*}"
  mkdir json/$BASE
  python $HEROPROTOCOLheroprotocol.py --attributeevents --json $FILE > json/$BASE/replay.attributes.events.json 
  python $HEROPROTOCOLheroprotocol.py --details --json $FILE > json/$BASE/replay.details.json 
  python $HEROPROTOCOLheroprotocol.py --gameevents --json $FILE > json/$BASE/replay.game.events.json 
  python $HEROPROTOCOLheroprotocol.py --initdata --json $FILE > json/$BASE/replay.initdata.json 
  python $HEROPROTOCOLheroprotocol.py --messageevents --json $FILE > json/$BASE/replay.message.events.json 
  python $HEROPROTOCOLheroprotocol.py --trackerevents --json $FILE > json/$BASE/replay.tracker.events.json 
  python $HEROPROTOCOLheroprotocol.py --header --json $FILE > json/$BASE/header.json 
done

cd -
