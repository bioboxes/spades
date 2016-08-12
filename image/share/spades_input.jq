[
      {
		"orientation": "fr",
		"type": "paired-end",
		"interlaced reads" : .arguments[] | select(has("fastq")) | .fastq | map(.value)
	}
]
