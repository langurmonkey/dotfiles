export SVN_EDITOR=vim

# Document Workspaces

export DOCWORKSPACE="$HOME/Workspaces/IDEA-ws"
export SOFWORKSPACE="$HOME/Workspaces/IDEA-ws"
export WS=$SOFWORKSPACE

# LaTeX Environment for Gaia Documents

export TEXINPUTS=".//:./tmp:${DOCWORKSPACE}/DPAC/CU1/docs/common/texmf//:${DOCWORKSPACE}/DPAC/CU3/docs/common//:"
export BSTINPUTS="$TEXINPUTS"
export BIBINPUTS="$BSTINPUTS:$HOME/Gaia/${DOCWORKSPACE}/CU3-Documents-SRS///:"
export DOCCOMMON="${DOCWORKSPACE}/DPAC/CU1/docs/common"

export TEXMFLOCAL="${DOCCOMMON}/texmf/"

# Development Environment

export SOFCOMMON="${SOFWORKSPACE}/DPAC/CU1/software/common"
#export ANT_HOME=`readlink -f /usr/bin/ant | sed "s:bin/ant::"`
export ANT_HOME=/home/tsagrista/Workspaces/IDEA-ws/DPAC/CU1/software/common/apache-ant-1.10.5

export CU3=$WS/DPAC/CU3/software/
export FL=$CU3/FL
export FL_BASE=$FL
export FL_TR=$FL_BASE/Trunk
export FL_22=$FL_BASE/R_22.1.x
export FL_ODAS=$FL_BASE/FL-SmallODAS
export FL_HOME=$FL_ODAS
export CATGEN_HOME=$CU3/CatGen/Trunk
export FLSE=$CU3/FLSE

# Java Installation

export DERBY_HOME=`readlink -f /usr/bin/java | sed "s:jre/bin/java::"`db/

# FL specific library path

export JAVA_LIBRARY_PATH="${SOFWORKSPACE}/netlib.so/"


# Jenkins

export JENKINS_HOME="$HOME/work/Gaia/Jenkins"

alias dpce='ssh -x -A -F $HOME/.ssh/config gaiaro.n1data.lan'
function dpcecp() { scp -F $HOME/.ssh/config gaiaro.n1data.lan:$*; }

alias mdbexp='java -jar $PROGRAMS/Gaia/MDBExplorerStandalone.jar'
alias mdbdict='java -jar $PROGRAMS/Gaia/GaiaMdbDictTool.jar'
