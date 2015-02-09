# Python Logging
## Add/Enable app logging quickly.

### Import the logging into the module
Import the builtin logging features from python.

```
import logging
import logging.config

```

If you are using python version 2.6, add the dictConfig.py otherwise use the 
builtin dictConfig

```
try:
    import logging.config.dictConfig
except ImportError as importError:
    # from the file dictconfig.py
    import dictconfig

# from the file logsettings.py
from logsettings import LOGSETTINGS
``` 

Bare minimum logging
```
# the default log level is warning.
import logging
logging.warn('This should appear on the console(stderr).')
```
