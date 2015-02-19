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
# from the file logsettings.py
from logsettings import LOGSETTINGS

try:
    import logging.config.dictConfig
except ImportError as importError:
    # from the file dictconfig.py
    from dictconfig import dictConfig 
dictConfig(LOGSETTINGS)

if __name__ == '__main__':
    logger = logging.getLogger(__name__)    
    logger.debug('a debug message')


``` 

Bare minimum logging
```
# the default log level is warning.
import logging
logging.warn('This should appear on the console(stderr).')
```
