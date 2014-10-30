try:
	import readline
	import os, atexit
except ImportError:
	print "Import error: can't import readline module."
else:
	histfile = os.path.join(os.environ["HOME"], ".pythonhistory")
	import rlcompleter
	readline.parse_and_bind("tab: complete")
	if os.path.isfile(histfile):
		readline.read_history_file(histfile)
	atexit.register(readline.write_history_file, histfile)
	del os, histfile, readline, rlcompleter, atexit
	print "Python shell history and tab completion are enabled."
