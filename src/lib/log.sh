function log { # $MSG
	local msg="${1}"

	if ((LOG)); then 
		echo -e "[$(date "+%Y-%m-%d %H:%M:%S")] ${msg}" >> "${LOG_FILE}"
	fi
}