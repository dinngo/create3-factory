deploy() {
	NETWORK=$1

	forge script script/Deploy.s.sol -f $NETWORK -vvvv --json --broadcast --verify
}

deploy $1
